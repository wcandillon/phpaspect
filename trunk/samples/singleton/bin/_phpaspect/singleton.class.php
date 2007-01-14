<?php
if(!class_exists('Aspect_Singleton')){ class Aspect_Singleton implements Aspect{private static $instance = null;private function __construct(){/* empty */}public static function getInstance(){if(self::$instance === null){self::$instance = new
                 Aspect_Singleton();}return self::$instance;}public function __call($m, $a){}public function __clone(){trigger_error('Clone is not allowed.', E_USER_ERROR);}
                



public






$instances
=

array
(


)


;
}}if(!isset($GLOBALS['__phpaspect']['Singleton'])){$GLOBALS['__phpaspect']['Singleton'] = Aspect_Singleton::getInstance();}
?>