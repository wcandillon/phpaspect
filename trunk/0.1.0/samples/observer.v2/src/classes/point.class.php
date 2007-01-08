<?php
class Point extends Shape{

    private $x = 0;
    private $y = 0;

    public function getX(){ return $this->x; }
    public function getY(){ return $this->y; }

    public function moveBy($dx, $dy){
        $this->x += $dx;
        $this->y += $dy;
    }

    public function setX($x){
        $this->x = $x;
    }

    public function setY($y){
        $this->y = $y;
    }
}
?>