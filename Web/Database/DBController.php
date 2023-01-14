<?php

namespace Database;

class DBController
{
    protected $host = 'localhost';
    protected $user = 'root';
    protected $port = '3306';
    protected $password = '';
    protected $database = 'shopheredb';


    public $con = null;

    public function __construct()
    {
        $this->con = mysqli_connect($this->host, $this->user,$this->password,$this->database, $this->port);
        if ($this->con->connect_error) {
            echo "Fail" . $this->con->connect_error;
        }

//        echo "success";

    }


    public function __destruct()
    {
        // TODO: Implement __destruct() method.
        $this->closeConnection();
    }


    // close connection
    protected function closeConnection(){
        if($this->con != null){
            $this->con->close();
            $this->con = null;
        }
    }
}


