<?php

include_once 'config.php';
include_once '_include/logger.class.php';

class connectDb {
	protected $db;
	protected $log;
	
	public function __construct() {
		$this->log = new Logger();
		
		$this->db = new mysqli(BDD_IP,BDD_USER,BDD_PASS,BDD_SCHEMA);
			
		if ($this->db->connect_errno) {
			    $this->log->info('GLOBAL | Connection MySQL impossible : ' . $this->db->connect_error );
			    exit;
		}
	}
	/*
	 * *
	 * Destructor
	 */
	public function __destruct() {
	
	}
	
}

?>