<?php
if(!class_exists('Aspect_context')){ class Aspect_context implements Aspect{private static $instance = null;private function __construct(){/* empty */}public static function getInstance(){if(self::$instance === null){self::$instance = new
                 Aspect_context();}return self::$instance;}public function __call($m, $a){}public function __clone(){trigger_error('Clone is not allowed.', E_USER_ERROR);}
                }}if(!isset($GLOBALS['__phpaspect']['context'])){$GLOBALS['__phpaspect']['context'] = Aspect_context::getInstance();}
?> 
<?php

?>