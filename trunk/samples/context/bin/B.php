<?php
$__current_dir = dirname(__FILE__);if(!function_exists('isType')){ require_once '_phpaspect/functions.php';
require_once '_phpaspect/joinpoint.class.php';
require_once '_phpaspect/newjoinpoint.class.php';
require_once '_phpaspect/calljoinpoint.class.php';
require_once '_phpaspect/execjoinpoint.class.php';
require_once '_phpaspect/aspect.interface.php';}
require_once $__current_dir.'/_phpaspect/context.class.php';

?><?php
class Foo {
    public function foo() {
        $__return_result = $this->__phpaspectfoo();
        return $__return_result;
    }
    public function __phpaspectfoo() {
        echo "I'm a foo\n";
    }
}
class Bar {
    public function foo() {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'foo');
        if (!function_exists('__phpaspectb9763ce4fd5d367f6d7dacc2786ef2e7')) {
            function __phpaspectb9763ce4fd5d367f6d7dacc2786ef2e7($thisJoinPoint) {
                echo "Before a foo within Bar in B.php file\n";
            }
        }
        __phpaspectb9763ce4fd5d367f6d7dacc2786ef2e7($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectfoo();
        return $__return_result;
    }
    public function __phpaspectfoo() {
        echo "I'm a foo\n";
    }
}
?>