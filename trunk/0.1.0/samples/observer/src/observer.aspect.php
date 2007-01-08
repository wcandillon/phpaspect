<?php
aspect Observer{

    pointcut changeLine:exec(public Line::setP2(1));
    pointcut changePoint:exec(public Point::setY(1));

    after($this): changeLine{
        $thisAspect->displayLine($this);
    }

    after($this): changePoint{
        $thisAspect->displayPoint($this);
    }

    public function displayPoint(Point $p){
        printf("New Point: %d, %d\n",
                 $p->getX(), $p->getY());
    }

    public function displayLine(Line $l){
        printf("New Line: (%d, %d) (%d, %d)\n",
                $l->getP1()->getX(), $l->getP1()->getY(),
                $l->getP2()->getX(), $l->getP2()->getY());
    }
}
?>