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
        $__return_result = $this->__phpaspectfoo();
        return $__return_result;
    }
    public function __phpaspectfoo() {
        echo "I'm a foo\n";
    }
}
?> 
<?php
?>