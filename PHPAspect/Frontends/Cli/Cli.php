<?php
require_once 'PHPAspect/Frontends/Cli/Console.php';
require_once 'PHPAspect/Weaver/PHPAspectWeaver.php';

try{
    $console = new Console();
    /* Parse command-line options */
    //$console->setOptions();

    /* Launch the weaving */
    $weaver = new PHPAspectWeaver($console->getWeavingPreferences(), $console->getAspectSource());
    print_r($weaver);
    if($console->getCode()){
    
    }else{
    
    }
}catch(Exception $e){
    echo $e->getMessage()."\n";
}
?>