<?php

namespace Database;

class Product
{
    public $db = null;

    public function __construct(DBController $db)
    {
        if(!isset($db->con)) return null;
        $this->db = $db;
    }

//    getData

    public function getData($table='product'){
        $result = $this->db->con->query("SELECT * FROM {$table}");

        $resultArray = array();

        while ($item = mysqli_fetch_array($result,MYSQLI_ASSOC)){
            $resultArray[] = $item;
        }

        return $resultArray;
    }

    public function getProductVarients($table,$PID){
        $result = $this->db->con->query("SELECT * FROM {$table} AS pv WHERE pv.product_id = {$PID} AND pv.sku IN (SELECT sku FROM stock WHERE avai_stock>=0 ) ");

        $resultArray = array();

        while ($item = mysqli_fetch_array($result,MYSQLI_ASSOC)){
            $resultArray[] = $item;
        }
        //print_r($resultArray);
        return $resultArray;
    }

    public function getAvailableQuantity($sku){
        $result = $this->db->con->query("SELECT avai_stock FROM stock WHERE sku ='{$sku}'");

        $resultArray = array();

        while ($item = mysqli_fetch_array($result,MYSQLI_ASSOC)){
            $resultArray[] = $item;
        }
        return $resultArray;
    }



    
}


