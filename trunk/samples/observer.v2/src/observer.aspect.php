<?php
aspect Observer{

    pointcut changeLine:exec(public Line::setP2(1));
    pointcut changePoint:exec(public Point::setY(1));

    after(): changeLine || changePoint{
        echo $thisJoinPoint->getTarget();
    }

    public function Line::__toString(){
        return sprintf("New Line: (%d, %d), (%d, %d)\n",
                        $this->p1->getX(), $this->p1->getY(),
                        $this->p2->getX(), $this->p2->getY());
    }

    public function Point::__toString(){
        return sprintf("New Point: (%d, %d)\n",
                        $this->x, $this->y);
    }
}
?>