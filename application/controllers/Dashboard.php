<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model(array('Transaksi_model', 'Pelanggan_model','Manufacture_model','Inspector_model','Product_category_model','End_user_model'));        
        chek_session();
    }

    function index() {
        $data['title'] = "Home";
 
        $ori_id = $this->End_user_model->get_by_id_user($this->session->userdata('user_id'));
        $mi = $ori_id->major_id;        

        //get uid at end_users
        $eu = $this->End_user_model->get_end_user_uid($mi);                
        //echo $mi.'/'.$eu->uid.'<br><pre>';print_r($eu);die();

        $uid = $eu->uid;
        //$uid = $this->session->userdata('user_id');

        //update session agar sama dengan major
        //$_SESSION['user_id'] = $uid;
        $_SESSION['user_major'] = $uid;
        $_SESSION['user_uid'] = $mi;
        
        if ($this->ion_auth->is_admin()) { 
            //$data['manufacture'] = $this->db->query("SELECT COUNT(*) AS count_manufacture FROM manufacture WHERE uid=$uid ")->result();
            $data['manufacture'] = $this->db->query("SELECT COUNT(*) AS count_manufacture FROM mst_product ")->result();
            $data['out_of_service'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 3 ")->result();
            $data['not_found'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 4 ")->result();
            $data['no_defect'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 5 ")->result();
            $data['discard'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 6 ")->result();
            $data['repair'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 7 ")->result();
            $data['valid'] = $this->db->query("SELECT count(*) as total_valid FROM `mst_product` WHERE status = 8 ")->result();
            $data['expired'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 9 ")->result();
            $data['unsafe'] = $this->db->query("SELECT count(*) as total_unsafe FROM `mst_product` WHERE status = 10 ")->result();
            $data['due'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 11 ")->result();
            $data['product_category'] = $this->db->query("SELECT COUNT(*) AS count_product_category FROM product_category WHERE uid=$uid ")->result();
            $data['user'] = $this->db->get('tb_users')->num_rows();            
            $this->template->display('dashboard/admin', $data);
        } else {            
            $data['manufacture'] = $this->db->query("SELECT COUNT(*) AS count_manufacture FROM mst_product ")->result();
            $data['out_of_service'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 3 ")->result();
            $data['not_found'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 4 ")->result();
            $data['no_defect'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 5 ")->result();
            $data['discard'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 6 ")->result();
            $data['repair'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 7 ")->result();
            $data['valid'] = $this->db->query("SELECT count(*) as total_valid FROM `mst_product` WHERE status = 8 ")->result();
            $data['expired'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 9 ")->result();
            $data['unsafe'] = $this->db->query("SELECT count(*) as total_unsafe FROM `mst_product` WHERE status = 10 ")->result();
            $data['due'] = $this->db->query("SELECT count(*) as total FROM `mst_product` WHERE status = 11 ")->result();
            $data['product_category'] = $this->db->query("SELECT COUNT(*) AS count_product_category FROM product_category WHERE uid=$uid ")->result();
            $data['user'] = $this->db->get('tb_users')->num_rows();            
            //$this->template->display('dashboard/admin', $data);
            $this->template->display('dashboard/member', $data);
        }
    }

}

