<?php
if(!function_exists('isType')){ require_once '_phpaspect/functions.php';
require_once '_phpaspect/joinpoint.class.php';
require_once '_phpaspect/newjoinpoint.class.php';
require_once '_phpaspect/calljoinpoint.class.php';
require_once '_phpaspect/aspect.interface.php';
require_once '_phpaspect/logging.class.php';
}
?><?php
class Order {
    private $items = array();
    private $amount = 0;
    public function addItem($reference, $quantity) {
        $__return_result = $this->__phpaspectaddItem($reference, $quantity);
        printf("%d %s added to the cart\n", $quantity, $reference);
        return $__return_result;
    }
    public function __phpaspectaddItem($reference, $quantity) {
        $phpaspect_79 = &$this;
        $phpaspect_97 = &$phpaspect_79->items[];
        $phpaspect_106 = &$reference;
        $phpaspect_120 = &$quantity;
        $phpaspect_97 = array($phpaspect_106, $phpaspect_120);
        $phpaspect_149 = &$this;
        $phpaspect_162 = &$phpaspect_149->amount;
        $phpaspect_169 = &$quantity;
        $phpaspect_188 = &$reference;
        $phpaspect_197 = &Catalog::getPrice($phpaspect_188);
        $phpaspect_162+= $phpaspect_169*$phpaspect_197;
    }
    public function getAmount() {
        $__return_result = $this->__phpaspectgetAmount();
        return $__return_result;
    }
    public function __phpaspectgetAmount() {
        $phpaspect_241 = &$this;
        $phpaspect_254 = &$phpaspect_241->amount;
        return $phpaspect_254;
    }
}
class Catalog {
    private static $priceList = array('Largo Winch' => 9.31, 'Asterix' => 8.46, 'XIII' => 8.70);
    public static function getPrice($reference) {
        $__return_result = self::__phpaspectgetPrice($reference);
        return $__return_result;
    }
    public static function __phpaspectgetPrice($reference) {
        $phpaspect_368 = &$reference;
        $phpaspect_383 = &self::$priceList[$phpaspect_368];
        return $phpaspect_383;
    }
}
$phpaspect_421 = new Order();
$phpaspect_407 = &$myOrder;
$phpaspect_407 = $phpaspect_421;
$phpaspect_438 = &$myOrder;
$phpaspect_468 = &$phpaspect_438->addItem('Largo Winch', 2);
if (isCallType($phpaspect_438, 'Order', 'addItem', 'addItem')) {
    $thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array('Largo Winch', 2), $phpaspect_438, 'addItem');
    function __phpaspect01da3474c8c314d2c80f17151929df9a() {
        global $thisJoinPoint;
        printf("Total amount of the cart: %.2f euros\n", $thisJoinPoint->getTarget()->getAmount());
        unset($thisJoinPoint);
    }
    __phpaspect01da3474c8c314d2c80f17151929df9a();
}
$phpaspect_468;
$phpaspect_484 = &$myOrder;
$phpaspect_514 = &$phpaspect_484->addItem('Asterix', 2);
if (isCallType($phpaspect_484, 'Order', 'addItem', 'addItem')) {
    $thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array('Asterix', 2), $phpaspect_484, 'addItem');
    function __phpaspect798dcf5ef0555b6eda578880e159d031() {
        global $thisJoinPoint;
        printf("Total amount of the cart: %.2f euros\n", $thisJoinPoint->getTarget()->getAmount());
        unset($thisJoinPoint);
    }
    __phpaspect798dcf5ef0555b6eda578880e159d031();
}
$phpaspect_514;
$phpaspect_530 = &$myOrder;
$phpaspect_564 = &$phpaspect_530->addItem('Largo Winch', -6);
if (isCallType($phpaspect_530, 'Order', 'addItem', 'addItem')) {
    $thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array('Largo Winch', -6), $phpaspect_530, 'addItem');
    function __phpaspecte3aa34f6be6c50d8292afc54b4f644d5() {
        global $thisJoinPoint;
        printf("Total amount of the cart: %.2f euros\n", $thisJoinPoint->getTarget()->getAmount());
        unset($thisJoinPoint);
    }
    __phpaspecte3aa34f6be6c50d8292afc54b4f644d5();
}
$phpaspect_564;
?>