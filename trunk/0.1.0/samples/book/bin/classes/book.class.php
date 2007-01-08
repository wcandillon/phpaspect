<?php
$__current_dir = dirname(__FILE__);if(!function_exists('isType')){ require_once '../_phpaspect/functions.php';
require_once '../_phpaspect/joinpoint.class.php';
require_once '../_phpaspect/newjoinpoint.class.php';
require_once '../_phpaspect/calljoinpoint.class.php';
require_once '../_phpaspect/execjoinpoint.class.php';
require_once '../_phpaspect/aspect.interface.php';}
require_once $__current_dir.'/../_phpaspect/trace.class.php';

?><?php
class Book {
    private $title;
    private $isbn;
    private $publisher;
    private $author;
    public function save() {
        $__return_result = $this->__phpaspectsave();
        return $__return_result;
    }
    public function __phpaspectsave() {
        $phpaspect_86 = &$this;
        $phpaspect_99 = &$phpaspect_86->db;
        if (!$phpaspect_99) {
            $phpaspect_130 = new BookException("Connection to the db failed\n");
            throw $phpaspect_130;
        }
    }
    public function getTitle() {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'getTitle');
        if (!function_exists('__phpaspect6a0185b2f70dce5910b103e18c62d6f7')) {
            function __phpaspect6a0185b2f70dce5910b103e18c62d6f7($thisJoinPoint) {
                echo "Before an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect6a0185b2f70dce5910b103e18c62d6f7($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectgetTitle();
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'getTitle');
        if (!function_exists('__phpaspect9e8360fc3330c4f152f4d6885d48a424')) {
            function __phpaspect9e8360fc3330c4f152f4d6885d48a424($thisJoinPoint) {
                echo "After an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect9e8360fc3330c4f152f4d6885d48a424($thisJoinPoint);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectgetTitle() {
        $phpaspect_175 = &$this;
        $phpaspect_188 = &$phpaspect_175->title;
        return $phpaspect_188;
    }
    public function getIsbn() {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'getIsbn');
        if (!function_exists('__phpaspect1019e84810ed17afc92f1c9782c1eb0f')) {
            function __phpaspect1019e84810ed17afc92f1c9782c1eb0f($thisJoinPoint) {
                echo "Before an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect1019e84810ed17afc92f1c9782c1eb0f($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectgetIsbn();
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'getIsbn');
        if (!function_exists('__phpaspect62fd975747c889a9e66cb5bd9dd5afa0')) {
            function __phpaspect62fd975747c889a9e66cb5bd9dd5afa0($thisJoinPoint) {
                echo "After an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect62fd975747c889a9e66cb5bd9dd5afa0($thisJoinPoint);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectgetIsbn() {
        $phpaspect_221 = &$this;
        $phpaspect_234 = &$phpaspect_221->isbn;
        return $phpaspect_234;
    }
    public function getPublisher() {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'getPublisher');
        if (!function_exists('__phpaspecta2354d6da8b6285ae5b9f59618bc1e8c')) {
            function __phpaspecta2354d6da8b6285ae5b9f59618bc1e8c($thisJoinPoint) {
                echo "Before an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspecta2354d6da8b6285ae5b9f59618bc1e8c($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectgetPublisher();
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'getPublisher');
        if (!function_exists('__phpaspect6a7cecf16f3099fae90b8dda53c31477')) {
            function __phpaspect6a7cecf16f3099fae90b8dda53c31477($thisJoinPoint) {
                echo "After an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect6a7cecf16f3099fae90b8dda53c31477($thisJoinPoint);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectgetPublisher() {
        $phpaspect_267 = &$this;
        $phpaspect_280 = &$phpaspect_267->publisher;
        return $phpaspect_280;
    }
    public function getAuthor() {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'getAuthor');
        if (!function_exists('__phpaspect67efb44c5b462fa4f1e7a43064be1c46')) {
            function __phpaspect67efb44c5b462fa4f1e7a43064be1c46($thisJoinPoint) {
                echo "Before an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect67efb44c5b462fa4f1e7a43064be1c46($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectgetAuthor();
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(), $this, 'getAuthor');
        if (!function_exists('__phpaspect4bd898a9c94e5d7de6cb81516b4eb3e6')) {
            function __phpaspect4bd898a9c94e5d7de6cb81516b4eb3e6($thisJoinPoint) {
                echo "After an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect4bd898a9c94e5d7de6cb81516b4eb3e6($thisJoinPoint);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectgetAuthor() {
        $phpaspect_313 = &$this;
        $phpaspect_326 = &$phpaspect_313->author;
        return $phpaspect_326;
    }
    public function setTitle($title) {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($title,), $this, 'setTitle');
        if (!function_exists('__phpaspect74196cbaea82ba53186eee217b058cc2')) {
            function __phpaspect74196cbaea82ba53186eee217b058cc2($thisJoinPoint) {
                echo "Before an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect74196cbaea82ba53186eee217b058cc2($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectsetTitle($title);
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($title,), $this, 'setTitle');
        if (!function_exists('__phpaspect655f563cb8201067e438602b1c270cd8')) {
            function __phpaspect655f563cb8201067e438602b1c270cd8($thisJoinPoint) {
                echo "After an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect655f563cb8201067e438602b1c270cd8($thisJoinPoint);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectsetTitle($title) {
        $phpaspect_363 = &$this;
        $phpaspect_376 = &$phpaspect_363->title;
        $phpaspect_383 = &$title;
        $phpaspect_376 = $phpaspect_383;
    }
    public function setIsbn($isbn) {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($isbn,), $this, 'setIsbn');
        if (!function_exists('__phpaspect1368c0234a706281af4de213631a0c76')) {
            function __phpaspect1368c0234a706281af4de213631a0c76($thisJoinPoint) {
                echo "Before an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect1368c0234a706281af4de213631a0c76($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectsetIsbn($isbn);
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($isbn,), $this, 'setIsbn');
        if (!function_exists('__phpaspectbf786d7286c941e415caefceedd8ba6e')) {
            function __phpaspectbf786d7286c941e415caefceedd8ba6e($thisJoinPoint) {
                echo "After an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspectbf786d7286c941e415caefceedd8ba6e($thisJoinPoint);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectsetIsbn($isbn) {
        $phpaspect_428 = &$this;
        $phpaspect_441 = &$phpaspect_428->isbn;
        $phpaspect_448 = &$isbn;
        $phpaspect_441 = $phpaspect_448;
    }
    public function setPublisher($publisher) {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($publisher,), $this, 'setPublisher');
        if (!function_exists('__phpaspect3717501db6c1fe5ec8b380580be2f1c1')) {
            function __phpaspect3717501db6c1fe5ec8b380580be2f1c1($thisJoinPoint) {
                echo "Before an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect3717501db6c1fe5ec8b380580be2f1c1($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectsetPublisher($publisher);
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($publisher,), $this, 'setPublisher');
        if (!function_exists('__phpaspect30fba56a256be43b1f1e266b562c1dac')) {
            function __phpaspect30fba56a256be43b1f1e266b562c1dac($thisJoinPoint) {
                echo "After an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect30fba56a256be43b1f1e266b562c1dac($thisJoinPoint);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectsetPublisher($publisher) {
        $phpaspect_493 = &$this;
        $phpaspect_506 = &$phpaspect_493->publisher;
        $phpaspect_513 = &$publisher;
        $phpaspect_506 = $phpaspect_513;
    }
    public function setAuthor($author) {
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($author,), $this, 'setAuthor');
        if (!function_exists('__phpaspect98c9b65cb3597e7be13bbef687c4a19e')) {
            function __phpaspect98c9b65cb3597e7be13bbef687c4a19e($thisJoinPoint) {
                echo "Before an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect98c9b65cb3597e7be13bbef687c4a19e($thisJoinPoint);
        unset($thisJoinPoint);
        $__return_result = $this->__phpaspectsetAuthor($author);
        $thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array($author,), $this, 'setAuthor');
        if (!function_exists('__phpaspect90ef78348389318f501c0a767d09c31e')) {
            function __phpaspect90ef78348389318f501c0a767d09c31e($thisJoinPoint) {
                echo "After an execution of a ".$thisJoinPoint->getMethodName() ."\n";
            }
        }
        __phpaspect90ef78348389318f501c0a767d09c31e($thisJoinPoint);
        unset($thisJoinPoint);
        return $__return_result;
    }
    public function __phpaspectsetAuthor($author) {
        $phpaspect_558 = &$this;
        $phpaspect_571 = &$phpaspect_558->author;
        $phpaspect_578 = &$author;
        $phpaspect_571 = $phpaspect_578;
    }
}
class BookException extends Exception {
}
?>