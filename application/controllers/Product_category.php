<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Product_category extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Product_category_model');
        $this->load->model('Product_category_checklist_model');
        $this->load->model('Checklist_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $product_category = $this->Product_category_model->get_all();

        $data = array(
            'product_category_data' => $product_category
        );

        $this->template->display('product_category/tb_product_category_list', $data);
    }

    public function add_detail() {
        $id = $this->uri->segment(3); 
        $row = $this->Product_category_model->get_by_id($id);   
        $checklist = $this->Checklist_model->get_all();     
        $cek = $this->Product_category_checklist_model->get_by_id($id);     
        
        //echo '<pre>';print_r($cek);die();
        
        $data = array(
            'checklist_data' => $cek,
            'master_checklist' => $checklist,            
            'action' => site_url('product_category/add_checklist_action/'.$id),
        );
        //print_r($det);die();

        if($row){            
            $data['product_category']   = $row->product_category;
        }else{
            $data['product_category']   = '';
        }

        $data['id'] = $id; 
        $data['message'] = '';
        $data['button'] = 'Add Detail';

        $this->template->display('product_category/tb_product_category_checklist_form', $data);
    }

    public function read($id) {
        $row = $this->Product_category_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'product_category' => $row->product_category,                
            );
            $this->template->display('product_category/tb_product_category_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('product_category'));
        }
    }

    public function create() {
        $data = array(
            'button' => 'Create',
            'action' => site_url('product_category/create_action'),
            'id' => set_value('id'),
            'product_category' => set_value('product_category'),
            'uid' => $this->session->userdata('user_id'),
        );
        $this->template->display('product_category/tb_product_category_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'product_category' => $this->input->post('product_category', TRUE),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Product_category_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('product_category'));
        }
    }

    public function add_checklist_action(){
        //$this->_rules_checklist();
        
        //if ($this->form_validation->run() == FALSE) {
        //    $this->add_detail();
        //} else {
           // die($this->input->post('checklist_id'));
            $data = array(
                'checklist_id' => $this->input->post('checklist_id', TRUE),
                'product_category_id' => $this->uri->segment(3),
                'uid' => $this->session->userdata('user_id'),
            );

            $this->Product_category_checklist_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('product_category/add_detail/'.$this->input->post('id')));
        //}
    }

    public function update($id) {
        $row = $this->Product_category_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('product_category/update_action'),
                'id' => set_value('id', $row->id),
                'product_category' => set_value('product_category', $row->product_category),
            );
            $this->template->display('product_category/tb_product_category_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('product_category'));
        }
    }

    public function update_checklist() {
        $cat = $this->uri->segment(3);
        $id = $this->uri->segment(4);
        $row = $this->Product_category_checklist_model->get_for_delete_by($id);

        $row = $this->Product_category_model->get_by_id($cat);   
        $checklist = $this->Checklist_model->get_all();     
        $cek = $this->Product_category_checklist_model->get_by_id($id);
        
        //echo '<pre>';print_r($cek);die();                        

        if ($cek) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('product_category/update_checklist/'.$cat),                                
                'checklist_data' => $cek,
                'checklist_id' => set_value('product_category', $cek[0]->checklist_id),
            );

            $data['product_category'] = $row->product_category;
            $data['id'] = $id;
            $this->template->display('product_category/tb_product_category_checklist_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('product_category/add_detail/'.$cat));
        }
    }

    public function update_checklist_action(){
        $id = $this->input->post('edit_id');
        $checklist_id = $this->input->post('checklist_id');
        $segment_id = $this->input->post('segment_id');

        //echo "id: ".$id.'/'.$checklist_id.'/'.$segment_id; die();
        if ($checklist_id){            
            $data = array(
                'checklist_id'          => $this->input->post('checklist_id', TRUE),
                'id'                    => $this->input->post('edit_id', TRUE),
                'product_category_id'   => $this->input->post('segment_id', TRUE),
            );

            $this->Product_category_checklist_model->update_checklist($id, $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('product_category/add_detail/'.$segment_id));
        }else{
            redirect(site_url('product_category/add_detail/'.$segment_id));
        }           
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'product_category' => $this->input->post('product_category', TRUE),
            );

            $this->Product_category_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('product_category'));
        }
    }

    public function delete($id) { 
        $row = $this->Product_category_model->get_by_id($id); 

        if ($row) {
            $this->Product_category_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('product_category'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('product_category'));
        }
    }

    public function delete_checklist($id) { 
        $id = $id = $this->uri->segment(4); //die($id);
                
        $this->Product_category_checklist_model->delete($id);
        $this->session->set_flashdata('message', 'Delete Record Success');
        redirect(site_url('product_category/add_detail/'.$this->uri->segment(3)));
        
    }

    public function _rules() {
        $this->form_validation->set_rules('product_category', 'product_category', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function _rules_checklist() {
        $this->form_validation->set_rules('product_category', 'product_category', 'trim|required');        
        $this->form_validation->set_error_delimiters('<span class="text-red">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_product_category.xls";
        $judul = "tb_product_category";
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