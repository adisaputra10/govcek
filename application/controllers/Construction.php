<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Construction extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Construction_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $construction = $this->Construction_model->get_all();

        $data = array(
            'construction_data' => $construction
        );

        $this->template->display('construction/tb_construction_list', $data);
    }

    public function read($id) {
        $row = $this->Construction_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'construction_name' => $row->construction_name,                
            );
            $this->template->display('construction/tb_construction_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('construction'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('construction/create_action'),
            'id' => set_value('id'),
            'construction_name' => set_value('construction_name'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('construction/tb_construction_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'construction_name' => $this->input->post('construction_name', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Construction_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('construction'));
        }
    }

    public function update($id) {
        $row = $this->Construction_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('construction/update_action'),
                'id' => set_value('id', $row->id),
                'construction_name' => set_value('construction_name', $row->construction_name),
            );
            $this->template->display('construction/tb_construction_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('construction'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'construction_name' => $this->input->post('construction_name', TRUE),
            );

            $this->Construction_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('construction'));
        }
    }

    public function delete($id) {
        $row = $this->Construction_model->get_by_id($id);

        if ($row) {
            $this->Construction_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('construction'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('construction'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('construction_name', 'construction_name', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_construction.xls";
        $judul = "tb_construction";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Construction Name");

        foreach ($this->Construction_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->construction_name);

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
/* Generated by Harviacode Codeigniter CRUD Generator 2016-05-14 11:09:25 */