<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Master_product_model extends CI_Model {

    public $table = 'mst_product';
    public $id = 'id';
    public $cat = 'category_id';
    public $order = 'ASC';

    function __construct() {
        parent::__construct();
    }

    // get all
    function get_all() 
    {
        //$this->db->order_by($this->id, $this->order);
        //return $this->db->get_where($this->table, array('uid' => $this->session->userdata('user_id')))->result();        

        $uid = $this->session->userdata('user_id');
        $major = $this->session->userdata('user_major');        
        //echo '--> '.$this->session->userdata('user_major').'/'.$this->session->userdata('user_uid');die();
        
        $kueri = "             
                SELECT 
                    m.*, pc.product_category, cat.category, u.description as unit_system, s.schedule, e.company as end_user, man.manufacture_name, 
                    max(b.service_date) as last_inspection, st.status_name
                FROM 
                    mst_product m
                    LEFT JOIN product_category pc ON m.product_category_id = pc.id
                    LEFT JOIN category cat ON m.category_id = cat.id
                    LEFT JOIN hp_unit u ON m.unit_system_id = u.id
                    LEFT JOIN hp_schedule s ON m.inspection_schedule_id = s.id
                    LEFT JOIN end_user e ON m.end_user_id = e.id
                    LEFT JOIN manufacture man ON m.manufacture_id = man.id
                    LEFT JOIN begin_inspection b ON m.id = b.parent_id 
                    LEFT JOIN hp_status st ON m.status = st.id               
                WHERE 
                    m.uid = ".$this->session->userdata('user_major')." 
                    GROUP BY m.id 
                    ORDER BY m.id ASC";        

                    //var_dump($kueri);
                    //die();
        $result = $this->db->query($kueri)->result();

        return $result;
    }

    function api_get_all() 
    {
        //$this->db->order_by($this->id, $this->order);
        //return $this->db->get_where($this->table, array('uid' => $this->session->userdata('user_id')))->result();        

             
        //echo '--> '.$this->session->userdata('user_major').'/'.$this->session->userdata('user_uid');die();
        
        $kueri = "             
                SELECT 
                    m.*, pc.product_category, cat.category, u.description as unit_system, s.schedule, e.company as end_user, man.manufacture_name, 
                    max(b.service_date) as last_inspection, st.status_name
                FROM 
                    mst_product m
                    LEFT JOIN product_category pc ON m.product_category_id = pc.id
                    LEFT JOIN category cat ON m.category_id = cat.id
                    LEFT JOIN hp_unit u ON m.unit_system_id = u.id
                    LEFT JOIN hp_schedule s ON m.inspection_schedule_id = s.id
                    LEFT JOIN end_user e ON m.end_user_id = e.id
                    LEFT JOIN manufacture man ON m.manufacture_id = man.id
                    LEFT JOIN begin_inspection b ON m.id = b.parent_id 
                    LEFT JOIN hp_status st ON m.status = st.id               
                    GROUP BY m.id 
                    ORDER BY m.id ASC";        

                    //var_dump($kueri);
                    //die();
        $result = $this->db->query($kueri)->result();

        return $result;
    }
    
    function get_customer($cid, $cat, $eq){
        $uid = $this->session->userdata('user_id');        
        $filter = " m.end_user_id = ".$cid;
        ($cat) ? $filter .= " AND m.category_id = ".$cat : $filter = $filter;
        ($eq) ? $filter .= " AND m.product_category_id = ".$eq : $filter = $filter;
        //die($filter);
        
        $kueri1 = " 
            SELECT 
                cat.category, procat.product_category, 
                b.service_date AS date_this_te, MAX(c.service_date) AS date_last_te,
                u.description AS unit_name, 
                b.comment, s.status_name, 
                m.*
            FROM  
                mst_product m
                LEFT JOIN category cat ON m.category_id = cat.id
                LEFT JOIN product_category procat ON m.product_category_id = procat.id
                LEFT JOIN hp_unit u ON m.unit_system_id = u.id
                LEFT JOIN hp_status s ON m.status = s.id
                LEFT JOIN begin_inspection b ON m.id = b.parent_id 
                    AND b.service_date = (SELECT MAX(b1.service_date) FROM begin_inspection b1 WHERE b1.parent_id = b.parent_id)
                LEFT JOIN begin_inspection c ON m.id = c.parent_id 
                    AND c.service_date < (SELECT MAX(b2.service_date) FROM begin_inspection b2 WHERE b2.parent_id = c.parent_id) 
            WHERE ".$filter." AND b.service_date IS NOT NULL
            GROUP BY cat.category, procat.product_category";  

        $kueri = " 
            SELECT 
                cat.category,
                procat.product_category,
                m.service_date,
                b.service_date AS last_inspection_date,
                m.expire_date,
                u.description AS unit_name,
                b.comment,
                s.status_name,
                m.*
            FROM
                mst_product m
                    LEFT JOIN
                category cat ON m.category_id = cat.id
                    LEFT JOIN
                product_category procat ON m.product_category_id = procat.id
                    LEFT JOIN
                hp_unit u ON m.unit_system_id = u.id
                    LEFT JOIN
                hp_status s ON m.status = s.id
                    LEFT JOIN
                begin_inspection b ON m.id = b.parent_id
            WHERE ".$filter;    
        
        //echo $kueri; die();
        $result = $this->db->query($kueri)->result();
        return $result;
    }

    function update_expire_date($service_date,$schedule_id,$id)
    {
        $schedule ="SELECT * FROM hp_schedule WHERE id = ".$schedule_id;
        $result = $this->db->query($schedule)->row();
        
        $kueri = "SELECT DATE_ADD('".$service_date."', ".$result->interval_value.") as exp_date";
        $result = $this->db->query($kueri)->row();
        
        $kueri = "UPDATE mst_product SET expire_date = '".$result->exp_date."' WHERE id = ".$id;
        $this->db->query($kueri);

        return;
    }

    function get_new_expire_date($id,$service_date)
    {
        $schedule = 
            "SELECT 
                m.*, s.*
            FROM 
                mst_product m
                LEFT JOIN hp_schedule s ON m.inspection_schedule_id = s.id                
            WHERE m.id = ".$id;

        $result = $this->db->query($schedule)->row();

        $kueri = "SELECT DATE_ADD('".$service_date."', INTERVAL ".$result->interval_value." ".$result->interval_label.") as exp_date";
        
        $kueri_exp = $this->db->query($kueri)->row();

        //echo $service_date.'/'.$result->interval_value.'/'.$kueri_exp->exp_date;
        //echo '<pre>';print_r($result);die();

        $kueri = "UPDATE mst_product SET expire_date = '".$kueri_exp->exp_date."' WHERE id = ".$id;     
        $this->db->query($kueri);

        return;

    }

    function update_service_date($id,$service_date)
    {
        $kueri = "UPDATE mst_product SET service_date = '".$service_date."' WHERE id = ".$id;        
        $this->db->query($kueri);
        return;
    }

    function cek_duplikasi($cat, $serial)
    {
        $uid = $this->session->userdata('user_id');        
        $kueri = " 
            SELECT *
            FROM 
                mst_product 
            WHERE 
                category_id = ".$cat." AND serial_number = '".$serial."' AND uid = ".$this->session->userdata('user_id');
        
        //echo $kueri; die();
        $result = $this->db->query($kueri)->result();

        return $result;
    }

    function get_by_category_id($id){
        $kueri = "
            SELECT
                m.*, c.category, p.product_category
            from 
                mst_product m
                left join category c ON m.category_id = c.id 
                left join product_category p ON m.product_category_id = p.id
            where
                m.product_category_id = ".$id
        ;
        //die($kueri);
        $result = $this->db->query($kueri)->result();            
        return $result;
    }

    function get_master_product($id){
        $uid = $this->session->userdata('user_id');
        $query = "SELECT 
            mst.id,
            cat.category,
            procat.product_category,
            enduser.company,
            man.manufacture_name,
            mst.serial_number,
            mst.asset_number,
            mst.service_date,
            mst.quick_check_no,
            unit.description AS unit_name,
            inspect.inspection_name
        FROM
            mst_product mst
                LEFT JOIN
            detail_product det ON mst.id = det.id
                LEFT JOIN
            category cat ON mst.category_id = cat.id
                LEFT JOIN
            product_category procat ON mst.product_category_id = procat.id
                LEFT JOIN
            end_user enduser ON mst.end_user_id = enduser.id
                LEFT JOIN
            manufacture man ON mst.manufacture_id = man.id
                LEFT JOIN
            hp_unit unit ON mst.unit_system_id = unit.id
                LEFT JOIN
            inspection_schedule inspect ON mst.inspection_schedule_id = inspect.id
        WHERE
            mst.product_category_id = ".$id;

        //echo $query; die();
        $result = $this->db->query($query)->result();

        return $result;
    }    

    // untuk add detail_product
    function get_master_by($id) {        
        $uid = $this->session->userdata('user_id');        
        $kueri = " 
            SELECT 
                m.*, pc.product_category, cat.category, u.description as unit_system, s.schedule, e.company as end_user, man.manufacture_name       
            FROM 
                mst_product m
                LEFT JOIN product_category pc ON m.product_category_id = pc.id
                LEFT JOIN category cat ON m.category_id = cat.id
                LEFT JOIN hp_unit u ON m.unit_system_id = u.id
                LEFT JOIN hp_schedule s ON m.inspection_schedule_id = s.id
                LEFT JOIN end_user e ON m.end_user_id = e.id
                LEFT JOIN manufacture man ON m.manufacture_id = man.id
            WHERE 
                m.id = ".$id; //." and m.uid = ".$this->session->userdata('user_id');
        
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