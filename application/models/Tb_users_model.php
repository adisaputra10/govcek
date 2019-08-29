<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tb_users_model extends CI_Model {

    public $table = 'tb_users';
    public $id = 'id';
    public $desc = 'company';
    public $order = 'ASC';

    function __construct() {
        parent::__construct();
    }

    function get_tb_users() {
        //$this->db->where($this->id, $id);
        $this->db->order_by($this->desc, $this->order);        
        return $this->db->get($this->table)->result();
    }

    // get all
    function get_all() {
        /*
        $this->db->select('e.*, u.description as unit_system, s.schedule as inspection_schedule', false);
        $this->db->from('end_user as e');
        $this->db->join('unit as u', 'e.unit_system_id = u.id','left');
        $this->db->join('schedule as s', 'e.inspection_schedule_id = s.id','left');

        return $this->db->get_where($this->table, array('e.uid' => $this->session->userdata('user_id')))->result();
        */
    
        $uid = $this->session->userdata('user_id');
        
        $kueri = " 
            SELECT i.inspector_name, tb.username, m.manufacture_name
            FROM 
                 inspector i
                LEFT JOIN
                    tb_users tb ON i.link_to_user = tb.id
                LEFT JOIN
                    manufacture m ON i.manufacture_id = m.id";
                    
            //WHERE 
            //    dt.uid = ".$this->session->userdata('user_id');
        
        //echo $kueri; die();

        $result = $this->db->query($kueri)->result();

        return $result;
    }
    
    function get_free_all() 
    {
        $uid = $this->session->userdata('user_id');
        $kueri = " 
            SELECT dt.*, eu.company as major_name
            FROM 
                (SELECT 
                    e.*,
                    u.description AS unit_system,
                    s.schedule AS inspection_schedule    
                FROM
                    end_user e
                    LEFT JOIN
                        hp_unit u ON e.unit_system_id = u.id
                    LEFT JOIN
                        hp_schedule s ON e.inspection_schedule_id = s.id
                ) as dt    
                LEFT JOIN 
                    end_user eu ON dt.major_id = eu.id";
     
        $result = $this->db->query($kueri)->result();

        return $result;
    }

    function get_customer($cid){
        $uid = $this->session->userdata('user_id');        
        $kueri = " 
            SELECT eu.company, procat.product_category, cat.category, ins.inspector_name,
            req.*, det.*, loc.location_name, mst.*, det.status as status_inspection,
            unit.description as unit_name, sc.schedule, sc.interval_value,
                CASE sc.interval_label 
                  WHEN 'MONTH' THEN DATE_ADD(mst.expire_date,INTERVAL sc.interval_value MONTH) 
                  WHEN 'MONTH' THEN DATE_ADD(mst.expire_date,INTERVAL sc.interval_value DAY) 
                END AS next_date_te
            FROM request_inspection req
            LEFT JOIN request_detail_inspection det ON req.id =  det.parent_id
            LEFT JOIN product_category procat ON req.product_category_id =  procat.id
            LEFT JOIN category cat ON det.mst_product_id = cat.id
            LEFT JOIN end_user eu ON req.end_user_id = eu.id
            LEFT JOIN inspector ins ON req.inspector_id = ins.id
            LEFT JOIN location loc ON det.location_id = loc.id
            LEFT JOIN mst_product mst ON req.equipment_id = mst.id 
            LEFT JOIN hp_unit unit ON mst.unit_system_id = unit.id
            LEFT JOIN hp_schedule sc ON mst.inspection_schedule_id = sc.id
            WHERE
            req.end_user_id = ".$cid;    
            
            //AND m.uid = ".$this->session->userdata('user_id');
        
        //echo $kueri; die();
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
        $this->db->or_like('company', $q);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    // get data with limit and search
    function get_limit_data($limit, $start = 0, $q = NULL) {
        $this->db->order_by($this->id, $this->order);
        $this->db->like('id', $q);
        $this->db->or_like('company', $q);
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

    function get_by_id_user($id) {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table1)->row();
    }

    function get_end_user_uid($mi) {
        $this->db->where($this->id, $mi);
        return $this->db->get($this->table)->row();
    }

}

/* End of file Pelanggan_model.php */
/* Location: ./application/models/Pelanggan_model.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10s-14 11:09:25 */