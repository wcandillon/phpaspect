<?php
class Line extends Shape{

    private $p1, $p2;

    public function getP1(){ return $this->p1; }
    public function getP2(){ return $this->p2; }

    public function moveBy($dx, $dy){
        $p1->moveBy($dx, $dy);
        $p2->moveBy($x, $dy);
    }

    public function setP1(Point $p1){
        $this->p1 = $p1;
    }

    public function setP2(Point $p2){
        $this->p2 = $p2;
    }
}
?> 
