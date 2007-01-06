<?php
$__current_dir = dirname(__FILE__);if(!function_exists('isType')){ require_once '_phpaspect/functions.php';
require_once '_phpaspect/joinpoint.class.php';
require_once '_phpaspect/newjoinpoint.class.php';
require_once '_phpaspect/calljoinpoint.class.php';
require_once '_phpaspect/execjoinpoint.class.php';
require_once '_phpaspect/aspect.interface.php';}
require_once $__current_dir.'/_phpaspect/singleton.class.php';

?><?php
class Foo {
    public function __clone() {
        throw new Exception('Clone of '.get_class($this) .' is not  allowed.', E_USER_ERROR);
    }
    public function showInstance() {
        $__return_result = $this->__phpaspectshowInstance();
        return $__return_result;
    }
    public function __phpaspectshowInstance() {
        $phpaspect_38 = &$this;
        $phpaspect_47 = &var_dump($phpaspect_38);
        $phpaspect_47;
    }
}
class Bar {
    public function __clone() {
        throw new Exception('Clone of '.get_class($this) .' is not  allowed.', E_USER_ERROR);
    }
    private $state;
    public function __construct($state = false) {
        $__return_result = $this->__phpaspect__construct($state);
        return $__return_result;
    }
    public function __phpaspect__construct($state = false) {
        $phpaspect_121 = &$this;
        $phpaspect_134 = &$phpaspect_121->state;
        $phpaspect_141 = &$state;
        $phpaspect_134 = $phpaspect_141;
    }
    public function showInstance() {
        $__return_result = $this->__phpaspectshowInstance();
        return $__return_result;
    }
    public function __phpaspectshowInstance() {
        $phpaspect_184 = &$this;
        $phpaspect_193 = &var_dump($phpaspect_184);
        $phpaspect_193;
    }
}
if (true || true) {
    $thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(), "Foo");
    $className = $thisJoinPoint->getClassName();
    if (!isset($GLOBALS['__phpaspect']['Singleton']->instances[$className])) {
        $GLOBALS['__phpaspect']['Singleton']->instances[$className] = new Foo();
    }
    $__return_result = $GLOBALS['__phpaspect']['Singleton']->instances[$className];
    unset($thisJoinPoint);
} else {
    $phpaspect_234 = new Foo();
    $__return_result = $phpaspect_234;
}
$phpaspect_234 = $__return_result;
$phpaspect_220 = &$a;
$phpaspect_220 = $phpaspect_234;
$phpaspect_251 = &$a;
$phpaspect_268 = &$phpaspect_251->showInstance();
$phpaspect_268;
if (true || true) {
    $thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(), "Foo");
    $className = $thisJoinPoint->getClassName();
    if (!isset($GLOBALS['__phpaspect']['Singleton']->instances[$className])) {
        $GLOBALS['__phpaspect']['Singleton']->instances[$className] = new Foo();
    }
    $__return_result = $GLOBALS['__phpaspect']['Singleton']->instances[$className];
    unset($thisJoinPoint);
} else {
    $phpaspect_298 = new Foo();
    $__return_result = $phpaspect_298;
}
$phpaspect_298 = $__return_result;
$phpaspect_284 = &$b;
$phpaspect_284 = $phpaspect_298;
$phpaspect_315 = &$b;
$phpaspect_332 = &$phpaspect_315->showInstance();
$phpaspect_332;
$phpaspect_348 = &$bar;
$phpaspect_348 = 'Bar';
if (isNewType('Foo', $bar, false) || isNewType('Bar', $bar, false)) {
    $thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(true), "$bar");
    $className = $thisJoinPoint->getClassName();
    if (!isset($GLOBALS['__phpaspect']['Singleton']->instances[$className])) {
        $GLOBALS['__phpaspect']['Singleton']->instances[$className] = new $bar(true);
    }
    $__return_result = $GLOBALS['__phpaspect']['Singleton']->instances[$className];
    unset($thisJoinPoint);
} else {
    $phpaspect_397 = new $bar(true);
    $__return_result = $phpaspect_397;
}
$phpaspect_397 = $__return_result;
$phpaspect_372 = &$c;
$phpaspect_372 = $phpaspect_397;
$phpaspect_414 = &$c;
$phpaspect_431 = &$phpaspect_414->showInstance();
$phpaspect_431;
if (true || true) {
    $thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(false), "Bar");
    $className = $thisJoinPoint->getClassName();
    if (!isset($GLOBALS['__phpaspect']['Singleton']->instances[$className])) {
        $GLOBALS['__phpaspect']['Singleton']->instances[$className] = new Bar(false);
    }
    $__return_result = $GLOBALS['__phpaspect']['Singleton']->instances[$className];
    unset($thisJoinPoint);
} else {
    $phpaspect_467 = new Bar(false);
    $__return_result = $phpaspect_467;
}
$phpaspect_467 = $__return_result;
$phpaspect_447 = &$d;
$phpaspect_447 = $phpaspect_467;
$phpaspect_484 = &$d;
$phpaspect_501 = &$phpaspect_484->showInstance();
$phpaspect_501;
?>