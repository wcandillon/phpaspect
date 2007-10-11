<?php

require_once 'PHPAspect/Frontends/Cli/Console.php';
require_once 'PHPAspect/Weaver/PHPAspectWeaver.php';
require_once 'PHPAspect/Utils/FileSystem.php';
      
try{
	//Change to the cli current directory
	chdir($_ENV['PWD']);
	
    $console = new Console();

    /* Parse command-line options */
    $console->setOptions();

    /* Copying the source directory to the targeted one */
    FileSystem::copyr($console->getSource(), $console->getTarget(),
    							PHPAspectWeaver::PHPASPECT_CONTENTTYPE);
    
    /* Launch the weaving */
    $weaver = new PHPAspectWeaver($console->getWeavingPreferences(),
    								$console->getAspectSource(),
    								$console->getTarget());
    
    if($console->getCode()){
    	throw new Exception("Not implemented yet");
    }else{
		$weaver->weave();
    }
}catch(Exception $e){
    echo $e->getMessage()."\n";
}
?>