<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Inspection_schedule extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Inspection_schedule_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $inspection_schedule = $this->Inspection_schedule_model->get_all();

        $data = array(
            'inspection_schedule_data' => $inspection_schedule
        );

        $this->template->display('inspection_schedule/tb_inspection_schedule_list', $data);
    }

    public function read($id) {
        $row = $this->Inspection_schedule_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'inspection_name' => $row->inspection_name,                
            );
            $this->template->display('inspection_schedule/tb_inspection_schedule_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspection_schedule'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('inspection_schedule/create_action'),
            'id' => set_value('id'),
            'inspection_name' => set_value('inspection_name'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('inspection_schedule/tb_inspection_schedule_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'inspection_name' => $this->input->post('inspection_name', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Inspection_schedule_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('inspection_schedule'));
        }
    }

    public function update($id) {
        $row = $this->Inspection_schedule_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('inspection_schedule/update_action'),
                'id' => set_value('id', $row->id),
                'inspection_name' => set_value('inspection_name', $row->inspection_name),
            );
            $this->template->display('inspection_schedule/tb_inspection_schedule_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspection_schedule'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'inspection_name' => $this->input->post('inspection_name', TRUE),
            );

            $this->Inspection_schedule_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('inspection_schedule'));
        }
    }

    public function delete($id) {
        $row = $this->Inspection_schedule_model->get_by_id($id);

        if ($row) {
            $this->Inspection_schedule_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('inspection_schedule'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspection_schedule'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('inspection_name', 'inspection_name', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_inspection_schedule.xls";
        $judul = "tb_inspection_name";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Inspection Name");

        foreach ($this->Inspection_schedule_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->inspection_name);

            $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Inspection_schedule.php */
/* Location: ./application/controllers/Inspection_schedule.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-27 11:09:25 */