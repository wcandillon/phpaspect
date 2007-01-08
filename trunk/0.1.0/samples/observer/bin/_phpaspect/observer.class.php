<?php
if(!class_exists('Aspect_Observer')){ class Aspect_Observer implements Aspect{private static $instance = null;private function __construct(){/* empty */}public static function getInstance(){if(self::$instance === null){self::$instance = new
                 Aspect_Observer();}return self::$instance;}public function __call($m, $a){}public function __clone(){trigger_error('Clone is not allowed.', E_USER_ERROR);}
                



public



function


displayPoint
(



Point

$p


)

{













printf
(









"New Point: %d, %d\n"




,





$p




->





getX






(




)





,





$p




->





getY






(




)






)





;




}





public



function


displayLine
(



Line

$l


)

{













printf
(











"New Line: (%d, %d) (%d, %d)\n"




,





$l




->





getP1






(




)





->



getX






(




)





,





$l




->





getP1






(




)





->



getY






(




)





,





$l




->





getP2






(




)





->



getX






(




)





,





$l




->





getP2






(




)





->



getY






(




)






)





;




}

}}if(!isset($GLOBALS['__phpaspect']['Observer'])){$GLOBALS['__phpaspect']['Observer'] = Aspect_Observer::getInstance();}
?>