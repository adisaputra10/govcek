<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Master_product_detail extends CI_Controller {

    function __construct() 
    {
        parent::__construct();
        $this->load->model('Master_product_model');
        $this->load->model('Master_product_detail_model');
        $this->load->model('Adjustable_model');
        $this->load->model('Legs_model');
        $this->load->model('Basic_type_model');
        $this->load->model('Grade_model');
        $this->load->model('Construction_model');
        $this->load->model('Construction_model');
        $this->load->model('Label_model');
        $this->load->model('Schedule_model');
        $this->load->model('Label_value_model');        
        
        chek_session();
    }

    public function add_detail() 
    {
        $id = $this->uri->segment(3); //die($id);
        $row = $this->Master_product_model->get_master_by($id);        
        $det = $this->Master_product_detail_model->get_all_detail_by($id);  
        $lab = $this->Label_value_model->get_value_by_id($id);      
        $adj = $this->Adjustable_model->get_all();
        $legs = $this->Legs_model->get_all();
        $basic_type = $this->Basic_type_model->get_all();
        $grade = $this->Grade_model->get_all();
        $construction = $this->Construction_model->get_all();

        $data = array(
            'product_detail_data'   => $det,
            'label_data'            => $lab,                    
        );        

        //cek di label untuk detail special
        $cekLabel = $this->Label_model->cek_label($id,$row[0]->product_category_id);              
        
        $cekValue = $this->Label_value_model->cek_value($row[0]->product_category_id);
        //echo count($cekValue).'/';
        //echo '<pre>';print_r($cekValue);die('xxx');
        if(empty($cekValue)){
            $caption_button = 'Add Detail';
            $data['action'] = site_url('master_product/create_detail');
        }else{
            $caption_button = 'Update Detail';
            $data['action'] = site_url('master_product/update_action');
        }

        $data['caption']   = $caption_button;
        $data['cek_label'] = $cekLabel; 
        $data['procat_id'] = $row[0]->product_category_id;
        $data['parent_id'] = $id;


        $data['id']                 = $id;
        $data['category']           = $row[0]->product_category;
        $data['product_category']   = $row[0]->product_category;
        $data['unit_system']        = $row[0]->unit_system;
        $data['end_user']           = $row[0]->end_user;
        $data['manufacture_name']   = $row[0]->manufacture_name;
        $data['schedule']           = $row[0]->schedule;
        $data['quick_check_no']     = $row[0]->quick_check_no;

        $data['adjustable']         = $adj;
        $data['legs']               = $legs;
        $data['basic_type']         = $basic_type;
        $data['grade']              = $grade;
        $data['construction']       = $construction;

        if($det){
            $data['size']               = $det[0]->size;
            $data['product_id']         = $det[0]->product_id;
            $data['adjustable_id']      = $det[0]->adjustable_id;
            $data['legs_id']            = $det[0]->legs_id;
            $data['basic_type_id']      = $det[0]->basic_type_id;
            $data['grade_id']           = $det[0]->grade_id;
            $data['construction_id']    = $det[0]->construction_id;
            $data['reach0']             = $det[0]->reach0;
            $data['reach1']             = $det[0]->reach1;
            $data['reach2']             = $det[0]->reach2;            
        }else{
            $data['size']               = 0;
            $data['product_id']         = '';
            $data['adjustable_id']      = '';
            $data['legs_id']            = '';
            $data['basic_type_id']      = '';
            $data['grade_id']           = '';
            $data['construction_id']    = '';
            $data['reach0']             = '';
            $data['reach1']             = '';
            $data['reach2']             = '';
        }
        
        $data['message'] = '';
        $data['button'] = 'Add Detail';
        if(count($cekLabel) > 0){            
            $this->template->display('master_product_detail/tb_master_product_detail_label', $data);
        }else{ 
            $this->template->display('master_product_detail/tb_master_product_detail_form', $data);        
        }
    }

    public function save_add(){
        $this->_rules();
        
        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'product_id' => $this->input->post('product_id', TRUE),
                'size' => $this->input->post('size', TRUE),
                'adjustable_id' => $this->input->post('adjustable_id', TRUE),
                'legs_id' => $this->input->post('legs_id', TRUE),
                'basic_type_id' => $this->input->post('basic_type_id', TRUE),
                'grade_id' => $this->input->post('grade_id', TRUE),
                'construction_id' => $this->input->post('construction_id', TRUE),
                'reach0' => $this->input->post('reach0', TRUE),
                'reach1' => $this->input->post('reach1', TRUE),
                'reach2' => $this->input->post('reach2', TRUE),
                'proof_tested' => $this->input->post('proof_tested', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );
            
            //echo '<pre>'; print_r($data); die();
            $this->Master_product_detail_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Detail Success');
            redirect(site_url('master_product_detail/add_detail/'.$this->input->post('product_id')));
        }
    }

    function save_update_label()
    {       
        //echo $this->input->post('id').'/'; 
        //echo $this->input->post('procat_id');        //die();

        $data = array();
        $label = $this->Label_model->cek_label($this->input->post('procat_id'),$this->input->post('id'));        
        //echo '<pre>';print_r($label);die();
        foreach ($label as $p) {
            $data['parent_id'] = $this->input->post('parent_id');
            $data['product_category_id'] = $this->input->post('procat_id');
            $data['label_name'] = $p->label_name;
            $data['label_value'] = $this->input->post($p->label_name);            
            //echo $this->input->post($p->label_name).'<br>';
            
            $this->Label_value_model->insert($data);
        }
        //die();
        //echo '<pre>';print_r($data);die();
                    
        //$this->Label_value_model->insert($data);
        $this->session->set_flashdata('message', 'Insert Record Success');            
        redirect(site_url('master_product_detail/add_detail/'.$this->input->post('id')));
    }

    // untuk update label yang hanya boleh 1 row
    function simpan_update_label()
    {             
        $data = array();
        $label = $this->Label_model->cek_label($this->input->post('id'), $this->input->post('procat_id'));        
        foreach ($label as $p) {
            //$data['label_name'] = $p->label_name;
            //$data['label_value'] = $this->input->post($p->label_name);               
            $this->Label_value_model->update_label_value($p->label_name, $this->input->post($p->label_name));                  
        }            
                    
        $this->session->set_flashdata('message', 'Update Record Success');            
        redirect(site_url('master_product_detail/add_detail/'.$this->input->post('id')));
    }

    function save_update_detail()
    {
        $id_parent = $this->input->post('id_parent');
        $id_detail = $this->input->post('id_detail');
        $size = $this->input->post('size');
        $adjustable_id = $this->input->post('adjustable_id');
        $legs_id = $this->input->post('legs_id');
        $basic_type_id = $this->input->post('basic_type_id');
        $grade_id = $this->input->post('grade_id');
        $construction_id = $this->input->post('construction_id');
        $reach0 = $this->input->post('reach0');
        $reach1 = $this->input->post('reach1');
        $reach2 = $this->input->post('reach2');
        $proof_tested = $this->input->post('proof_tested');

        $data = array(
            'id' => $this->input->post('id_detail', TRUE),
            'size' => $this->input->post('size', TRUE),
            'adjustable_id' => $this->input->post('adjustable_id', TRUE),
            'legs_id' => $this->input->post('legs_id', TRUE),
            'basic_type_id' => $this->input->post('basic_type_id', TRUE),
            'grade_id' => $this->input->post('grade_id', TRUE),
            'construction_id' => $this->input->post('construction_id', TRUE),
            'reach0' => $this->input->post('reach0', TRUE),
            'reach1' => $this->input->post('reach1', TRUE),
            'reach2' => $this->input->post('reach2', TRUE),
            'proof_tested' => $this->input->post('proof_tested', TRUE),
            'uid' => $this->session->userdata('user_id'),
        );
                
        $this->Master_product_detail_model->update($this->input->post('id_detail', TRUE), $data);
        $this->session->set_flashdata('message', 'Update Record Success');            
        redirect(site_url('master_product_detail/add_detail/'.$this->input->post('id_parent')));
    }

    public function _rules() {
        $this->form_validation->set_rules('product_id', 'product_id', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function read($id) {
        $row = $this->Master_product_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'master_product' => $row->product_category,                
            );
            $this->template->display('master_product/tb_master_product_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('master_product'));
        }
    }

    public function create() {
        $product_category = $this->Product_category_model->get_all();
        $category = $this->Category_model->get_all();
        $unit_system =$this->Unit_model->get_all();
        $schedule =$this->Schedule_model->get_all();
        $end_user =$this->End_user_model->get_all();
        $manufacture =$this->Manufacture_model->get_all();

        $data = array(
            'button' => 'Create',
            'action' => site_url('master_product/create_action'),
            'id' => set_value('id'),
            'serial_number' => set_value('serial_number'),
            'asset_number' => set_value('asset_number'),
            'service_date' => set_value('service_date'),
            'category_id' => set_value('category_id'),
            'product_category_id' => set_value('product_category_id'),            
            'end_user_id' => set_value('end_user_id'),
            'manufacture_id' => set_value('manufacture_id'),
            'unit_system_id' => set_value('unit_system_id'),
            'inspection_schedule_id' => set_value('inspection_schedule_id'),
            'quick_check_no' => set_value('quick_check_no'),
            'uid' => $this->session->userdata('user_id'),
        );
        $data['product_category'] = $product_category;
        $data['category'] = $category;
        $data['unit_system'] = $unit_system;
        $data['inspection_schedule'] = $schedule;
        $data['end_user'] = $end_user;
        $data['manufacture'] = $manufacture;
        $data['message'] = '';
        $this->template->display('master_product/tb_master_product_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'serial_number' => $this->input->post('serial_number', TRUE),
                'asset_number' => $this->input->post('asset_number', TRUE),
                'service_date' => $this->input->post('service_date', TRUE),
                'category_id' => $this->input->post('category_id', TRUE),
                'product_category_id' => $this->input->post('product_category_id', TRUE),
                'end_user_id' => $this->input->post('end_user_id', TRUE),
                'manufacture_id' => $this->input->post('manufacture_id', TRUE),
                'unit_system_id' => $this->input->post('unit_system_id', TRUE),
                'inspection_schedule_id' => $this->input->post('inspection_schedule_id', TRUE),
                'quick_check_no' => $this->input->post('quick_check_no', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );
            
            //echo '<pre>'; print_r($data); die();
            $this->Master_product_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('master_product'));
        }
    }

    public function update($id) {        
        //$row = $this->Master_product_model->get_master_by($id);        
        //echo $this->uri->segment(3); //die();
        $row = $this->Master_product_detail_model->get_edit_by($this->uri->segment(3));        
        $adj = $this->Adjustable_model->get_all();
        $legs = $this->Legs_model->get_all();
        $basic_type = $this->Basic_type_model->get_all();
        $grade = $this->Grade_model->get_all();
        $construction = $this->Construction_model->get_all();        
        $mst = $this->Master_product_model->get_master_by($this->uri->segment(4));     
        $det = $this->Master_product_detail_model->get_all_detail_by($this->uri->segment(4));  
        

        $data['adjustable']         = $adj;
        $data['legs']               = $legs;
        $data['basic_type']         = $basic_type;
        $data['grade']              = $grade;
        $data['construction']   = $construction;
        
        
        //echo $mst[0]->product_category;
        //echo '<pre>'; print_r($det); die();
        
        if ($row) {
            $data = array(
                'button'        => 'Update',
                'action'        => site_url('master_product_detail/update_action'),
                'id'            => set_value('id', $row[0]->id),
                'product_id'    => set_value('product_id', $row[0]->product_id),
                'size'          => set_value('size', $row[0]->size),
                'adjustable_id' => set_value('adjustable_id', $row[0]->adjustable_id),
                'legs_id'       => set_value('legs_id', $row[0]->legs_id),
                'basic_type_id' => set_value('basic_type_id', $row[0]->basic_type_id),
                'grade_id'      => set_value('grade_id', $row[0]->grade_id),
                'construction_id' => set_value('construction_id', $row[0]->construction_id),
                'reach0'        => set_value('reach0', $row[0]->reach0),
                'reach1'        => set_value('reach1', $row[0]->reach1),
                'reach2'        => set_value('reach2', $row[0]->reach2),
                'proof_tested'  => set_value('proof_tested', $row[0]->proof_tested),
                'category'      => $mst[0]->product_category,
                'product_category'   => $mst[0]->category,
                'manufacture_name'   => $mst[0]->manufacture_name,
                'end_user'   => $mst[0]->end_user,
                'product_detail_data'   => $det,
                //'uid' => set_value('legs_id', $row->legs_id),
            );
            //echo '<pre>';print_r($data);die();
            $data['message'] = '';
            $this->template->display('master_product_detail/tb_master_product_detail_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');            
            redirect(site_url('master_product_detail/add_detail/'.$id));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                //'product_id' => $this->input->post('product_id', TRUE),
                'size' => $this->input->post('size', TRUE),
                'adjustable_id' => $this->input->post('adjustable_id', TRUE),
                'legs_id' => $this->input->post('legs_id', TRUE),
                'basic_type_id' => $this->input->post('basic_type_id', TRUE),
                'grade_id' => $this->input->post('grade_id', TRUE),
                'construction_id' => $this->input->post('construction_id', TRUE),
                'reach0' => $this->input->post('reach0', TRUE),
                'reach1' => $this->input->post('reach1', TRUE),
                'reach2' => $this->input->post('reach2', TRUE),
                'proof_tested' => $this->input->post('proof_tested', TRUE),
                //'uid' => $this->session->userdata('user_id'),
            );            

            $this->Master_product_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');            
            redirect(site_url('master_product_detail/add_detail/'.$this->input->post('product_id')));
        }
    }

    public function delete($id) {
        $row = $this->Master_product_detail_model->get_by_id($id);

        if ($row) {
            $this->Master_product_detail_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('master_product_detail/add_detail/'.$id));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('master_product_detail/add_detail/'.$id));
        }
    }

    public function generate_inspection()
    { 
        $master_id      = $this->uri->segment(3);
        $date_service   = base64_decode($this->uri->segment(4));
        $schedule_id    = $this->uri->segment(5);        

        $schedule       = $this->Schedule_model->get_by_id($schedule_id);
        $interval       = $schedule->interval_value;
        $new_schedule   = $this->Schedule_model->get_new_schedule($date_service,$interval);
        $new_schedule   =  $new_schedule[0]->new_schedule;

        //update expire date master product
        $this->Master_product_model->update_expire_date($master_id,$new_schedule);

        $data = array(
            'parent_id' => $master_id,
            ''
        );

        redirect(site_url('master_product'));
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_master_product.xls";
        $judul = "tb_master_product";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Product Category");

        foreach ($this->Category_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteLabel($tablebody, $kolombody++, $data->product_category);

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