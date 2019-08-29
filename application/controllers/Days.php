<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Days extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Days_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $days = $this->Days_model->get_all();
        
        $data = array(
            'days_data' => $days
        );
        
        $this->template->display('days/tb_days_list', $data);
    }

    public function read($id) {
        $row = $this->Days_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'days_desc' => $row->days_desc,
            );
            $this->template->display('days/tb_days_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('days'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('days/create_action'),
            'id' => set_value('id'),
            'days_desc' => set_value('days_desc'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('days/tb_days_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'days_desc' => $this->input->post('days_desc', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );
           
            $this->Days_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('days'));
        }
    }

    public function update($id) {
        $row = $this->Days_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('days/update_action'),
                'id' => set_value('id', $row->id),
                'days_desc' => set_value('days_desc', $row->days_desc),
            );
            $this->template->display('days/tb_days_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('days'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'days_desc' => $this->input->post('days_desc', TRUE),
            );

            $this->Days_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('days'));
        }
    }

    public function delete($id) {
        $row = $this->Days_model->get_by_id($id);

        if ($row) {
            $this->Days_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('days'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('days'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('days_desc', 'days_desc', 'trim|required|max_length[12]');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_days.xls";
        $judul = "tb_days";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Description");
        xlsWriteLabel($tablehead, $kolomhead++, "Uid");

        foreach ($this->Days_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteNumber($tablebody, $kolombody++, $data->days_desc);
            xlsWriteNumber($tablebody, $kolombody++, $data->uid);

            $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Days.php */
/* Location: ./application/controllers/Days.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-19 09:43:57 */