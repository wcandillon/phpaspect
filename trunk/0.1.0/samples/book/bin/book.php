<?php
$__current_dir = dirname(__FILE__);if(!function_exists('isType')){ require_once '_phpaspect/functions.php';
require_once '_phpaspect/joinpoint.class.php';
require_once '_phpaspect/newjoinpoint.class.php';
require_once '_phpaspect/calljoinpoint.class.php';
require_once '_phpaspect/execjoinpoint.class.php';
require_once '_phpaspect/aspect.interface.php';}
require_once $__current_dir.'/_phpaspect/trace.class.php';

?><?php
require_once 'classes/book.class.php';
try {
    if (true) {
        $thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(), "Book");
        function __phpaspectbfc9865845e5f47cee060c49d199ed0d($thisJoinPoint) {
            echo "Before a construction of Book\n";
            unset($thisJoinPoint);
        }
        __phpaspectbfc9865845e5f47cee060c49d199ed0d($thisJoinPoint);
    }
    if (true) {
        $thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(), "Book");
        echo "Around a construction of a Book\n";
        $__return_result = new Book();
        unset($thisJoinPoint);
    } else {
        $phpaspect_45 = new Book();
        $__return_result = $phpaspect_45;
    }
    $phpaspect_45 = $__return_result;
    if (true) {
        $thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(), $phpaspect_45);
        function __phpaspect7acb9b59cbd8e6904b4aa274a6f1dc79($thisJoinPoint) {
            echo "Before a construction of Book\n";
            unset($thisJoinPoint);
        }
        __phpaspect7acb9b59cbd8e6904b4aa274a6f1dc79($thisJoinPoint);
    }
    $phpaspect_31 = &$book;
    $phpaspect_31 = $phpaspect_45;
    $phpaspect_62 = &$book;
    $phpaspect_85 = &$phpaspect_62->setTitle('Les colories');
    $phpaspect_85;
    $phpaspect_101 = &$book;
    $phpaspect_124 = &$phpaspect_101->setAuthor('Alexandre Jardin');
    $phpaspect_124;
    $phpaspect_140 = &$book;
    $phpaspect_163 = &$phpaspect_140->setIsbn('2070308057');
    $phpaspect_163;
    $phpaspect_179 = &$book;
    $phpaspect_202 = &$phpaspect_179->setPublisher('Editions Gallimard');
    $phpaspect_202;
    $phpaspect_218 = &$book;
    if (isCallType($phpaspect_218, '*', 'save', 'save')) {
        $thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(), $phpaspect_218, 'save');
        function __phpaspectab0b3f96af656ba2c3aaff9d42892b72($thisJoinPoint) {
            echo "Before a save()\n";
            unset($thisJoinPoint);
        }
        __phpaspectab0b3f96af656ba2c3aaff9d42892b72($thisJoinPoint);
    }
    if (isCallType($phpaspect_218, '*', 'save', 'save')) {
        $thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(), $phpaspect_218, 'save');
        echo "Around a save()\n";
        $phpaspect_218->save();
        unset($thisJoinPoint);
    } else {
        $phpaspect_235 = &$phpaspect_218->save();
        $__return_result = $phpaspect_235;
    }
    $phpaspect_235 = $__return_result;
    if (isCallType($phpaspect_218, '*', 'save', 'save')) {
        $thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(), $phpaspect_218, 'save');
        function __phpaspect85e2d0b3cb0cf78cc4273f7d2345361a($thisJoinPoint) {
            echo "After a save()\n";
            unset($thisJoinPoint);
        }
        __phpaspect85e2d0b3cb0cf78cc4273f7d2345361a($thisJoinPoint);
    }
    $phpaspect_235;
    $phpaspect_253 = &$book;
    unset($phpaspect_253);
}
catch(BookException $e) {
    $phpaspect_284 = &$e;
    $phpaspect_301 = &$phpaspect_284->getMessage();
    echo $phpaspect_301;
}
?>