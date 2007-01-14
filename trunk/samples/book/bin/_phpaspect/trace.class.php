<?php
if(!class_exists('Aspect_Trace')){ class Aspect_Trace implements Aspect{private static $instance = null;private function __construct(){/* empty */}public static function getInstance(){if(self::$instance === null){self::$instance = new
                 Aspect_Trace();}return self::$instance;}public function __call($m, $a){}public function __clone(){trigger_error('Clone is not allowed.', E_USER_ERROR);}
                }}if(!isset($GLOBALS['__phpaspect']['Trace'])){$GLOBALS['__phpaspect']['Trace'] = Aspect_Trace::getInstance();}
?> 
<?php

?>