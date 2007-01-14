<?php
$__current_dir = dirname(__FILE__);if(!function_exists('isType')){ require_once '../_phpaspect/functions.php';
require_once '../_phpaspect/joinpoint.class.php';
require_once '../_phpaspect/newjoinpoint.class.php';
require_once '../_phpaspect/calljoinpoint.class.php';
require_once '../_phpaspect/execjoinpoint.class.php';
require_once '../_phpaspect/aspect.interface.php';}
require_once $__current_dir.'/../_phpaspect/observer.class.php';

?><?php
class Point extends Shape {
    private $x = 0;
    private $y = 0;
    public function getX() {
        $__return_result = $this->__phpaspectgetX();
        return $__return_result;
    }
    public function __phpaspectgetX() {
        $phpaspect_68 = &$this;
        $phpaspect_81 = &$phpaspect_68->x;
        return $phpaspect_81;
    }
    public function getY() {
        $__return_result = $this->__phpaspectgetY();
        return $__return_result;
    }
    public function __phpaspectgetY() {
        $phpaspect_114 = &$this;
        $phpaspect_127 = &$phpaspect_114->y;
        return $phpaspect_127;
    }
    public function moveBy($dx, $dy) {
        $__return_result = $this->__phpaspectmoveBy($dx, $dy);
        return $__return_result;
    }
    public function __phpaspectmoveBy($dx, $dy) {
        $phpaspect_170 = &$this;
        $phpaspect_183 = &$phpaspect_170->x;
        $phpaspect_190 = &$dx;
        $phpaspect_183+= $phpaspect_190;
        $phpaspect_211 = &$this;
        $phpaspect_224 = &$phpaspect_211->y;
        $phpaspect_231 = &$dy;
        $phpaspect_224+= $phpaspect_231;
    }
    public function setX($x) {
        $__return_result = $this->__phpaspectsetX($x);
        return $__return_result;
    }
    public function __phpaspectsetX($x) {
        $phpaspect_276 = &$this;
        $phpaspect_289 = &$phpaspect_276->x;
        $phpaspect_296 = &$x;
        $phpaspect_289 = $phpaspect_296;
    }
    public function setY($y) {
        $__return_result = $this->__phpaspectsetY($y);
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($y,), $this, 'setY');
        if (!function_exists('__phpaspecte8c002b4ee8dfaa853dc222242770fbf')) {
            function __phpaspecte8c002b4ee8dfaa853dc222242770fbf($thisJoinPoint, $this) {
                $GLOBALS['__phpaspect']['Observer']->displayPoint($this);
            }
        }
        __phpaspecte8c002b4ee8dfaa853dc222242770fbf($thisJoinPoint, $this);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectsetY($y) {
        $phpaspect_341 = &$this;
        $phpaspect_354 = &$phpaspect_341->y;
        $phpaspect_361 = &$y;
        $phpaspect_354 = $phpaspect_361;
    }
}
?>