<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Status extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Status_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $status = $this->Status_model->get_all();

        $data = array(
            'status_data' => $status
        );

        $this->template->display('status/tb_status_list', $data);
    }

    public function read($id) {
        $row = $this->Status_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id'            => $row->id,
                'status_name'   => $row->status_name,                
            );
            $this->template->display('status/tb_status_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('status'));
        }
    }

    public function create() {
        $data = array(
            'button'    => 'Create',
            'action'    => site_url('status/create_action'),
            'id'        => set_value('id'),
            'status_name' => set_value('status_name'),
            'uid'       => $this->session->userdata('user_id'),
        );
        $this->template->display('status/tb_status_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'status_name'   => $this->input->post('status_name', TRUE),
                'uid'           => $this->session->userdata('user_id'),
            );

            $this->Status_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('status'));
        }
    }

    public function update($id) {
        $row = $this->Status_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button'    => 'Update',
                'action'    => site_url('status/update_action'),
                'id'        => set_value('id', $row->id),
                'status_name' => set_value('status_name', $row->status_name),
            );
            $this->template->display('status/tb_status_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('status'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'status_name' => $this->input->post('status_name', TRUE),
            );

            $this->Status_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('status'));
        }
    }

    public function delete($id) {
        $row = $this->Status_model->get_by_id($id);

        if ($row) {
            $this->Status_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('status'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('status'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('status_name', 'status_name', 'trim|required');
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
            xlsWriteLabel($tablebody, $kolombody++, $data->Status_name);

            $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Status.php */
/* Location: ./application/controllers/Location.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2016-05-14 11:09:25 */