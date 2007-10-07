<?php
class InvalidParameterException extends Exception{
    
    private $param;
    
    public function __construct($param){
        super::__construct("Invalid parameter:\n".var_dump($param, true));
    }
    
    public function getParameter(){
        return $this->param;
    }
    
    public function getParameterType(){
        return is_object($this->param)?
                    get_class($this->param) : gettype($this->param);
    }
}
?>