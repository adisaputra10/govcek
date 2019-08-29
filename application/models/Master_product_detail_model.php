<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Master_product_detail_model extends CI_Model {

    public $table = 'detail_product';
    public $id = 'id';    
    public $order = 'ASC';

    function __construct() {
        parent::__construct();
    }

    // get all by master_product.id
    function get_all() {       

        $uid = $this->session->userdata('user_id');        
        $kueri = " 
            SELECT 
                m.*, pc.product_category, cat.category, u.description as unit_system, s.schedule, e.company as end_user, man.manufacture_name       s
            FROM 
                mst_product m
                LEFT JOIN product_category pc ON m.product_category_id = pc.id
                LEFT JOIN category cat ON m.category_id = cat.id
                LEFT JOIN hp_unit u ON m.unit_system_id = u.id
                LEFT JOIN hp_schedule s ON m.inspection_schedule_id = s.id
                LEFT JOIN end_user e ON m.end_user_id = e.id
                LEFT JOIN manufacture man ON m.manufacture_id = man.id
            WHERE 
                m.uid = ".$uid;
        
        //echo $kueri; die();

        $result = $this->db->query($kueri)->result();

        return $result;
    }

    function get_all_detail_by($id){
        $uid = $this->session->userdata('user_id'); 
        $kueri = "
            SELECT 
            d.*, adj.deskripsi, le.legs_name, bas.type_description, gr.grade_name, con.construction_name 
            from 
                detail_product d
                LEFT JOIN adjustable adj ON d.adjustable_id = adj.id
                LEFT JOIN legs le ON d.legs_id = le.id
                LEFT JOIN basic_type bas ON d.basic_type_id = bas.id
                LEFT JOIN grade gr ON d.grade_id = gr.id
                LEFT JOIN construction con ON d.construction_id = con.id
            where d.product_id = ".$id." and d.uid = ".$uid;
        //die($kueri);
        $result = $this->db->query($kueri)->result();        
        return $result;
    }

    function get_edit_by($id){
        $uid = $this->session->userdata('user_id'); 
        $kueri = "
            SELECT
            d.*, adj.deskripsi, le.legs_name, bas.type_description, gr.grade_name, con.construction_name 
            from 
                detail_product d
                LEFT JOIN adjustable adj ON d.adjustable_id = adj.id
                LEFT JOIN legs le ON d.legs_id = le.id
                LEFT JOIN basic_type bas ON d.basic_type_id = bas.id
                LEFT JOIN grade gr ON d.grade_id = gr.id
                LEFT JOIN construction con ON d.construction_id = con.id
            where d.id = ".$id." and d.uid = ".$uid;
        //die($kueri);
        $result = $this->db->query($kueri)->result();        
        return $result;
    }

    function get_rows() {
        $this->db->order_by($this->id, $this->order);
        return $this->db->get_where($this->table, array('uid' => $this->session->userdata('user_id')))->num_rows();
    }

    // get data by id
    function get_by_id($id) {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }

    // get total rows
    function total_rows($q = NULL) {
        $this->db->like('id', $q);
        $this->db->or_like('master_product', $q);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    // get data with limit and search
    function get_limit_data($limit, $start = 0, $q = NULL) {
        $this->db->order_by($this->id, $this->order);
        $this->db->like('id', $q);
        $this->db->or_like('master_product', $q);
        $this->db->limit($limit, $start);
        return $this->db->get($this->table)->result();
    }

    // insert data
    function insert($data) {
        $this->db->insert($this->table, $data);
    }

    // update data
    function update($id, $data) {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    function update_detail($data)
    {
        print_r($data);die();
    }

    // delete data
    function delete($id) {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table);
    }

}

/* End of file Master_product_model.php */
/* Location: ./application/models/Master_product_model.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-14 11:09:25 */