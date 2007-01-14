<?php
$__current_dir = dirname(__FILE__);if(!function_exists('isType')){ require_once '../_phpaspect/functions.php';
require_once '../_phpaspect/joinpoint.class.php';
require_once '../_phpaspect/newjoinpoint.class.php';
require_once '../_phpaspect/calljoinpoint.class.php';
require_once '../_phpaspect/execjoinpoint.class.php';
require_once '../_phpaspect/aspect.interface.php';}
require_once $__current_dir.'/../_phpaspect/observer.class.php';

?><?php
class Line extends Shape {
    private $p1, $p2;
    public function getP1() {
        $__return_result = $this->__phpaspectgetP1();
        return $__return_result;
    }
    public function __phpaspectgetP1() {
        $phpaspect_54 = &$this;
        $phpaspect_67 = &$phpaspect_54->p1;
        return $phpaspect_67;
    }
    public function getP2() {
        $__return_result = $this->__phpaspectgetP2();
        return $__return_result;
    }
    public function __phpaspectgetP2() {
        $phpaspect_100 = &$this;
        $phpaspect_113 = &$phpaspect_100->p2;
        return $phpaspect_113;
    }
    public function moveBy($dx, $dy) {
        $__return_result = $this->__phpaspectmoveBy($dx, $dy);
        return $__return_result;
    }
    public function __phpaspectmoveBy($dx, $dy) {
        $phpaspect_172 = &$dx;
        $phpaspect_183 = &$dy;
        $phpaspect_156 = &$p1;
        $phpaspect_194 = &$phpaspect_156->moveBy($phpaspect_172, $phpaspect_183);
        $phpaspect_194;
        $phpaspect_226 = &$x;
        $phpaspect_237 = &$dy;
        $phpaspect_210 = &$p2;
        $phpaspect_248 = &$phpaspect_210->moveBy($phpaspect_226, $phpaspect_237);
        $phpaspect_248;
    }
    public function setP1(Point $p1) {
        $__return_result = $this->__phpaspectsetP1($p1);
        return $__return_result;
    }
    public function __phpaspectsetP1(Point $p1) {
        $phpaspect_288 = &$this;
        $phpaspect_301 = &$phpaspect_288->p1;
        $phpaspect_308 = &$p1;
        $phpaspect_301 = $phpaspect_308;
    }
    public function setP2(Point $p2) {
        $__return_result = $this->__phpaspectsetP2($p2);
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($p2,), $this, 'setP2');
        if (!function_exists('__phpaspect972de68a3fffd5b0c4601e3841ceaae7')) {
            function __phpaspect972de68a3fffd5b0c4601e3841ceaae7($thisJoinPoint, $this) {
                $GLOBALS['__phpaspect']['Observer']->displayLine($this);
            }
        }
        __phpaspect972de68a3fffd5b0c4601e3841ceaae7($thisJoinPoint, $this);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectsetP2(Point $p2) {
        $phpaspect_353 = &$this;
        $phpaspect_366 = &$phpaspect_353->p2;
        $phpaspect_373 = &$p2;
        $phpaspect_366 = $phpaspect_373;
    }
}
?> 
<?php
?>