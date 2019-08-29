<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class End_user extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('End_user_model');
        $this->load->model('Schedule_model');
        $this->load->model('Unit_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $end_user = $this->End_user_model->get_all();
        //echo '<pre>'; print_r($end_user); die();
        $data = array(
            'end_user_data' => $end_user
        );

        $this->template->display('end_user/tb_end_user_list', $data);
    }

    public function read($id) {
        $row = $this->End_user_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'type_description' => $row->type_description,                
            );
            $this->template->display('end_user/tb_end_user_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('end_user'));
        }
    }

    public function create() {
        $schedule   = $this->Schedule_model->get_all();
        $unit       = $this->Unit_model->get_all();
        $endUser    = $this->End_user_model->get_all();

        $data = array(
            'button' => 'Create',
            'action' => site_url('end_user/create_action'),
            'id' => set_value('id'),
            'company' => set_value('company'),
            'contact_name' => set_value('contact_name'),
            'division' => set_value('division'),
            'address' => set_value('address'),
            'city' => set_value('city'),
            'state_prov' => set_value('state_prov'),
            'postal_code' => set_value('postal_code'),
            'email' => set_value('email'),
            'phone' => set_value('phone'),
            'fax' => set_value('fax'),
            'mobile' => set_value('mobile'),
            'note' => set_value('note'),
            'inspection_schedule_id' => set_value('inspection_schedule_id'),
            'unit_system_id' => set_value('unit_system_id'),
            'major_id' => set_value('major_id'),
            'uid' => $this->session->userdata('user_id'),
        );

        $data['inspection_schedule'] = $schedule;
        $data['unit_system'] = $unit;
        $data['end_user'] = $endUser;
        $this->template->display('end_user/tb_end_user_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'company' => $this->input->post('company', TRUE),
                'contact_name' => $this->input->post('contact_name', TRUE),
                'division' => $this->input->post('division', TRUE),
                'address' => $this->input->post('address', TRUE),
                'city' => $this->input->post('city', TRUE),
                'state_prov' => $this->input->post('state_prov', TRUE),
                'postal_code' => $this->input->post('postal_code', TRUE),
                'email' => $this->input->post('email', TRUE),
                'phone' => $this->input->post('phone', TRUE),
                'fax' => $this->input->post('fax', TRUE),
                'mobile' => $this->input->post('mobile', TRUE),
                'note' => $this->input->post('note', TRUE),
                'inspection_schedule_id' => $this->input->post('inspection_schedule_id', TRUE),
                'unit_system_id' => $this->input->post('unit_system_id', TRUE),
                'major_id' => $this->input->post('major_id', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );
            //echo '<pre>'; print_r($data); die();
            $this->End_user_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('end_user'));
        }
    }

    public function update($id) {
        $row = $this->End_user_model->get_by_id($id);
        $schedule = $this->Schedule_model->get_all();
        $unit = $this->Unit_model->get_all();
        $endUser    = $this->End_user_model->get_all();
        //echo '<pre>';print_r($row);die();


        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('end_user/update_action'),
                'id' => set_value('id', $row->id),
                'company' => set_value('company', $row->company),
                'contact_name' => set_value('contact_name', $row->contact_name),
                'division' => set_value('division', $row->division),
                'address' => set_value('address', $row->address),
                'city' => set_value('city', $row->city),
                'state_prov' => set_value('state_prov', $row->state_prov),
                'postal_code' => set_value('postal_code', $row->postal_code),
                'email' => set_value('email', $row->email),
                'phone' => set_value('phone', $row->phone),
                'fax' => set_value('fax', $row->fax),
                'mobile' => set_value('mobile', $row->mobile),
                'note' => set_value('note', $row->note),
                'inspection_schedule_id' => set_value('inspection_schedule_id', $row->inspection_schedule_id),
                'unit_system_id' => set_value('unit_system_id', $row->unit_system_id),
                'major_id' => set_value('major_id', $row->major_id),
            );

            $data['inspection_schedule'] = $schedule;
            $data['unit_system'] = $unit;
            $data['end_user'] = $endUser;
            $this->template->display('end_user/tb_end_user_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('end_user'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'company' => $this->input->post('company', TRUE),
                'contact_name' => $this->input->post('contact_name', TRUE),
                'division' => $this->input->post('division', TRUE),
                'address' => $this->input->post('address', TRUE),
                'city' => $this->input->post('city', TRUE),
                'state_prov' => $this->input->post('state_prov', TRUE),
                'postal_code' => $this->input->post('postal_code', TRUE),
                'email' => $this->input->post('email', TRUE),
                'phone' => $this->input->post('phone', TRUE),
                'fax' => $this->input->post('fax', TRUE),
                'mobile' => $this->input->post('mobile', TRUE),
                'note' => $this->input->post('note', TRUE),
                'inspection_schedule_id' => $this->input->post('inspection_schedule_id', TRUE),
                'unit_system_id' => $this->input->post('unit_system_id', TRUE), 
                'major_id' => $this->input->post('major_id', TRUE), 
            );

            $this->End_user_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('end_user'));
        }
    }

    public function delete($id) {
        $row = $this->End_user_model->get_by_id($id);

        if ($row) {
            $this->End_user_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('end_user'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('end_user'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('company', 'company', 'trim|required');
        $this->form_validation->set_rules('contact_name', 'contact_name');        
        $this->form_validation->set_rules('division', 'division');        
        $this->form_validation->set_rules('address', 'address');        
        $this->form_validation->set_rules('city', 'city');        
        $this->form_validation->set_rules('state_prov', 'state_prov');        
        $this->form_validation->set_rules('postal_code', 'postal_code');        
        $this->form_validation->set_rules('email', 'email');        
        $this->form_validation->set_rules('phone', 'phone');        
        $this->form_validation->set_rules('fax', 'fax');        
        $this->form_validation->set_rules('mobile', 'mobile');        
        $this->form_validation->set_rules('note', 'note');        
        $this->form_validation->set_rules('inspection_schedule_id', 'inspection_schedule_id');        
        $this->form_validation->set_rules('unit_system_id', 'unit_system_id');
        $this->form_validation->set_rules('major_id', 'major_id');        
        
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_end_user.xls";
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