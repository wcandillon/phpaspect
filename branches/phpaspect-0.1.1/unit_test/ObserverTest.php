<?php
require_once 'PHPUnit/Framework.php';
require_once 'PHPUnit/Extensions/OutputTestCase.php';
ob_start();
require_once '../samples/observer/bin/observer.php';
ob_end_clean();

ObserverTest::$l1 = $l1;
ObserverTest::$l2 = $l2;
ObserverTest::$l3 = $l3;

class ObserverTest extends PHPUnit_Framework_TestCase{

  public static $l1;
  public static $l2;
  public static $l3;

  public function testL1(){
    $this->assertEquals(self::$l1, self::getL1());
  }

  public function testL2(){
    $this->assertEquals(self::$l2, self::getL2());
  }

  public function testL3(){
    $this->assertEquals(self::$l3, self::getL3());
  }

  public function getP1(){
    $p1 = new Point();
    $p1->setX(0);
    $p1->setY(0);
    return $p1;
  }

  public function getP2(){
    $p2 = new Point();
    $p2->setX(100);
    $p2->setY(0);
    return $p2;
  }

  public function getP3(){
    $p3 = new Point();
    $p3->setX(50);
    $p3->setY(100);
    return $p3;
  }

  public function getL1(){
    $l1 = new Line();
    $l1->setP1(self::getP1());
    $l1->setP2(self::getP2());
    return $l1;
  }

  public function getL2(){
    $l2 = new Line();
    $l2->setP1(self::getP1());
    $l2->setP2(self::getP3());
    return $l2;
  }

  public function getL3(){
    $l3 = new Line();
    $l3->setP1(self::getP2());
    $l3->setP2(self::getP3());
    return $l3;
  }
}
?>