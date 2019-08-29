<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Checklist extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Checklist_model');
        $this->load->model('Category_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $checklist = $this->Checklist_model->get_all();

        $data = array(
            'checklist_data' => $checklist
        );

        $this->template->display('checklist/tb_checklist_list', $data);
    }

    public function read($id) {
        $row = $this->Checklist_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'checklist' => $row->checklist,                
            );
            $this->template->display('checklist/tb_checklist_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('checklist'));
        }
    }

    public function create() {
        $category = $this->Category_model->get_all();

        $data = array(
            'button'            => 'Create',
            'action'            => site_url('checklist/create_action'),
            'id'                => set_value('id'),
            'checklist_name'    => set_value('checklist_name'),
            'uid'               => $this->session->userdata('user_id'),
            'active'            => set_value('active'),
        );

        $data['category'] = $category;
        $data['message'] = '';
        $this->template->display('checklist/tb_checklist_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'checklist_name' => $this->input->post('checklist_name', TRUE),
                'active' => $this->input->post('active', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Checklist_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('checklist'));
        }
    }

    public function update($id) {
        $row = $this->Checklist_model->get_by_id($id);
        //echo $row->checklist_name.'<pre>';print_r($row);die();
        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('checklist/update_action'),
                'id' => set_value('id', $row->id),
                'checklist_name' => set_value('checklist_name', $row->checklist_name),
                'active' => set_value('active', $row->active),
            );
            $this->template->display('checklist/tb_checklist_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('checklist'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'checklist_name' => $this->input->post('checklist_name', TRUE),
                'active' => $this->input->post('active', TRUE),
            );

            $this->Checklist_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('checklist'));
        }
    }

    public function delete($id) {
        $row = $this->Checklist_model->get_by_id($id);

        if ($row) {
            $this->Checklist_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('checklist'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('checklist'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('checklist_name', 'checklist_name', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_checklist.xls";
        $judul = "tb_checklist";
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
        xlsWriteLabel($tablehead, $kolomhead++, "checklist");

        foreach ($this->Checklist_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->checklist_name);

            $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Checklist.php */
/* Location: ./application/controllers/Checklist.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-121 10:09:25 */