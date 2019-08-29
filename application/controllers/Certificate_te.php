<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Certificate_te extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('End_user_model');
        $this->load->model('Schedule_model');
        $this->load->model('Master_product_model');
        $this->load->model('Unit_model');
        $this->load->model('Category_model');
        $this->load->model('Product_category_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $end_user = $this->End_user_model->get_all();
        $category = $this->Category_model->get_free_all();
        $eq_category = $this->Product_category_model->get_all();
        //echo '<pre>'; print_r($end_user); die();
        
        $data = array(
            'end_user' => $end_user,
            'customer' => '',
            'category_name' => '',
            'eq_name' => '',
            'category' => $category,
            'eq_category' => $eq_category,
            'xls_param' => '0',
            'xls_param1' => '0',
            'xls_param2' => '0',
            'selected_user'=> '',
            'action' => site_url('certificate_te/proses'),
        );

        $this->template->display('certificate_te/tb_end_user_list', $data);
    }

    public function proses(){
        $cid = $this->input->post('customer');
        $cat = $this->input->post('category_id');
        $eq = $this->input->post('product_category_id'); 

        $end_user = $this->End_user_model->get_all();
        $category = $this->Category_model->get_free_all();
        $eq_category = $this->Product_category_model->get_all();
        $eq_name = $this->Product_category_model->get_by_id($eq);
        $customer = $this->Master_product_model->get_customer($cid,$cat,$eq);
        $company = $this->End_user_model->get_by_id($cid);
        $category_name = $this->Category_model->get_by_id($cat);
        
        $cat_name = '';
        if($category_name){
            $cat_name = $category_name->category;
        }
        
        $eq_cat='';
        if($eq_name){
            $eq_cat = $eq_name->product_category;
        }
        //echo '---> '.$category_name->category;die();
        //echo '<pre>';print_r($category_name);die();
        //echo '<pre>'; print_r($customer); //die();

        $data = array(
            'end_user' => $end_user,
            'customer' => $customer,
            'category' => $category,
            'category_name' => $cat_name,
            'eq_category' => $eq_category,
            'eq_name' => $eq_cat,
            'xls_param' => $cid,
            'xls_param1' => $cat,
            'xls_param2' => $eq,
            'company' => $company,
            'selected_user' => $company->company,
            'action' => site_url('certificate_te/proses'),
        );

        $this->template->display('certificate_te/tb_end_user_list', $data);
    }

    public function ajax()
    {

        //$from = $this->input->post('from');
        $customer_id = $this->input->post('to');
        $posts = $this->Datamodel->get_customer($customer_id); 
        echo '<pre>';print_r($posts);die();

        $data = array();
        $no = $this->input->post('start');
        foreach ($posts as $post) 
        {
            
            $no++;
            $row = array();
            $row[] = $no;
            $row[] = $post->title;
            $row[] = substr(strip_tags($post->body),0,50)."...";
            $row[] = date('jS F Y h:i a',strtotime($post->created_at));
            
            $data[] = $row;
        }
        
        $output = array(
            "draw" => $this->input->post('draw'),
            "recordsTotal" => $this->Datamodel->count_all(),
            "recordsFiltered" => $this->Datamodel->count_filtered($from,$to),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
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

    public function excel($param) {
        $id = $this->uri->segment(3);
        $cat = $this->uri->segment(4);
        $eq = $this->uri->segment(5);
        $inspection = $this->Master_product_model->get_customer($id,$cat,$eq);
        $company = $this->End_user_model->get_by_id($id);
        //echo '<pre>';print_r($customer);die();
      
        $this->load->helper('exportexcel');
        $namaFile = "certificatOfTE.xls";
        $judul = "tb_unit";
        $tablehead = 6;
        $tablebody = 7;
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

        //base_url('images/fragor.jpg')
        //$logo = base_url('assets/img/alba.png');
        //xlsWriteLabel(1, 0, $logo);

        xlsWriteLabel(2, 4, "Certificate Of Thorough Examination");
        xlsWriteLabel(3, 3, "This certificate meets the Lifting Equipment Engineers Association Technical requirements");
        xlsWriteLabel(4, 4, "(ACOP SHE-F-51.rev1) ");        
        xlsWriteLabel(5, 0, "Customer :");
        xlsWriteLabel(5, 1, $company->company);
        xlsWriteLabel(5, 0, "Customer :");
        xlsWriteLabel(5, 3, "Report Date :");
        xlsWriteLabel(5, 4, now());
        xlsWriteLabel(5, 5, "Color Code :");
        xlsWriteLabel(5, 6, "Green");
        
        $kolomhead = 0;
        xlsWriteLabel($tablehead, $kolomhead++, "No");
        xlsWriteLabel($tablehead, $kolomhead++, "ID No");
        xlsWriteLabel($tablehead, $kolomhead++, "Description");
        xlsWriteLabel($tablehead, $kolomhead++, "Category");
        xlsWriteLabel($tablehead, $kolomhead++, "WLL or SWL");
        xlsWriteLabel($tablehead, $kolomhead++, "Service Date");
        xlsWriteLabel($tablehead, $kolomhead++, "Last Inspection Date");
        xlsWriteLabel($tablehead, $kolomhead++, "Expire Date");
        xlsWriteLabel($tablehead, $kolomhead++, "Details of My Test");
        xlsWriteLabel($tablehead, $kolomhead++, "Status");

        foreach ($inspection as $data) {
            $kolombody = 0;

            //if($data->date_this_te){
                //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
                xlsWriteNumber($tablebody, $kolombody++, $nourut);
                xlsWriteLabel($tablebody, $kolombody++, $data->serial_number);
                xlsWriteLabel($tablebody, $kolombody++, $data->product_category);
                xlsWriteLabel($tablebody, $kolombody++, $data->category);
                xlsWriteLabel($tablebody, $kolombody++, $data->capacity.' '.$data->unit_name);
                xlsWriteLabel($tablebody, $kolombody++, $data->service_date);
                xlsWriteLabel($tablebody, $kolombody++, $data->last_inspection_date);
                xlsWriteLabel($tablebody, $kolombody++, $data->expire_date);
                xlsWriteLabel($tablebody, $kolombody++, $data->comment);
                xlsWriteLabel($tablebody, $kolombody++, $data->status_name);
                
                $tablebody++;
                $nourut++;
            //}
        }

        $tablehead = $tablebody++;
        xlsWriteLabel($tablehead, 0, "Name & qualifications of the person making this report:");
        xlsWriteLabel($tablehead, 5, "Name of the person authenticating this report:");
        $tablehead = $tablehead+3;
        xlsWriteLabel($tablehead, 0, "Signature");
        xlsWriteLabel($tablehead, 5, "Signature:");
        $tablehead = $tablehead+1;
        xlsWriteLabel($tablehead, 0, "NOTE: This equipment is approved solely for use within ALBA areas of operation. No warranty is expressed or implied by the above approval and the owners /operator shall hold the ALBA and/or");
        $tablehead = $tablehead+1;
        xlsWriteLabel($tablehead, 0, "its employees harmless from any liability or claim arising thereon. The owners/operator is to confirm his understanding and acceptance of these conditions by legibly signing this notification before using");
        $tablehead = $tablehead+1;
        xlsWriteLabel($tablehead, 0, "this equipment within ALBA operations.");
        $tablehead = $tablehead+1;
        xlsWriteLabel($tablehead, 0, "Owners / Operator Name & Signature:");
        xlsWriteLabel($tablehead, 5, "Safety Coordinator Name & Signature:");

        xlsEOF();

        exit();
    }

}

/* End of file Basic_type.php */
/* Location: ./application/controllers/Basic_type.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-19 13:09:25 */