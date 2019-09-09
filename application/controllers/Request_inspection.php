<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Request_inspection extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Product_category_model');
        $this->load->model('Product_category_checklist_model');        
        $this->load->model('Begin_inspection_model');
        $this->load->model('Master_product_model');
        $this->load->model('Inspector_model');
        $this->load->model('Location_model');        
        $this->load->model('Category_model'); 
        $this->load->model('Status_model'); 
        $this->load->model('Request_detail_inspection_model'); 
        $this->load->model('Request_inspection_model');        
        $this->load->model('End_user_model');       
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $request_inspection = $this->Request_inspection_model->get_all();
        $product_category   = $this->Product_category_model->get_all();  
        $end_user           = $this->End_user_model->get_all();  
        $inspector          = $this->Inspector_model->get_all();
        $status             = $this->Status_model->get_all();
        //echo '<pre>';print_r($request_inspection);die();

        $data = array(
            'product_category_data' => $product_category,
            'request_inspection'    => $request_inspection,
            'end_user'              => $end_user,
            'inspector'             => $inspector,
        );
        $data['message'] = '';
        $this->template->display('request_inspection/tb_request_inspection_list', $data);
    }



    public function api() {


        
        $request_inspection = $this->Request_inspection_model->get_all();
        $product_category   = $this->Product_category_model->get_all();  
        $end_user           = $this->End_user_model->get_all();  
        $inspector          = $this->Inspector_model->get_all();
        $status             = $this->Status_model->get_all();
        //echo '<pre>';print_r($request_inspection);die();

        $data = array(
            'product_category_data' => $product_category,
            'request_inspection'    => $request_inspection,
            'end_user'              => $end_user,
            'inspector'             => $inspector,
        );
        $data['message'] = '';
        //$this->template->display('request_inspection/tb_request_inspection_list', $data);
        echo json_encode(array('status' => true,'data' => $request_inspection ));

    }
    public function add_request()
    {        
        $request_inspection = $this->Request_inspection_model->get_all();
        $product_category   = $this->Product_category_model->get_all();  
        $end_user           = $this->End_user_model->get_all();  
        $inspector          = $this->Inspector_model->get_all();
        $status             = $this->Status_model->get_all();
        $equipment          = $this->Master_product_model->get_all();
        //echo '<pre>';print_r($equipment);die();

        $data = array(
            'button' => 'Create',
            'action' => site_url('request_inspection/save_request_inspection'),
            'action_inspection' => site_url('request_inspection/create_action_request_inspection'),
            'id' => set_value('id'),            
            'end_user_id' => set_value('end_user_id'),
            'inspector_id' => set_value('inspector_id'),
            'product_category_id' => set_value('product_category_id'),
            'status' => set_value('status'),
            'remark' => set_value('remark'),
            'rep_no' => set_value('rep_no'),            
            'schedule_date' => set_value('schedule_date'),            
            'inspection_date' => set_value('inspection_date'),            
            'invoice_no' => set_value('invoice_no'),            
            'uid' => $this->session->userdata('user_id'),
            'equipment_id' => set_value('equipment_id'),

            'product_category'  => $product_category,
            'end_user'          => $end_user,
            'inspector'         => $inspector,
            'status'            => $status,
            'equipment'         => $equipment,
        );

        $this->template->display('request_inspection/tb_request_inspection_form', $data);
    }

    public function save_request_inspection()
    {
        $uid                    = $this->session->userdata('user_id');
        $end_user_id            = $this->input->post('end_user_id');
        $inspector_id           = $this->input->post('inspector_id');
        $product_category_id    = $this->input->post('product_category_id');
        $schedule_date          = $this->input->post('schedule_date');
        $inspection_date        = $this->input->post('inspection_date');
        $rep_no                 = $this->input->post('rep_no');
        $status_id              = $this->input->post('status_id');
        $remark                 = $this->input->post('remark');        
        $invoice_no             = $this->input->post('invoice_no');
        $equipment_id           = $this->input->post('equipment_id');

        $data = array(
            'uid'           => $uid,
            'end_user_id'   => $end_user_id,
            'inspector_id'  => $inspector_id,
            'product_category_id'   => $product_category_id,
            'schedule_date' => $schedule_date,
            'inspection_date' => $inspection_date,
            'rep_no'        => $rep_no,
            'status_id'     => $status_id,
            'remark'        => $remark,
            'invoice_no'    => $invoice_no,
            'equipment_id'  => $equipment_id,
        );
        //fecho '<pre>';print_r($data); die('simpan');

        $this->Request_inspection_model->insert($data);
        $this->session->set_flashdata('success', 'Create Request Inspection Success');
        redirect(site_url('request_inspection'));

    }


    public function api_save_request_inspection()
    {

        header('Content-type: application/json');
        header("Access-Control-Allow-Origin: *");
        header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
        $uid                    = 1;
        $end_user_id            = $this->input->post('end_user_id');
        $inspector_id           = $this->input->post('inspector_id');
        $product_category_id    = $this->input->post('product_category_id');
        $schedule_date          = $this->input->post('schedule_date');
        $inspection_date        = $this->input->post('inspection_date');
        $rep_no                 = $this->input->post('rep_no');
        $status_id              = $this->input->post('status_id');
        $remark                 = $this->input->post('remark');        
        $invoice_no             = $this->input->post('invoice_no');
        $equipment_id           = $this->input->post('equipment_id');

        $data = array(
            'uid'           => $uid,
            'end_user_id'   => $end_user_id,
            'inspector_id'  => $inspector_id,
            'product_category_id'   => $product_category_id,
            'schedule_date' => $schedule_date,
            'inspection_date' => $inspection_date,
            'rep_no'        => $rep_no,
            'status_id'     => $status_id,
            'remark'        => $remark,
            'invoice_no'    => $invoice_no,
            'equipment_id'  => $equipment_id,
        );
        //fecho '<pre>';print_r($data); die('simpan');

        $this->Request_inspection_model->insert($data);
        //$this->session->set_flashdata('success', 'Create Request Inspection Success');
        //redirect(site_url('request_inspection'));
        echo json_encode(array('status' => true,'data' => 'success' ));

    }

    public function update($id) 
    {
        $id                 = $this->uri->segment(3);         
        $row                = $this->Request_inspection_model->get_by_id($id);         
        $product_category   = $this->Product_category_model->get_all();  
        $end_user           = $this->End_user_model->get_all();  
        $inspector          = $this->Inspector_model->get_all();
        $status             = $this->Status_model->get_all();      
        $equipment          = $this->Master_product_model->get_all();
        //echo '<pre>';print_r($row);die();

        if ($row) {
            $data = array(
                'button'                => 'Update',    
                'action'                => site_url('request_inspection/update_action'),
                'id'                    => set_value('id', $row->id),
                'end_user_id'           => set_value('end_user_id', $row->end_user_id),
                'product_category_id'   => set_value('product_category_id', $row->product_category_id),                
                'inspector_id'          => set_value('inspector_id',$row->inspector_id),
                'schedule_date'         => set_value('schedule_date',$row->schedule_date),
                'inspection_date'       => set_value('inspection_date',$row->inspection_date),
                'rep_no'                => set_value('rep_no',$row->rep_no),
                'status_id'             => set_value('status_id',$row->status_id),
                'remark'                => set_value('remark',$row->remark),
                'invoice_no'            => set_value('invoice_no',$row->invoice_no),
                'equipment_id'          => set_value('equipment_id',$row->equipment_id),
            );
            //echo '<pre>';print_r($end_user);die();
            $data['product_category'] = $product_category;
            $data['end_user'] = $end_user;
            $data['inspector'] = $inspector;
            $data['status'] = $status;
            $data['equipment'] = $equipment;
            $data['message'] = '';

            $this->template->display('request_inspection/tb_request_inspection_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('request_inspection'));
        }
    }

    public function update_action() 
    {   
           
        $data = array(     
            'id' => $this->input->post('id', TRUE),
            'end_user_id' => $this->input->post('end_user_id', TRUE),
            'inspector_id' => $this->input->post('inspector_id', TRUE),  
            'product_category_id' => $this->input->post('product_category_id', TRUE),
            'schedule_date' => $this->input->post('schedule_date', TRUE),  
            'inspection_date' => $this->input->post('inspection_date', TRUE),
            'rep_no' => $this->input->post('rep_no', TRUE),  
            'status_id' => $this->input->post('status_id', TRUE),
            'remark' => $this->input->post('remark', TRUE),    
            'invoice_no' => $this->input->post('invoice_no', TRUE),        
            'equipment_id' => $this->input->post('equipment_id', TRUE),
        );
        
        //echo '<pre>';print_r($data); die('save udpate');
        $this->Request_inspection_model->update($this->input->post('id', TRUE), $data);
        $this->session->set_flashdata('success', 'Update Record Success');
        redirect(site_url('request_inspection'));
        
    }

    public function detail_request_inspection()
    {
        $parent_id = $this->uri->segment(3);
        $procat_id = $this->uri->segment(4);
        $status = $this->Status_model->get_all();
        $location = $this->Location_model->get_all();
        $parent_header = $this->Request_inspection_model->get_all_by_id($parent_id);
        $checklist = $this->Product_category_checklist_model->get_by_id($procat_id);
        $request_inspection = $this->Request_detail_inspection_model->get_detail_inspection($parent_id);
        $category = $this->Category_model->get_all();

        //echo $parent_id.'<br>';
        //echo '<pre>';print_r($request_inspection);die();
        //echo $header[0]->inspector_name;
        //echo'<pre>';print_r($header);die();

        $n=0; $cn = '';
        if($checklist){            
            foreach ($checklist as $r){ 
                $cn .= $r->checklist_name.'|N|';
            }

            $cn = substr($cn,0,-1);
            $temp = explode('|',$cn); $i = 0; $n = count($temp); $header='';                
            $header_col = array(); $value_col = array();
            while($i < $n){                            
                $header_col[] = $temp[$i];                
                $i=$i+2;
            }  

        }

        //cek, apakah checklist name sudah didefinisikan ke product
        if ($cn == ''){
            $this->session->set_flashdata('checklist', 'Cheklist must be define first in your product. Go to Product Category -> Add Checklist');
            redirect(site_url('master_product'));
        }
        
        $data = array(
            'parent_id'         => $parent_id,    
            'procat_id'         => $procat_id,            
            'checklist_name'    => $cn,
            'parent_header'     => $parent_header,
            'status'            => $status,
            'location'          => $location,
            'inspector_name'    => $parent_header[0]->inspector_name,
            'company_name'      => $parent_header[0]->company,
            'product_category_name' => $parent_header[0]->product_category,
            'request_inspection' => $request_inspection,
            'action'            => site_url('request_inspection/create_request_inspection'),
            'category'          => $category,
            'product_id'        => set_value('product_id', $procat_id),     
            'comment'           => set_value('comment'),              
        );

        if($n > 0){
            $data['header_col'] = $header_col;
            $data['value_col'] = $value_col;
        }else{
            $data['header_col'] = '';
            $data['value_col'] = '';
        }

        //echo '<pre>';print_r($checklist); die($parent_id);
        $this->template->display('request_inspection/tb_request_inspection_detail_form', $data);

    }

    public function create_request_inspection()
    {
        $c_name = 'checklist_name';      
        $status = 'status';
        $checklist_name=''; $temp = '';
        for ($x = 0; $x <= 100; $x++) {
            $cn = ''; $st = '';
            $cn = $this->input->post($c_name.$x);
            $st = ($this->input->post($status.$x) == "") ? 'N' : $this->input->post($status.$x);                

            if ($cn){
                $checklist_name .=  $cn.'|'.$st.'|';                
            }       
        } 
        $checklist_name = substr($checklist_name,0,strlen($checklist_name)-1);
        //die($checklist_name);

        $data = array(
            'mst_product_id'        => $this->input->post('mst_product_id'),
            //'product_category_id'   => $this->input->post('procat_id'),
            'parent_id'             => $this->input->post('parent_id'),
            'checklist_name'        => $checklist_name,
            'comment'               => $this->input->post('comment'),
            'status'                => $this->input->post('status_inspection'),
            'location_id'           => $this->input->post('location_id'),
            'uid'                   => $this->session->userdata('user_id'),
        );

        //echo '<pre>';print_r($data);die();

        $this->Request_detail_inspection_model->insert($data);
        $this->session->set_flashdata('success', 'Create Request Detail Inspection Success');
        redirect(site_url('request_inspection'));

    }


    public function read($id) 
    {
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

    public function create_header() 
    {
        $parent_id  = $this->uri->segment(3);
        $serv_date  = base64_decode($this->uri->segment(4));  
        //$exp_date   = base64_decode($this->uri->segment(5));  
        $procat_id  = $this->uri->segment(5);
        
        $mst_product = $this->Master_product_model->get_by_category_id($procat_id);        
        $begin_inspection = $this->Product_category_checklist_model->get_by_id($procat_id);
        $status = $this->Status_model->get_all(); 

        // ambil nilai expire_date, untuk generate inspection detail
        $exp_date = $mst_product[0]->expire_date;
        $new_inspection = false; 
        //echo $exp_date.'/';
        if(empty($exp_date) || is_null($exp_date) || $exp_date == '' || $exp_date == 0){
            $new_inspection = true; 
        }
        
        //echo '<pre>';print_r($mst_product);die();
        
        $n=0; $cn = '';
        if($begin_inspection){            
            foreach ($begin_inspection as $r){ 
                $cn .= $r->checklist_name.'|N|';
            }

            $cn = substr($cn,0,-1);
            $temp = explode('|',$cn); $i = 0; $n = count($temp); $header='';                
            $header_col = array(); $value_col = array();
            while($i < $n){                            
                $header_col[] = $temp[$i];                
                $i=$i+2;
            }  

        }

        //cek, apakah checklist name sudah didefinisikan ke product
        if ($cn == ''){
            $this->session->set_flashdata('checklist', 'Cheklist must be define first in your product. Go to Product Category -> Add Checklist');
            redirect(site_url('master_product'));
        }
        
        $data = array(
            'parent_id'         => $parent_id,            
            'checklist_name'    => $cn,
        );

        //cek jika begin_inspection masih ada yg empty inspection_date
        $inspection_data = $this->Begin_inspection_model->cek_data_complete($parent_id);
        //echo $inspection_data->id.'/'.$inspection_data->service_date.'<br>';
        //echo '<pre>';print_r($inspection_data);die();

        if(count($inspection_data) > 0 and $new_inspection){ 
            $this->session->set_flashdata('message', 'Please fill EXPIRE DATE on Master Product to generate new inspection detail');            
        }else{             
            if($inspection_data){
                if(empty($inspection_data->service_date) || !$inspection_data->service_date = 0 || !$inspection_data->service_date == '' || !is_null($inspection_data->service_date)){
                    
                }else{ 
                    $this->Begin_inspection_model->insert($data);
                }
            }else{
                $this->Begin_inspection_model->insert($data);
            }
        }
        
        $inspector = $this->Inspector_model->get_all();
        $location = $this->Location_model->get_all();
        $product_category = $this->Product_category_model->get_all();                  
        $category = $this->Category_model->get_all();                              
        $begin_inspection = $this->Begin_inspection_model->get_detail_inspection($parent_id);

        $data = array(
                'button' => 'Update',
                'action' => site_url('inspection_task/create_action_inspection'),
                'id' => set_value('id', $parent_id),
                //'category_id' => set_value('category_id', $row->category_id),
                'product_id' => set_value('product_id', $procat_id),     
                'comment' => set_value('comment'),   
                'status' => set_value('status'),        
            );

            $data['product_category'] = $product_category;
            $data['category'] = $category;
            $data['inspector'] = $inspector;
            $data['location'] = $location;
            $data['product'] = $mst_product;
            $data['begin_inspection'] = $begin_inspection;
            $data['status'] = $status;
            $data['category_name'] = $mst_product[0]->category;
            $data['product_name'] =  $mst_product[0]->product_category;

            if($n > 0){
                $data['header_col'] = $header_col;
                $data['value_col'] = $value_col;
            }else{
                $data['header_col'] = '';
                $data['value_col'] = '';
            }

            $data['message'] = '';

            //echo '<pre>';print_r($begin_inspection);die();
            $this->template->display('inspection_task/tb_inspection_detail_form', $data);
        
        
    }

    public function request_inspection() {
        $product_category = $this->Product_category_model->get_all();
        $inspector = $this->Inspector_model->get_all();
        $location = $this->Location_model->get_all();

        $data = array(
            'button' => 'Create',
            'action' => site_url('inspection_task/save_header_inspections'),
            'action_inspection' => site_url('inspection_task/create_action_inspection'),
            'id' => set_value('id'),            
            'category_id' => set_value('category_id'),
            'location_id' => set_value('location_id'),
            'inspector_id' => set_value('inspector_id'),
            'status' => set_value('status'),
            'comment' => set_value('comment'),
            'product_category_id' => set_value('product_category_id'),            
            'uid' => $this->session->userdata('user_id'),
        );
        $data['product_category'] = $product_category;
        $data['inspector'] = $inspector;
        $data['location'] = $location;
        $data['message'] = '';
        
        $this->template->display('inspection_task/tb_inspection_task_form', $data);
    }


    function ambil_data(){        
        $modul = $this->input->post('modul');
        $id = $this->input->post('id');

        //die('my id: '.$id);
        $master =  $this->Master_product_model->get_master_product($id);

        echo '<select name="mst_product_id" id="mst_product_id" class="form-control" > ';
        echo '<option value="">-- Select Product --</option>';
        foreach ($master as $r){
            echo '<option value="'.$r->id.'">'.$r->category.' - Serial # '.$r->serial_number.' - '.$r->manufacture_name.'</option>';
        }
        echo '</select>';

        
    }

    function get_detail(){
        $modul = $this->input->post('modul');
        $id = $this->input->post('id'); 

        $cheklist = $this->Product_category_checklist_model->get_product_by_id($id);
        //echo '<pre>'; print_r($cheklist);die($cheklist);

    }

    public function get_checklist_per_product()
    {
        $procat_id = $this->input->post('procat_id');        

        echo "<input type='hidden' id='prod_id' name='procat_id' value=$procat_id />";

        $procat_checklist = $this->Product_category_checklist_model->get_product_by_id($procat_id);
        $st = 1;
        foreach($procat_checklist as $r){
            echo "<div class='box-body'>
                    <div class='form-group'>$r->checklist_name                        
                        <input type='hidden' id='checklist_name$st' name='checklist_name$st' value='$r->checklist_name'></input>                        
                        <div class='col-lg-10'>
                            <fieldset class='form-group'>
                                <div class='form-check'>
                                <label class='form-check-label'>
                                    <input type='radio' class='form-check-input' name='status".$st."' id='status-".$st."' value='Y'> Yes&nbsp;&nbsp;
                                    <input type='radio' class='form-check-input' name='status".$st."' id='status-".$st."' value='N'> No                                    
                                </label>
                                </div>    
                            </fieldset>
                        </div>
                    </div>
                </div>";
            $st++;
        }

        return;

    }
        
    function save_update_inspection()
    {  
        $id = $this->input->post('detail_id');
        $mst_product_id = $this->input->post('mst_product_id');
        $parent_id = $this->input->post('parent_id');
        $procat_id = $this->input->post('procat_id');
        $location_id = $this->input->post('location_id');        
        $comment = $this->input->post('comment');
        $status_inspection = $this->input->post('status_inspection');        

        $c_name = 'checklist_name';      
        $status = 'status';
        $checklist_name=''; $temp = '';
        for ($x = 0; $x <= 100; $x++) {
            $cn = ''; $st = '';
            $cn = $this->input->post($c_name.$x);
            $st = ($this->input->post($status.$x) == "") ? 'N' : $this->input->post($status.$x);                

            if ($cn){
                $checklist_name .=  $cn.'|'.$st.'|';                
            }       
        } 
        $checklist_name = substr($checklist_name,0,strlen($checklist_name)-1);
        //die($checklist_name);

        $data = array(                
            'id' => $this->input->post('detail_id', TRUE),
            'parent_id' => $this->input->post('parent_id', TRUE),
            'mst_product_id' => $this->input->post('mst_product_id', TRUE),
            'product_category_id' => $this->input->post('procat_id', TRUE),
            'location_id' => $this->input->post('location_id', TRUE),            
            'checklist_name' => $checklist_name,            
            'comment' => $this->input->post('comment', TRUE),
            'status' => $this->input->post('status_inspection', TRUE),
            'uid' => $this->session->userdata('user_id'),
        );
                    
        //echo '<pre>';print_r($data);die();

        $this->Request_detail_inspection_model->update($this->input->post('detail_id',TRUE), $data);
        $this->session->set_flashdata('message', 'Update Record Success');
        redirect(site_url('request_inspection'));
    }

    function master_product($id){
        
        $product="<option value='0'>--Select Product--</pilih>";
        
        $this->db->order_by('name','ASC');
        $prod = $this->master_product_model($id);
        
        foreach ($prod as $data ){
            $product.= "<option value='$data[id]'>$data[category]</option>";
        }
    }

    public function save_header_inspection() {
        $category_id = $this->input->post('product_category_id');
        $product_id = $this->input->post('mst_product_id');
        
        $data_header = array(
            'category_id' => $category_id,
            'product_id' => $product_id,
            'uid' => $this->session->userdata('user_id'),
        );
            
        //echo '<pre>'; print_r($data); die();
        
        //$duplikat = $this->Header_inspection_model->cek_duplikat($category_id, $product_id);
        //if($duplikat){ die('duplicate');
        //    $this->session->set_flashdata('message', 'Create Record Success');
        //}else{ die('no duplicate');
            $this->Header_inspection_model->insert($data_header);
            $this->session->set_flashdata('message', 'Create Record Success');
        //}
        redirect(site_url('inspection_task'));
        
    }

    public function create_action_inspection() { 
        $id = $this->input->post('id');
        $parent_id = $this->input->post('parent_id');
        $service_date = $this->input->post('service_date');
        $expire_date = $this->input->post('expire_date');
        $location_id = $this->input->post('location_id');
        $inspector_id = $this->input->post('inspector_id');
        $comment = $this->input->post('comment');
        $status_inspection = $this->input->post('status_inspection');

        $c_name = 'checklist_name';      
        $status = 'status';
        $checklist_name=''; $temp = '';
        for ($x = 1; $x <= 10; $x++) {
            $cn = ''; $st = '';
            $cn = $this->input->post($c_name.$x);
            $st = $this->input->post($status.$x);                  
            if ($cn){
                $checklist_name .=  $cn.'|'.$st.'|';                
            }else{
                break;
            }            
        } 
        $checklist_name = substr($checklist_name,0,strlen($checklist_name)-1);
        //$temp = explode('|',$checklist_name);
        //echo '<br>'.count($temp).'<br>';
        //echo '<pre>';print_r($temp);           


        $data = array(                
                'parent_id' => $this->input->post('parent_id', TRUE),
                'location_id' => $this->input->post('location_id', TRUE),
                'inspector_id' => $this->input->post('inspector_id', TRUE),
                'checklist_name' => $checklist_name,
                'service_date' => $service_date,
                'comment' => $this->input->post('comment', TRUE),
                'status' => $this->input->post('status_inspection', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );
            
        //echo '<pre>'; print_r($data); die();
        $this->Begin_inspection_model->insert($data);
        $this->session->set_flashdata('message', 'Create Record Success');
        redirect(site_url('inspection_task/add_inspection/'.$parent_id));
        
    }

    

    public function update_inspection($id) {
        $parent_id = $this->uri->segment(4); //die($id.'/'.$parent_id);
        $product_category = $this->Product_category_model->get_all();                  
        $category = $this->Category_model->get_all();                      
        $row = $this->Header_inspection_model->get_by_id($id);        
        //$mst_product = $this->Master_product_model->get_by_category_id($row->category_id);  
        $begin_inspection = $this->Begin_inspection_model->get_by_id($id);
        //echo '<pre>';print_r($begin_inspection);die('ooo');      

        if ($begin_inspection) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('inspection_task/update_inspection_action'),
                'id' => set_value('id', $id),
                //'category_id' => set_value('category_id', $row->category_id),
                //'product_id' => set_value('product_id', $row->product_id),                
            );

            $data['product_category'] = $product_category;
            $data['category'] = $category;
            //$data['product'] = $mst_product;
            $data['begin_inspection'] = $begin_inspection;
            $data['message'] = '';

            //$this->template->display('inspection_task/add_inspection/', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspection_task'));
        }
    }

    public function add_inspection($id) { 
        $inspector = $this->Inspector_model->get_all();
        $location = $this->Location_model->get_all();
        $product_category = $this->Product_category_model->get_all();                  
        $category = $this->Category_model->get_all();                      
        $row = $this->Header_inspection_model->get_by_id($id);        
        
        //$mst_product = $this->Master_product_model->get_by_category_id($row->category_id);        
        $mst_product = $this->Master_product_model->get_by_category_id($id);        
        $begin_inspection = $this->Begin_inspection_model->get_detail_inspection($id);
        $status = $this->Status_model->get_all(); 
        
        $n=0;
        if($begin_inspection){
            $cn = '';
            foreach ($begin_inspection as $r){ 
                $cn = $r->checklist_name;
            }

            $temp = explode('|',$cn); $i = 0; $n = count($temp); $header='';                
            $header_col = array(); $value_col = array();
            while($i < $n){                            
                $header_col[] = $temp[$i];                
                $i=$i+2;
            }                
                       
        }

        if ($row) {            
            $data = array(
                'button' => 'Update',
                'action' => site_url('inspection_task/create_action_inspection'),
                'id' => set_value('id', $row->id),
                'category_id' => set_value('category_id', $row->category_id),
                'product_id' => set_value('product_id', $row->product_id),     
                'comment' => set_value('comment'),   
                'status' => set_value('status'),        
            );

            $data['product_category'] = $product_category;
            $data['category'] = $category;
            $data['inspector'] = $inspector;
            $data['location'] = $location;
            $data['product'] = $mst_product;
            $data['begin_inspection'] = $begin_inspection;
            $data['status'] = $status;

            if($n > 0){
                $data['header_col'] = $header_col;
                $data['value_col'] = $value_col;
            }else{
                $data['header_col'] = '';
                $data['value_col'] = '';
            }

            $data['message'] = '';

            $this->template->display('inspection_task/tb_inspection_detail_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspection_task'));
        }
    }

    

    public function delete($id) {
        $row = $this->Request_inspection_model->get_by_id($id);

        if ($row) {
            $this->Request_inspection_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('request_inspection'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('request_inspection'));
        }
    }

    public function delete_inspection() 
    {        
        //echo $this->uri->segment(3);
        //echo $this->uri->segment(4).'/'.$this->uri->segment(5);die();

        $this->Request_detail_inspection_model->delete($this->uri->segment(3));
        $this->session->set_flashdata('message', 'Delete request inspection success');
        redirect(site_url('request_inspection/detail_request_inspection/'.$this->uri->segment(4).'/'.$this->uri->segment(5)));
  
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