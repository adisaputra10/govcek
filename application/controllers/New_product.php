<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class New_product extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Product_category_model');
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

    public function _rules() {
        $this->form_validation->set_rules('product_category', 'product_category', 'trim|required');
        $this->form_validation->set_rules('id', 'id', 'trim');
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