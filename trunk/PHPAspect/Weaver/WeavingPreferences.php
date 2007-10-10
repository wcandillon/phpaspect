<?php
class WeavingPreferences{
    
    private $beautify = true;
    
    private $verbose = false;
    
    public function getBeautify(){
        return $this->beautify;    
    }
    
    public function getVerbose(){
        return $this->verbose;
    }
    
    public function setBeautify($beautify){
        $this->beautify = (boolean)$beautify;
    }
    
    public function setVerbose($verbose){
        $this->verbose = (boolean)$verbose;
    }
    
    public function setDefaults(){
        $this->beautify = true;
        $this->verbose  = false;
    }
}
?>