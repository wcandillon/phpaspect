<?php
require_once 'classes/shape.class.php';
require_once 'classes/point.class.php';
require_once 'classes/line.class.php';

$p1 = new Point();
$p1->setX(0);
$p1->setY(0);

$p2 = new Point();
$p2->setX(100);
$p2->setY(0);

$p3 = new Point();
$p3->setX(50);
$p3->setY(100);

$l1 = new Line();
$l1->setP1($p1);
$l1->setP2($p2);

$l2 = new Line();
$l2->setP1($p1);
$l2->setP2($p3);

$l3 = new Line();
$l3->setP1($p2);
$l3->setP2($p3);
?>