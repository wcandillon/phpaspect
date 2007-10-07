<?php
class PHPAspectWeaverTestCase extends TestCase{
    
    public function setUp(){
        //TODO: check the path of the Project directory     
    }
    
    public function testEmptyConstructor(){
        
    }
    
    public function testConstructorWithOptions(){
        
    }
    
    public function testConstructorWithAspectURLs(){
        
    }
    
    public function testConstructorWithAspectURL(){
        
    }
    
    public function testConstructorWithAspectSourceDirectory(){
        
    }
    
    public function testConstructorWithInvalidAspectParameter(){
        
    }
    
    public function testConstructorWithPHPFileURLs(){
        
    }
    
    public function testConstructorWithPHPFileURL(){
        
    }
    
    public function testConstructorWithPHPSourceDirectory(){
        
    }
    
    public function testConstructorWithInvalidPHPParameter(){
        
    }
    
    public function testAddAspectsWithRecursivity(){
        
    }
    
    public function testAddAspectsWithoutRecursivity(){
        
    }
    
    public function testAddPHPFilesWithRecursivity(){
        
    }
    
    public function testAddPHPFilesWithoutRecursivity(){
        
    }

    public function testGetAspectURL(){
        
    }
    
    public function testSetAspectURL(){
        
    }
    
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