<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Request_inspection_model extends CI_Model {

    public $table = 'request_inspection';
    public $id = 'id';
    public $order = 'DESC';

    function __construct() {
        parent::__construct();
    }

    // get all
    function get_all() {
        /*$this->db->order_by($this->id, $this->order);
        return $this->db->get_where($this->table, array('uid' => $this->session->userdata('user_id')))->result();*/
        $uid = $this->session->userdata('user_id');        
        $kueri = " 
            SELECT 
                r.*,i.inspector_name,e.company,p.product_category,st.status_name,
                mst.category_id as mst_cat_id, mst.product_category_id as procat_id, mst.end_user_id as mst_end_user_id,
                cat.category as category_name
            FROM 
                request_inspection r
                LEFT JOIN end_user e ON r.end_user_id = e.id
                LEFT JOIN product_category p ON r.product_category_id = p.id                
                LEFT JOIN status st ON r.status_id = st.id
                LEFT JOIN inspector i ON r.inspector_id = i.id
                LEFT JOIN mst_product mst ON r.equipment_id = mst.id
                LEFT JOIN category cat ON mst.category_id = cat.id
            WHERE 
                r.uid = ".$uid;
        
        //echo $kueri; die();

        $result = $this->db->query($kueri)->result();

        return $result;
    }

    function api_get_all() {
        /*$this->db->order_by($this->id, $this->order);
        return $this->db->get_where($this->table, array('uid' => $this->session->userdata('user_id')))->result();*/
        $uid = $this->session->userdata('user_id');        
        $kueri = " 
            SELECT 
                r.*,i.inspector_name,e.company,p.product_category,st.status_name,
                mst.category_id as mst_cat_id, mst.product_category_id as procat_id, mst.end_user_id as mst_end_user_id,
                cat.category as category_name
            FROM 
                request_inspection r
                LEFT JOIN end_user e ON r.end_user_id = e.id
                LEFT JOIN product_category p ON r.product_category_id = p.id                
                LEFT JOIN status st ON r.status_id = st.id
                LEFT JOIN inspector i ON r.inspector_id = i.id
                LEFT JOIN mst_product mst ON r.equipment_id = mst.id
                LEFT JOIN category cat ON mst.category_id = cat.id
          ";
        
        //echo $kueri; die();

        $result = $this->db->query($kueri)->result();

        return $result;
    }

    function get_all_by_id($id) {
        /*$this->db->order_by($this->id, $this->order);
        return $this->db->get_where($this->table, array('uid' => $this->session->userdata('user_id')))->result();*/
        $uid = $this->session->userdata('user_id');        
        $kueri = " 
            SELECT 
                r.*,i.inspector_name,e.company,p.product_category,st.status_name
            FROM 
                request_inspection r
                LEFT JOIN end_user e ON r.end_user_id = e.id
                LEFT JOIN product_category p ON r.product_category_id = p.id                
                LEFT JOIN status st ON r.status_id = st.id
                LEFT JOIN inspector i ON r.inspector_id = i.id
            WHERE 
                r.id =".$id." and r.uid = ".$uid;
        
        //echo $kueri; die();

        $result = $this->db->query($kueri)->result();

        return $result;
    }

    // get data by id
    function get_by_id($id) {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }

    // get total rows
    function total_rows($q = NULL) {
        $this->db->like('id', $q);
        $this->db->or_like('days_desc', $q);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    // get data with limit and search
    function get_limit_data($limit, $start = 0, $q = NULL) {
        $this->db->order_by($this->id, $this->order);
        $this->db->like('id', $q);
        $this->db->or_like('days_desc', $q);
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

    // delete data
    function delete($id) {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table);
    }

}

/* End of file Request_inspection_model.php */
/* Location: ./application/models/Request_inspection_model.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2018-01-26 11:00:01 */