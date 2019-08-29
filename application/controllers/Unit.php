<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Unit extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Unit_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $unit = $this->Unit_model->get_all();

        $data = array(
            'unit_data' => $unit
        );

        $this->template->display('unit/tb_unit_list', $data);
    }

    public function read($id) {
        $row = $this->Unit_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'description' => $row->description,                
            );
            $this->template->display('unit/tb_unit_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('unit'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('unit/create_action'),
            'id' => set_value('id'),
            'description' => set_value('description'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('unit/tb_unit_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'description' => $this->input->post('description', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Unit_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('unit'));
        }
    }

    public function update($id) {
        $row = $this->Unit_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('unit/update_action'),
                'id' => set_value('id', $row->id),
                'description' => set_value('unit', $row->description),
            );
            $this->template->display('unit/tb_unit_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('unit'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'description' => $this->input->post('description', TRUE),
            );

            $this->Unit_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('unit'));
        }
    }

    public function delete($id) {
        $row = $this->Unit_model->get_by_id($id);

        if ($row) {
            $this->Unit_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('unit'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('unit'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('description', 'description', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_unit.xls";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Desription");

        foreach ($this->Unit_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->description);

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