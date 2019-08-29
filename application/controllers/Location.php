<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Location extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Location_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $location = $this->Location_model->get_all();

        $data = array(
            'location_data' => $location
        );

        $this->template->display('location/tb_location_list', $data);
    }

    public function read($id) {
        $row = $this->Location_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'location_name' => $row->location_name,                
            );
            $this->template->display('location/tb_location_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('location'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('location/create_action'),
            'id' => set_value('id'),
            'location_name' => set_value('location_name'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('location/tb_location_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'location_name' => $this->input->post('location_name', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Location_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('location'));
        }
    }

    public function update($id) {
        $row = $this->Location_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('location/update_action'),
                'id' => set_value('id', $row->id),
                'location_name' => set_value('location_name', $row->location_name),
            );
            $this->template->display('location/tb_location_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('location'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'location_name' => $this->input->post('location_name', TRUE),
            );

            $this->Location_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('location'));
        }
    }

    public function delete($id) {
        $row = $this->Location_model->get_by_id($id);

        if ($row) {
            $this->Location_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('location'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('location'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('location_name', 'location_name', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_location.xls";
        $judul = "tb_location";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Location Name");

        foreach ($this->Unit_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->location_name);

            $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Location.php */
/* Location: ./application/controllers/Location.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2016-05-14 11:09:25 */