<?php
if(!defined('PHPUnit_MAIN_METHOD')){
    define('PHPUnit_MAIN_METHOD', 'AllTests::main');
}
require_once 'PHPUnit/Framework.php';
require_once 'PHPUnit/TextUI/TestRunner.php';

require_once 'SingletonTest.php';
require_once 'CheckoutTest.php';
require_once 'BookTest.php';
require_once 'ObserverTest.php';

class AllTests{

  public static function main(){
    PHPUnit_TextUI_TestRunner::run(self::suite());
  }

  public static function suite(){
    $suite = new PHPUnit_Framework_TestSuite('SingletonTest');
    $suite->addTest(new PHPUnit_Framework_TestSuite('CheckoutTest'));
    $suite->addTest(new PHPUnit_Framework_TestSuite('BookTest'));
    $suite->addTest(new PHPUnit_Framework_TestSuite('ObserverTest'));
    return $suite;
  }
}

if(PHPUnit_MAIN_METHOD == 'AllTests::main'){
  AllTests::main();
}
?>
