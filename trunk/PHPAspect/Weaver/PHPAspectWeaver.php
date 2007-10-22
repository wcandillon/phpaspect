<?php
/*******************************************************************************
 * Copyright (c) 2006-2007 William Candillon.
 * All rights reserved.
 * This program and the accompanying materials are made available
 * under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution and is available at
 * http://eclipse.org/legal/epl-v10.html
 *
 * @author William Candillon <wcandillon@elv.telecom-lille1.eu>
 * @category   PHP
 * @package    PHPAspect/Weaver
 * @author     William Candillon <wcandillon@elv.telecom-lille1.eu>
 * @license    http://eclipse.org/legal/epl-v10.html EPL
 * @version    1.0.0
 * @link       http://phpaspect.org
 *******************************************************************************/

//namespace PHPAspect::Weaver;

require_once 'PHPAspect/Weaver/Weaver.php';
require_once 'PHPAspect/Weaver/PHPAspectWeavingPreferences.php';
require_once 'PHPAspect/Weaver/XSLTWeaver.php';
require_once 'PHPAspect/Weaver/MalformedURLException.php';

$prefix = (PHP_SHLIB_SUFFIX === 'dll') ? 'php_' : '';
if(!extension_loaded('parse_tree') && !dl($prefix . 'parse_tree.' . PHP_SHLIB_SUFFIX)){
	throw new Exception("phpAspect has dependency with the Parse_Tree Pecl extension\npecl install -f Parse_Tree");
}

class PHPAspectWeaver extends XSLTWeaver implements Weaver{
    
    private $aspectURLs  = array();
    private $phpFileURLs = array();
    private $weavingPreferences;

    const PHPASPECT_CONTENTTYPE = 'ap';
    const PHP_CONTENTTYPE       = 'php, php3, php4, php5, phtml, inc';

    public function __construct(WeavingPreferences $options=null, $aspectURLs=null, $phpFileURLs=null){
        if($options){
            $this->weavingPreferences = $options;    
        }else{
        	$this->weavingPreferences = new WeavingPreferences();
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
        }elseif(is_array($phpFileURLs)){
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
        	if($fileName == '.' || $fileName == '..'){
        		continue;
        	}
        	
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
            throw new MalformedURLException($fileURL);
        }
        $contentType = pathinfo($fileURL, PATHINFO_EXTENSION);
        return eregi($contentType, self::PHP_CONTENTTYPE);
    }
    
    public function addPHPFiles($directory, $recursive=true){
        if(!is_dir($directory)){
            throw new MalformedURLException($directory, DIRECTORY_URL);
        }
        
        $files = scandir($directory);
        foreach($files as $fileName){
        	if($fileName == '.' || $fileName == '..'){
        		continue;
        	}
        	
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
            if($aspectName == pathinfo($url, PATHINFO_FILENAME)){
                return $this->aspectURLs[$key];
            }
        }
        return false;        
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
            if($aspectName == pathinfo($url, PATHINFO_FILENAME)){
                unset($this->aspectURLs[$key]);
            }
        }
    }
    
    public function getPHPFileURLs(){
        return $this->fileURLs;
    }
    
    public function getPHPFileURL($fileName){
        foreach($this->fileURLs as $key => $url){
            if($fileName == pathinfo($url, PATHINFO_FILENAME)){
                return $this->fileURLs[$key];
            }
        }
        return false;
    }
    
    public function setPHPFileURLs(array $fileURLs){
        foreach($fileURLs as $url){
            $this->addPHPFileURL($url);
        }
    }
    
    public function addPHPFileURL($phpFileURL){
        if($this->isPHPFileURL($phpFileURL)){
            $this->phpFileURLs[] = $phpFileURL;
        }
    }
    
    public function removePHPFileUrl($fileName){
        foreach($this->phpFileURLs as $key => $url){
            if($fileName == pathinfo($url, PATHINFO_FILENAME)){
                unset($this->phpFileURLs[$key]);
            }
        }
    }
    
    public function getWeavingPreferences(){
        $this->weavingPreferences;
    }
    
    public function setWeavingPreferences(WeavingPreferences $options){
        $this->options = $options;
    }
    
    public function resetWeavingPreferences(){
        $this->options->setDefaults();
    }
    
    public function reset(){
        $this->aspectURLs = array();
        $this->fileURLs   = array();
        $this->resetWeavingPreferences();
    }

    
    public function weave(){
        $rtIncludePath =  $this->weavingPreferences->getRuntimeIncludePath();
        mkdir($rtIncludePath);
        $this->generateAspectRuntimeEntities($rtIncludePath);
    }
    
    public function weaveFile($fileURL){}
    public function weaveFileIn($fileURL, $destinationURL){}
    
    public function weaveString($string){
    
    }
    public function weaveStringIn($string, $destinationURL){}
    
    private function generateAspectRuntimeEntities($destination){
    	foreach ($this->aspectURLs as $aspectURL){
	        $target    = $destination.DIRECTORY_SEPARATOR.$this->getFileName($aspectURL).'.php';
	        $aspectXML = parse_tree_from_file($aspectURL);
	        self::processFileIn($aspectXML, self::XSLT_TOCLASS, $target);
    	}
    }
    
    private function getFileName($url){
        return pathinfo($url, PATHINFO_FILENAME);
    }
    
    private function debug($message){
    	if($this->options->getVerbose){
    		print($message);	
    	}
    }
    
    private function processFileIn($file, $xsl, $target){
    	$beautifier = $this->weavingPreferences->getBeautifier();
    	$input = parent::process($file, $xsl);
    	$beautifier->setInputString($input->saveXML());
    	$beautifier->setOutputFile($target);
    	$beautifier->process();
    }
    
    private function processFile($file, $xsl){
        $beautifier = $this->weavingPreferences->getBeautifier();
        $input = parent::process($file, $xsl);
    	$beautifier->setInputString($input->saveXML());
    	$beautifier->setOutputFile($file);
    	$beautifier->process();
    }
}
?>