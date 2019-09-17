<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Master_product extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Master_product_model');
        $this->load->model('Product_category_model');
        $this->load->model('Category_model');
        $this->load->model('Unit_model');
        $this->load->model('Schedule_model');
        $this->load->model('End_user_model');
        $this->load->model('Manufacture_model');
        $this->load->model('Begin_inspection_model');
        $this->load->model('Status_model'); 
        $this->load->model('Unit_model'); 
        $this->load->library('form_validation');
        $this->load->library('session');
        chek_session();
    }

    public function index() {
        $master_product = $this->Master_product_model->get_all();                            
        //echo '<pre>';print_r($master_product);die();
        
        foreach ($master_product as $key => $value) {            
            if(empty($value->expire_date) || $value->expire_date == NULL || $value->expire_date == ""){
                //update expire_data jika kosong/null
                //$this->Master_product_model->update_expire_date($value->service_date,$value->inspection_schedule_id,$value->id,$value->service_date);
            }
        } 

        $data = array(
            'master_product_data'   => $master_product,            
        );
        $data['message'] = '';
        $this->template->display('master_product/tb_master_product_list', $data);
    }


    public function api() {
        $master_product = $this->Master_product_model->get_all();                            
        echo json_encode(array('status' => true,'data' => $master_product ));


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
        $product_category = $this->Product_category_model->get_free_all();
        $category = $this->Category_model->get_free_all();
        $unit_system =$this->Unit_model->get_free_all();
        $schedule =$this->Schedule_model->get_free_all();
        $end_user =$this->End_user_model->get_free_all();
        $manufacture =$this->Manufacture_model->get_all();
        $status = $this->Status_model->get_all();
        //echo '<pre>';print_r($status);die();

        $data = array(
            'button' => 'Create',
            'action' => site_url('master_product/create_action'),
            'id' => set_value('id'),
            'serial_number' => set_value('serial_number'),
            'asset_number' => set_value('asset_number'),
            'service_date' => set_value('service_date'),
            'expire_date' => set_value('expire_date'),
            'category_id' => set_value('category_id'),
            'product_category_id' => set_value('product_category_id'),            
            'end_user_id' => set_value('end_user_id'),
            'manufacture_id' => set_value('manufacture_id'),
            'unit_system_id' => set_value('unit_system_id'),
            'inspection_schedule_id' => set_value('inspection_schedule_id'),
            'quick_check_no' => set_value('quick_check_no'),
            'capacity' => set_value('capacity'),
            'status' => set_value('status'),
            'uid' => $this->session->userdata('user_id'),
        );
        $data['product_category'] = $product_category;
        $data['category'] = $category;
        $data['unit_system'] = $unit_system;
        $data['inspection_schedule'] = $schedule;
        $data['end_user'] = $end_user;
        $data['manufacture'] = $manufacture;
        $data['status_product'] = $status;
        $data['message'] = '';
        $this->template->display('master_product/tb_master_product_form', $data);
    }


    

    public function form_excel() {
       
        $this->template->display('master_product/tb_master_product_excel');
    }


    public function excel_action() {
         

           include APPPATH.'../upload/tes.php';
       





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
                'expire_date' => $this->input->post('expire_date', TRUE),
                'category_id' => $this->input->post('category_id', TRUE),
                'product_category_id' => $this->input->post('product_category_id', TRUE),
                'end_user_id' => $this->input->post('end_user_id', TRUE),
                'manufacture_id' => $this->input->post('manufacture_id', TRUE),
                'unit_system_id' => $this->input->post('unit_system_id', TRUE),
                'inspection_schedule_id' => $this->input->post('inspection_schedule_id', TRUE),
                'quick_check_no' => $this->input->post('quick_check_no', TRUE),
                'capacity' => $this->input->post('capacity', TRUE),
                'status' => $this->input->post('status_id', TRUE),
                'uid' => $this->session->userdata('user_id'),
                'description' => $this->input->post('description', TRUE),
            );
            
            // cek duplikasi di master product
            $cekDuplikasi = $this->Master_product_model->cek_duplikasi($this->input->post('category_id'),$this->input->post('serial_number'));

            //echo count($cekDuplikasi);
            //echo '<pre>'; print_r($data); die();

            if(count($cekDuplikasi) > 0){
                $this->session->set_flashdata('message', 'Create failed, duplicated.');              
                //die('duplikasi');
                redirect(site_url('master_product/create'));
            }else{ //die('lancar');
                $this->Master_product_model->insert($data);
                $this->session->set_flashdata('message', 'Create Record Success');
            }
            redirect(site_url('master_product'));
        }
    }




    public function api_create_action() {
        
              header('Content-type: application/json');
              header("Access-Control-Allow-Origin: *");
              header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
       
            $data = array(
                'serial_number' => $this->input->post('serial_number', TRUE),
                'asset_number' => $this->input->post('asset_number', TRUE),
                'service_date' => $this->input->post('service_date', TRUE),
                'expire_date' => $this->input->post('expire_date', TRUE),
                'category_id' => $this->input->post('category_id', TRUE),
                'product_category_id' => $this->input->post('product_category_id', TRUE),
                'end_user_id' => $this->input->post('end_user_id', TRUE),
                'manufacture_id' => $this->input->post('manufacture_id', TRUE),
                'unit_system_id' => $this->input->post('unit_system_id', TRUE),
                'inspection_schedule_id' => $this->input->post('inspection_schedule_id', TRUE),
                'quick_check_no' => $this->input->post('quick_check_no', TRUE),
                'capacity' => $this->input->post('capacity', TRUE),
                'status' => $this->input->post('status_id', TRUE),
                'uid' => 1,
            );
            
            // cek duplikasi di master product
            $cekDuplikasi = $this->Master_product_model->cek_duplikasi($this->input->post('category_id'),$this->input->post('serial_number'));

            //echo count($cekDuplikasi);
            //echo '<pre>'; print_r($data); die();

            if(count($cekDuplikasi) > 0){
                //$this->session->set_flashdata('message', 'Create failed, duplicated.');             
                //redirect(site_url('master_product/create'));
                echo json_encode(array('status' => true,'data' => 'failed,duplicated ' ));

            }else{  
                $this->Master_product_model->insert($data);
              
                echo json_encode(array('status' => true,'data' => 'success' ));
            }

           
        
    }

    public function update($id) {
        $product_category = $this->Product_category_model->get_free_all();
        $category = $this->Category_model->get_free_all();
        $unit_system =$this->Unit_model->get_free_all();
        $schedule =$this->Schedule_model->get_free_all();
        $end_user =$this->End_user_model->get_free_all();
        $manufacture =$this->Manufacture_model->get_all();
        $row = $this->Master_product_model->get_by_id($id);
        $status = $this->Status_model->get_free_all();
        //echo '<pre>'; print_r($row); die();

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('master_product/update_action'),
                'id' => set_value('id', $row->id),
                'serial_number' => set_value('serial_number', $row->serial_number),
                'asset_number' => set_value('asset_number', $row->asset_number),
                'service_date' => set_value('service_date', $row->service_date),
                'expire_date' => set_value('service_date', $row->expire_date),
                'category_id' => set_value('category_id', $row->category_id),
                'product_category_id' => set_value('product_category_id', $row->product_category_id),
                'end_user_id' => set_value('end_user_id', $row->end_user_id),
                'manufacture_id' => set_value('manufacture_id', $row->manufacture_id),
                'unit_system_id' => set_value('unit_system_id', $row->unit_system_id),
                'inspection_schedule_id' => set_value('inspection_schedule_id', $row->inspection_schedule_id),
                'quick_check_no' => set_value('quick_check_no', $row->quick_check_no),
                'capacity' => set_value('capacity', $row->capacity),
                'status' => set_value('capacity', $row->status),
            );
            $data['product_category'] = $product_category;
            $data['category'] = $category;
            $data['unit_system'] = $unit_system;
            $data['inspection_schedule'] = $schedule;
            $data['end_user'] = $end_user;
            $data['manufacture'] = $manufacture;
            $data['status_product'] = $status;
            $data['message'] = '';
            $this->template->display('master_product/tb_master_product_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('master_product'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'serial_number' => $this->input->post('serial_number', TRUE),
                'asset_number' => $this->input->post('asset_number', TRUE),
                'service_date' => $this->input->post('service_date', TRUE),
                'expire_date' => $this->input->post('expire_date', TRUE),
                'category_id' => $this->input->post('category_id', TRUE),
                'product_category_id' => $this->input->post('product_category_id', TRUE),
                'end_user_id' => $this->input->post('end_user_id', TRUE),
                'manufacture_id' => $this->input->post('manufacture_id', TRUE),
                'unit_system_id' => $this->input->post('unit_system_id', TRUE),
                'inspection_schedule_id' => $this->input->post('inspection_schedule_id', TRUE),
                'quick_check_no' => $this->input->post('quick_check_no', TRUE),
                'capacity' => $this->input->post('capacity', TRUE),
                'status' => $this->input->post('status_id', TRUE),
            );

            $this->Master_product_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('master_product'));
        }
    }

    public function delete($id) {
        $row = $this->Master_product_model->get_by_id($id);

        if ($row) {
            //cek, jika ada begin_inspection maka tidak bisa dihapus
            $cek_begin = $this->Begin_inspection_model->get_detail_inspection($id);
            
            /*if(count($cek_begin) > 0){
                $this->session->set_flashdata('error', 'Cannot delete record, it has inspection detail');
                redirect(site_url('master_product'));
            }else{*/
                $this->Master_product_model->delete($id);
                $this->session->set_flashdata('success', 'Delete Record Success');
                redirect(site_url('master_product'));
            //}
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('master_product'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('category_id', 'category_id', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
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