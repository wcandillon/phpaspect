<?php
class WeavingPreferences{
    
    private $beautify = true;
    
    private $verbose = false;
    
    private $runtimeIncludePath;
    
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
        $this->runtimeIncludePath = null;
    }
    
    public function getRuntimeIncludePath(){
    	if($this->runtimeIncludePath == null){
    		throw new Exeception('You must specify the path where to store aspects entities at Runtime');
    	}
    	return $this->runtimeIncludePath;
    }
    
    public function setRuntimeIncludePath($runtimeIncludePath){
    	$url = realpath($runtimeIncludePath);
    	if(!$url || !is_dir($url)){
    		throw new MalformedURLException($url, DIRECTORY_URL);
    	}elseif (!is_writable($url)){
    		throw new Exception($url." isn't a writable directory");
    	}
    	$this->runtimeIncludePath = $url.DIRECTORY_SEPARATOR.'_Aspects';
    }
}
?>