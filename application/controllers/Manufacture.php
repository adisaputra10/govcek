<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Manufacture extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Manufacture_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $manufacture = $this->Manufacture_model->get_all();

        $data = array(
            'manufacture_data' => $manufacture
        );

        $this->template->display('manufacture/tb_manufacture_list', $data);
    }

    public function read($id) {
        $row = $this->manufacture_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'manufacture_name' => $row->manufacture_name,                
            );
            $this->template->display('manufacture/tb_manufacture_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('manufacture'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('manufacture/create_action'),
            'id' => set_value('id'),
            'manufacture_name' => set_value('manufacture_name'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('manufacture/tb_manufacture_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'manufacture_name' => $this->input->post('manufacture_name', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Manufacture_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('manufacture'));
        }
    }

    public function update($id) {
        $row = $this->Manufacture_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('manufacture/update_action'),
                'id' => set_value('id', $row->id),
                'manufacture_name' => set_value('manufacture_name', $row->manufacture_name),
            );
            $this->template->display('manufacture/tb_manufacture_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('manufacture'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'manufacture_name' => $this->input->post('manufacture_name', TRUE),
            );

            $this->Manufacture_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('manufacture'));
        }
    }

    public function delete($id) {
        $row = $this->Manufacture_model->get_by_id($id);

        if ($row) {
            $this->Manufacture_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('manufacture'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('manufacture'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('manufacture_name', 'manufacture_name', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_manufacture.xls";
        $judul = "tb_manufacture";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Manufacture Name");

        foreach ($this->Manufacture_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->manufacture);

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