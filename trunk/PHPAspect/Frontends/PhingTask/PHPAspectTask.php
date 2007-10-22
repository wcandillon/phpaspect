<?php
require_once 'phing/Task.php';

class PHPAspectTask extends Task{
    /**
     * The message passed in the buildfile.
     */
    private $message = null;

    /**
     * The setter for the attribute "message"
     */
    public function setMessage($str) {
        $this->message = $str;
    }

    /**
     * The init method: Do init steps.
     */
    public function init() {

    }

    /**
     * The main entry point method.
     */
    public function main() {
    	
    }
}

?>
