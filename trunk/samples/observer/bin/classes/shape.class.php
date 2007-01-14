<?php
$__current_dir = dirname(__FILE__);if(!function_exists('isType')){ require_once '../_phpaspect/functions.php';
require_once '../_phpaspect/joinpoint.class.php';
require_once '../_phpaspect/newjoinpoint.class.php';
require_once '../_phpaspect/calljoinpoint.class.php';
require_once '../_phpaspect/execjoinpoint.class.php';
require_once '../_phpaspect/aspect.interface.php';}
require_once $__current_dir.'/../_phpaspect/observer.class.php';

?><?php
abstract class Shape {
    abstract public function moveBy($dx, $dy);
}
?>