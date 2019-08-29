<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Inspector extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Inspector_model');
        $this->load->model('End_user_model');
        $this->load->model('Tb_users_model');
        $this->load->model('Manufacture_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $inspector = $this->Inspector_model->get_all();
        $end_user = $this->Tb_users_model->get_all();
        //echo "<pre>";print_r($end_user);die();

        $data = array(
            'inspector_data' => $inspector,
            'end_user' => $end_user,
        );
        //echo '<pre>';print_r($inspector);die();
        $this->template->display('inspector/tb_inspector_list', $data);
    }

    public function read($id) {
        $row = $this->Inspector_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'inspector_name' => $row->inspector_name,                
            );
            $this->template->display('inspector/tb_inspector_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspector'));
        }
    }

    public function create() {
        $uid = $this->session->userdata('user_id');
        $data = array(
            'button' => 'Create',
            'action' => site_url('inspector/create_action'),
            'id' => set_value('id'),
            'inspector_name' => set_value('inspector_name'),
            'uid' => $uid,
        );
        //$data['manufacture'] = $this->db->get_where('manufacture', array('uid' => $uid))->result();       
        $data['manufacture'] = $this->Manufacture_model->get_all();
        $data['end_user'] = $this->Tb_users_model->get_tb_users();
        //$a = $this->Tb_users_model->get_tb_users(); echo '<pre>';print_r($a);die();
        $this->template->display('inspector/tb_inspector_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'inspector_name' => $this->input->post('inspector_name', TRUE),
                'uid' => $this->session->userdata('user_id'),
                'manufacture_id' => $this->input->post('manufacture_id'),
                'link_to_user' => $this->input->post('tb_users_id'),
            );
            //echo '<pre>';print_r($data);die();

            $this->Inspector_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('inspector'));
        }
    }

    public function update($id) {
        $row = $this->Inspector_model->get_by_id($id);  
        
        $m_row = $this->Manufacture_model->get_by_id($row[0]->manufacture_id); 
        $uid = $this->session->userdata('user_id');
        
        $inspector = $this->Inspector_model->get_all();
        $end_user = $this->Tb_users_model->get_all();
        //echo '<pre>'; print_r($inspector);die(); 

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('inspector/update_action'),
                'id' => set_value('id', $row[0]->id),
                'inspector_name' => set_value('inspector_name', $row[0]->inspector_name),
                'manufacture_id' => set_value('manufacture_id', $row[0]->manufacture_id),
                'tb_users_id' => set_value('tb_users_id',$row[0]->link_to_user),

            );
            $m_name = $this->db->get_where('manufacture', array('id' => $row[0]->manufacture_id))->result();
            $data['manufacture'] = $this->Manufacture_model->get_all();
            $data['end_user'] = $this->Tb_users_model->get_tb_users();
            $data['manufacture_name'] = $row[0]->manufacture_name;
            $data['username'] = $row[0]->username;
            $this->template->display('inspector/tb_inspector_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspector'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'inspector_name' => $this->input->post('inspector_name', TRUE),
                'manufacture_id' => $this->input->post('manufacture_id', TRUE),
                'link_to_user' => $this->input->post('tb_users_id', TRUE),
            );

            $this->Inspector_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('inspector'));
        }
    }

    public function delete($id) {
        $row = $this->Inspector_model->get_by_id($id);

        if ($row) {
            $this->Inspector_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('inspector'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspector'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('inspector_name', 'inspector_name', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_inspector.xls";
        $judul = "tb_inspector";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Inspector Name");

        foreach ($this->Construction_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->inspector_name);

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