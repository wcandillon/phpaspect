<?php
require_once 'PHPUnit/Framework.php';
require_once 'PHPUnit/Extensions/ExceptionTestCase.php';
ob_start();
require_once '../samples/singleton/bin/singleton.php';
ob_end_clean();

SingletonTest::$a = $a;
SingletonTest::$b = $b;
SingletonTest::$c = $c;
SingletonTest::$d = $d;

class SingletonTest extends PHPUnit_Framework_TestCase{

  public static $a;
  public static $b;
  public static $c;
  public static $d;

  public function testIsFooInstance(){
    $this->assertEquals('Foo', get_class(self::$a));
  }

  public function testIsBarInstance(){
    $this->assertEquals('Bar', get_class(self::$c));
  }

  public function testFooSingleton(){
    $this->assertSame(self::$a, self::$b);
  }

  public function testBarSingleton(){
    $this->assertSame(self::$c, self::$d);
  }

  public function testFooCloning(){
    try{
      $foo = new Foo();
      $clone = clone $foo;
    }catch(Exception $e){
      return;
    }
    $this->fail('A cloning of Foo has been authorized!');
  }

  public function testBarCloning(){
    try{
      $bar = new Bar();
      $clone = clone $bar;
    }catch(Exception $e){
      return;
    }
    $this->fail('A cloning of Bar has been authorized!');
  }
}
?>
