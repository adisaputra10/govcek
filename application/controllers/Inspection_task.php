<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Inspection_task extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Product_category_model');
        $this->load->model('Product_category_checklist_model');
        $this->load->model('Header_inspection_model');
        $this->load->model('Begin_inspection_model');
        $this->load->model('Master_product_model');
        $this->load->model('Inspector_model');
        $this->load->model('Location_model');        
        $this->load->model('Category_model'); 
        $this->load->model('Status_model');        
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $header_inspection = $this->Header_inspection_model->get_all();
        $product_category = $this->Product_category_model->get_all();  
        //$begin_inspection = $this->Begin_inspection_model->get_begin_inspection();      

        $data = array(
            'product_category_data' => $product_category,
            'header_inspection' => $header_inspection,
        );
        $data['message'] = '';
        $this->template->display('inspection_task/tb_inspection_task_list', $data);
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





    public function create_header() 
    {
        $parent_id  = $this->uri->segment(3);
        $serv_date  = base64_decode($this->uri->segment(4));  
        //$exp_date   = base64_decode($this->uri->segment(5));  
        $procat_id  = $this->uri->segment(5);
        //print_r($parent_id);
        
        $mst_product = $this->Master_product_model->get_by_category_id($procat_id);        
        $name_inspection = $this->Product_category_checklist_model->get_by_id($procat_id);
        $status = $this->Status_model->get_all(); 

        // ambil nilai expire_date, untuk generate inspection detail
        $exp_date = $mst_product[0]->expire_date;
        $new_inspection = false; 
        //echo $exp_date.'/';
        if(empty($exp_date) || is_null($exp_date) || $exp_date == '' || $exp_date == 0){
            $new_inspection = true; 
        }
        
        //echo '<pre>';print_r($name_inspection);die();
        
        $n=0; $cn = '';
        if($name_inspection){            
            foreach ($name_inspection as $r){ 
                $cn .= $r->checklist_name.'|N|';
            }
            //print_r($cn);die();
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
        //echo '<pre>';print_r($begin_inspection);die();

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
    public function api_create_header() 
    {
        $parent_id  = $this->uri->segment(3);
        $serv_date  = base64_decode($this->uri->segment(4));  
        //$exp_date   = base64_decode($this->uri->segment(5));  
        $procat_id  = $this->uri->segment(5);
        //print_r($parent_id);
        
        $mst_product = $this->Master_product_model->get_by_category_id($procat_id);        
        $name_inspection = $this->Product_category_checklist_model->get_by_id($procat_id);
        $status = $this->Status_model->get_all(); 

        // ambil nilai expire_date, untuk generate inspection detail
        $exp_date = $mst_product[0]->expire_date;
        $new_inspection = false; 
        //echo $exp_date.'/';
        if(empty($exp_date) || is_null($exp_date) || $exp_date == '' || $exp_date == 0){
            $new_inspection = true; 
        }
        
        //echo '<pre>';print_r($name_inspection);die();
        
        $n=0; $cn = '';
        if($name_inspection){            
            foreach ($name_inspection as $r){ 
                $cn .= $r->checklist_name.'|N|';
            }
            //print_r($cn);die();
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
        //echo '<pre>';print_r($begin_inspection);die();

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
        //$this->template->display('inspection_task/tb_inspection_detail_form', $data);
        echo json_encode(array('status' => true,'data' => $begin_inspection ));
        
        
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

    public function get_checklist_per_product(){
        $cat = $this->input->post('cat_id');
        $prod = $this->input->post('prod_id');

        //die($cat.'/'.$prod);
        echo "<input type='hidden' id='cat_id' name='cat_id' value=$cat />
            <input type='hidden' id='prod_id' name='prod_id' value=$prod />";

        $product_category_checklist = $this->Product_category_checklist_model->get_product_by_id($cat);
        $st = 1;
        foreach($product_category_checklist as $r){
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

    }
        
    function save_update_inspection()
    {  
        $id = $this->input->post('detail_id');
        $parent_id = $this->input->post('parent_id');
        $service_date = $this->input->post('service_date');
        $location_id = $this->input->post('location_id');
        $inspector_id = $this->input->post('inspector_id');
        $comment = $this->input->post('comment');
        $status_inspection = $this->input->post('status_inspection');        

        $c_name = 'checklist_name';      
        $status = 'status';
        $checklist_name=''; $temp = '';
        for ($x = 0; $x <= 100; $x++) {
            $cn = ''; $st = '';
            $cn = $this->input->post($c_name.$x);
            $st = $this->input->post($status.$x);                

            if ($cn){
                $checklist_name .=  $cn.'|'.$st.'|';                
            }       
        } 
        $checklist_name = substr($checklist_name,0,strlen($checklist_name)-1);        

          $status=$this->input->post('status_inspection', TRUE);

        $kuery= $this->db->query("select * from hp_status where id='$status'");
        $status_begin='';
        foreach ($kuery->result() as $row)
            {
                    $status_begin=$row->status_name;
            }
   
        $data = array(                
            //'id' => $this->input->post('detail_id', TRUE),
            //'parent_id' => $this->input->post('parent_id', TRUE),
            'location_id' => $this->input->post('location_id', TRUE),
            'inspector_id' => $this->input->post('inspector_id', TRUE),
            'checklist_name' => $checklist_name,
            'service_date' => $service_date,
            'comment' => $this->input->post('comment', TRUE),
            'status' => $status_begin,
            'uid' => $this->session->userdata('user_id'),
        );

        //echo '<pre>';print_r($data);die();
                    
        //service date di master product tidak digunakan, ditampilkan last_inspection update
        // dari begin_inspection
        
        // UPDATE EXPIRE DATE
        $nilai_interval = $this->Master_product_model->get_new_expire_date($parent_id,$service_date);
        //echo '<pre>';print_r($nilai_interval);die();
        $status=$this->input->post('status_inspection', TRUE);

        $this->db->query("update mst_product set status='$status' where id='$parent_id'");
       

       $this->Begin_inspection_model->update($id, $data);

        $this->session->set_flashdata('message', 'Update inspection record success');
        redirect(site_url('master_product'));
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
        //   $data = $this->db->query("SELECT * FROM tenant where id_tenant='$id'");
        $this->Begin_inspection_model->insert($data);
        $this->session->set_flashdata('message', 'Create Record Success');
        redirect(site_url('inspection_task/add_inspection/'.$parent_id));
        
    }

    public function update($id) {
        $product_category = $this->Product_category_model->get_all();                  
        $category = $this->Category_model->get_all();                      
        $row = $this->Header_inspection_model->get_by_id($id);        
        $mst_product = $this->Master_product_model->get_by_category_id($row->category_id);        

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('inspection_task/update_action'),
                'id' => set_value('id', $row->id),
                'category_id' => set_value('category_id', $row->category_id),
                'product_id' => set_value('product_id', $row->product_id),                
            );

            $data['product_category'] = $product_category;
            $data['category'] = $category;
            $data['product'] = $mst_product;
            $data['message'] = '';

            $this->template->display('inspection_task/tb_inspection_header_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('inspection_task'));
        }
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

    public function update_action() {
        $category_id = $this->input->post('product_category_id');
        $product_id = $this->input->post('mst_product_id');

        $data = array(     
            'category_id' => $this->input->post('product_category_id', TRUE),
            'product_id' => $this->input->post('mst_product_id', TRUE),           
        );

        $this->Header_inspection_model->update($this->input->post('id', TRUE), $data);
        $this->session->set_flashdata('message', 'Update Record Success');
        redirect(site_url('inspection_task'));
        
    }

    public function delete($id) {
        $row = $this->Header_inspection_model->get_by_id($id);

        if ($row) {
            $this->Header_inspection_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('master_product'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('master_product'));
        }
    }

    public function delete_inspection() {
        $row = $this->Begin_inspection_model->get_by_id($this->uri->segment(3));
        
        if ($row) {            
            $this->Begin_inspection_model->delete($this->uri->segment(3));
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('inspection_task/create_header/'.$this->uri->segment(4).'/'.$this->uri->segment(5).'/'.$this->uri->segment(6).'/'.$this->uri->segment(7)));
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