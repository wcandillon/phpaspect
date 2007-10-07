<?php
require_once 'PHPAspect/Weaver/Weaver.php';
require_once 'PHPAspect/Weaver/FileManager.php';
require_once 'PHPAspect/Weaver/WeavingPreferences.php';

class PHPAspectWeaver extends XSLWeaver implements Weaver{
    
    private $aspectURLs  = array();
    private $phpFileURLs = array();
    private $options;
        
    const PHPASPECT_CONTENTTYPE = 'ap';
    const PHP_CONTENTTYPE       = 'php, php3, php4, php5, phtml, inc';

    public function __construct(WeavingOptions $options=null, $aspectURLs=null, $phpFileURLs=null){
        if($options){
            $this->options = $options;    
        }
        
        if(is_dir($aspectURLs)){
            $this->addAspects($aspectURLs);
        }elseif(is_string($aspectURLs)){
            $this->addAspectURL($aspectURLs);
        }elseif(is_array($aspectURLs)){
            foreach($aspectURLs as $url){
                $this->addAspectURL($url);
            }
        }elseif($aspectURLs != null){
            throw new InvalidParameterException($aspectURLs);
        }
        
        if(is_string($phpFileURLs) && is_dir($phpFileURLs)){
            $this->addPHPFiles($phpFileURLs);
        }elseif(is_string($phpFileURLs)){
            $this->addPHPFileURL($phpFileURLs);
        }elseif(is_array($fileURLs)){
            foreach($phpFileURLs as $url){
                $this->addPHPFileURL($url);
            }
        }elseif($phpFileURLs != null){
            throw new InvalidParameterException($phpFileURLs);
        }
    }
    
    public function addAspects($directory, $recursive=true){
        if(!$directory = realpath($directory)){
            throw new MalformedURLException($directory, DIRECTORY_URL);
        }
        
        $files = scandir($directory);
        foreach($files as $fileName){
            $url = $directory.DIRECTORY_SEPARATOR.$fileName;
            if(is_dir($url) && $recursive){
                $this->addAspects($url, true);
            }elseif($this->isAspectURL($url)){
                $this->addAspectURL($url);
            }
        }
    }
    
    protected function isAspectURL($aspectURL){
        if(!is_file($aspectURL)){
            throw MalformedURLException($aspectURL);
        }
        $contentType = pathinfo($aspectURL, PATHINFO_EXTENSION);
        return eregi($contentType, self::PHPASPECT_CONTENTTYPE);
    }
    
    protected function isPHPFileUrl($fileURL){
        if(!is_file($fileURL)){
            throw MalformedURLException($fileURL);
        }
        return eregi($contentType, self::PHP_CONTENTTYPE);
    }
    
    public function addPHPFiles($directory, $recursive=true){
        if(!is_dir($directory)){
            throw new MalformedURLException($directory, DIRECTORY_URL);
        }
        
        $files = scandir($directory);
        foreach($files as $fileName){
            $url = $directory.DIRECTORY_SEPARATOR.$fileName;
            if(is_dir($url) && $recursive){
                $this->addPHPFiles($url, true);
            }elseif($this->isPHPFileURL($url)){
                $this->addPHPFileURL($url);
            }
        }
    }

    public function getAspectURLs(){
        return $this->aspectURLs;
    }
    
    public function getAspectURL($aspectName){
        foreach($this->aspectURLs as $key => $url){
            if($fileName == pathinfo($url, PATHINFO_FILENAME)){
                return $this->aspectURLs[$key];
            }
        }        
    }
    
    public function setAspectURLs(array $aspectURLs){
        foreach($aspectURLs as $url){
            $this->addAspectURL($url);
        }
    }
    
    public function addAspectURL($aspectURL){
        if($this->isAspectURL($aspectURL)){
            $this->aspectURLs[] = $aspectURL;   
        }
    }
    
    public function removeAspectURL($aspectName){
        foreach($this->aspectURLs as $key => $url){
            if($fileName == pathinfo($url, PATHINFO_FILENAME)){
                unset($this->aspectURLs[$key]);
            }
        }
    }
    
    public function getPHPFileURLs(){
        return $this->fileURLs;
    }
    
    public function getPHPFileURL($filename){
        foreach($this->fileURLs as $key => $url){
            if($fileName == pathinfo($url, PATHINFO_FILENAME)){
                return $this->fileURLs[$key];
            }
        }
    }
    
    public function setPHPFileURLs(array $fileURLs){
        foreach($fileURLs as $url){
            $this->addPHPFileURL($url);
        }
    }
    
    public function addPHPFileURL($phpFileURL){
        if($this->isPHPFileURL($phpFileURL)){
            $this->phpFileURLs[] = $fileURL;
        }
    }
    
    public function removePHPFileUrl($fileName){
        foreach($this->phpFileURLs as $key => $url){
            if($fileName == pathinfo($url, PATHINFO_FILENAME)){
                unset($this->phpFileURLs[$key]);
            }
        }
    }
    
    public function getWeavingOptions(){
        $this->options;
    }
    
    public function setWeavingPreferences(WeavingPreferences $options){
        $this->options;
    }
    
    public function resetWeavingPreferences(){
        $this->options = new WeavingPreferences();
    }
    
    public function reset(){
        $this->aspectURLs = array();
        $this->fileURLs   = array();
        $this->resetWeavingPreferences();
    }

    
    public function weave($destinationURL){
        if(!is_dir($destinationURL)){
            throw new MalformedURLException($directory);
        }elseif(!is_writable($destinationURL)){
            throw new Exception("$destinationURL isn't writable");
        }
        //Put a lock on the directory
        $aspectDir = $destinationURL.'/aspects';
        mkdir($aspectDir);
        foreach($his->aspectURLs as $aspect){
            XSLTWeaver::generateAspectRuntimeEntities($aspect, $aspectDir);
        }
    }
    
    public function weaveFile($fileURL){}
    public function weaveFileIn($fileURL, $destinationURL){}
    public function weaveString($string){}
    public function weaveStringIn($string, $destinationURL){}
    
    private function getFileName($url){
        return pathinfo($url, PATHINFO_FILENAME);
    }
    
    /**
     * Copy a file, or recursively copy a folder and its contents
     *
     * @author      Aidan Lister <aidan@php.net>
     * @version     1.0.1
     * @link        http://aidanlister.com/repos/v/function.copyr.php
     * @param       string   $source    Source path
     * @param       string   $dest      Destination path
     * @return      bool     Returns TRUE on success, FALSE on failure
     */
    private function copyr($source, $dest){
        // Simple copy for a file
        if (is_file($source)) {
            return copy($source, $dest);
        }
    
        // Make destination directory
        if (!is_dir($dest)) {
            mkdir($dest);
        }

        // Loop through the folder
        $dir = dir($source);
        while (false !== $entry = $dir->read()) {
            // Skip pointers
            if ($entry == '.' || $entry == '..') {
                continue;
            }
            // Deep copy directories
            if ($dest !== "$source/$entry") {
                copyr("$source/$entry", "$dest/$entry");
            }
        }
        // Clean up
        $dir->close();
        return true;
    }
}
?>