<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Label extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Label_model');
        $this->load->model('Product_category_model');
        $this->load->library('form_validation');
        chek_session();
    }

    public function index() {
        $label = $this->Label_model->get_all();
        $product_category = $this->Product_category_model->get_all();
        
        $data = array(
            'label_data' => $label,
            'product_category' => $product_category
        );
        
        $this->template->display('label/tb_label_list', $data);
    }

    public function read($id) {
        $row = $this->Label_model->get_by_id($id);
        if ($row) {
            $data = array(
                'id' => $row->id,
                'label_name' => $row->label_name,
            );
            $this->template->display('label/tb_label_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('label'));
        }
    }

    public function create() {
        $product_category = $this->Product_category_model->get_all();

        $data = array(
            'button' => 'Create',
            'action' => site_url('label/create_action'),
            'id' => set_value('id'),
            'label_name' => set_value('label_name'),
            'product_category_id' => set_value('product_category_id'),
            'uid' => $this->session->userdata('user_id'),
            'product_category' => $product_category
        );
        $this->template->display('label/tb_label_form', $data);
    }

    public function create_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'label_name' => $this->input->post('label_name', TRUE),
                'product_category_id' => $this->input->post('product_category_id',TRUE),
                'uid' => $this->session->userdata('user_id'),
            );
                       
            $this->Label_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('label'));
        }
    }

    public function update($id) {
        $row = $this->Label_model->get_by_id($id);
        $product_category = $this->Product_category_model->get_all();

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('label/update_action'),
                'id' => set_value('id', $row->id),
                'label_name' => set_value('label_name', $row->label_name),
                'product_category_id' => set_value('product_category_id', $row->product_category_id),
            );
            $data['product_category'] = $product_category;
            $this->template->display('label/tb_label_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('label'));
        }
    }

    public function update_action() {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
                'label_name' => $this->input->post('label_name', TRUE),
                'product_category_id' => $this->input->post('product_category_id', TRUE),
            );

            $this->Label_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('label'));
        }
    }

    public function delete($id) {
        $row = $this->Label_model->get_by_id($id);

        if ($row) {
            $this->Label_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('label'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('label'));
        }
    }

    public function _rules() {
        $this->form_validation->set_rules('label_name', 'label_name', 'trim|required|max_length[100]');
        $this->form_validation->set_rules('id', 'id', 'trim');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel() {
        $this->load->helper('exportexcel');
        $namaFile = "tb_label.xls";
        $judul = "tb_label";
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
        xlsWriteLabel($tablehead, $kolomhead++, "Description");
        xlsWriteLabel($tablehead, $kolomhead++, "Uid");

        foreach ($this->Label_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
            xlsWriteNumber($tablebody, $kolombody++, $data->label_name);
            xlsWriteNumber($tablebody, $kolombody++, $data->uid);

            $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

}

/* End of file Days.php */
/* Location: ./application/controllers/Days.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-19 09:43:57 */