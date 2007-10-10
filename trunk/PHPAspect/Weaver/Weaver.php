<?php
interface Weaver{
    
    public function __construct(WeavingPreferences $options=null, $aspectURLs=null, $phpFileURLs=null);
    
    public function addAspects($directory, $recursive=true);
    
    public function addPHPFiles($directory, $recursive=true);

    public function getAspectURLs();
    
    public function getAspectURL($aspectName);
    
    public function setAspectURLs(array $aspectURLs);
    
    public function addAspectURL($aspectURL);
    
    public function removeAspectURL($aspectName);
    
    public function getPHPFileURLs();
    
    public function getPHPFileURL($filename);
    
    public function setPHPFileURLs(array $fileURLs);
    
    public function addPHPFileURL($phpFileURL);
    
    public function removePHPFileUrl($fileName);
    
    public function getWeavingOptions();
    
    public function setWeavingPreferences(WeavingPreferences $options);
    
    public function resetWeavingPreferences();
    
    public function reset();
    
    public function weave();
    
    public function weaveIn($destinationURL);
    
    public function weaveFile($fileURL);
    
    public function weaveFileIn($fileURL, $destinationURL);
    
    public function weaveString($string);
    
    public function weaveStringIn($string, $destinationURL);
}
?>