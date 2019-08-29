<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Basic_type extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Basic_type_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $basic_type = $this->Basic_type_model->get_all();

        $data = array(
            'basic_type_data' => $basic_type
        );

        $this->template->display('basic_type/tb_basic_type_list', $data);
    }

    public function read($id) {
        $row = $this->Basic_type_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'type_description' => $row->type_description,                
            );
            $this->template->display('basic_type/tb_basic_type_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('basic_type'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('basic_type/create_action'),
            'id' => set_value('id'),
            'type_description' => set_value('type_description'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('basic_type/tb_basic_type_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'type_description' => $this->input->post('type_description', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Basic_type_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('basic_type'));
        }
    }

    public function update($id) {
        $row = $this->Basic_type_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('basic_type/update_action'),
                'id' => set_value('id', $row->id),
                'type_description' => set_value('type_description', $row->type_description),
            );
            $this->template->display('basic_type/tb_basic_type_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('basic_type'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'type_description' => $this->input->post('type_description', TRUE),
            );

            $this->Basic_type_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('basic_type'));
        }
    }

    public function delete($id) {
        $row = $this->Basic_type_model->get_by_id($id);

        if ($row) {
            $this->Basic_type_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('basic_type'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('basic_type'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('type_description', 'type_description', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_basic_type.xls";
        $judul = "tb_unit";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Type Description");

        foreach ($this->Unit_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->type_description);

            $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Basic_type.php */
/* Location: ./application/controllers/Basic_type.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-19 13:09:25 */