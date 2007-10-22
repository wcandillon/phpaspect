<?php
interface WeavingPreferences{
    public function getBeautifier();
    
    public function getVerbose();
    
    public function setBeautifier(PHP_Beautifier_Interface $beautifier);
    
    public function setVerbose($verbose);
    
    public function setDefaults();
    
    public function getRuntimeIncludePath();
    
    public function setRuntimeIncludePath($runtimeIncludePath);
}
?>
