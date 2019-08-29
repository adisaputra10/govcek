<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Schedule extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Schedule_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $category = $this->Schedule_model->get_all();

        $data = array(
            'schedule_data' => $category
        );

        $this->template->display('schedule/tb_schedule_list', $data);
    }

    public function read($id) {
        $row = $this->Schedule_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'schedule' => $row->schedule,      
                'interval_value' => $row->interval_value,     
                'interval_label' => $row->interval_label,      
            );
            $this->template->display('schedule/tb_schedule_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('schedule'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('schedule/create_action'),
            'id' => set_value('id'),
            'schedule' => set_value('schedule'),
            'interval_value' => set_value('interval_value'),
            'interval_label' => set_value('interval_label'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('schedule/tb_schedule_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'schedule' => $this->input->post('schedule', TRUE),
                'interval_value' => $this->input->post('interval_value', TRUE),
                'interval_label' => $this->input->post('interval_label', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Schedule_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('schedule'));
        }
    }

    public function update($id) {
        $row = $this->Schedule_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('schedule/update_action'),
                'id' => set_value('id', $row->id),
                'schedule' => set_value('schedule', $row->schedule),
                'interval_value' => set_value('interval_value', $row->interval_value),
                'interval_label' => set_value('interval_label', $row->interval_label),
            );
            $this->template->display('schedule/tb_schedule_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('schedule'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'schedule' => $this->input->post('schedule', TRUE),
                'interval_value' => $this->input->post('interval_value', TRUE),
                'interval_label' => $this->input->post('interval_label', TRUE),
            );

            $this->Schedule_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('schedule'));
        }
    }

    public function delete($id) {
        $row = $this->Schedule_model->get_by_id($id);

        if ($row) {
            $this->Schedule_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('schedule'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('schedule'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('schedule', 'schedule', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_schedule.xls";
        $judul = "tb_schedule";
        $tablehead = 0;
        $tablebody = 1;
        $nourut = 1;
        //penulisan header
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header("Content-Disposition: attachment;filename=" . $namaFile . "");
        header("Content-Transfer-Encoding: binary ");

        xlsBOF();

        $kolomhead = 0;
        xlsWriteLabel($tablehead, $kolomhead++, "No");
        xlsWriteLabel($tablehead, $kolomhead++, "Schedule");

        foreach ($this->Category_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->schedule);

            $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Pelanggan.php */
/* Location: ./application/controllers/Pelanggan.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-14 11:09:25 */