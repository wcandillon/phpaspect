<?php
require_once 'PHPUnit/Framework.php';
require_once 'PHPUnit/Extensions/OutputTestCase.php';
ob_start();
require_once '../samples/checkout/bin/checkout.php';
ob_end_clean();

CheckoutTest::$order = $myOrder;

class CheckoutTest extends PHPUnit_Framework_TestCase{

  public static $order;

  public function testCheckout(){
    $this->equalTo(-20.32, self::$order->getAmount());
  }
}
?> 
