<?php
class Foo{
    public function showInstance(){
        var_dump($this);
    }
}
 
class Bar{
    private $state;
 
    public function __construct($state=false){
        $this->state = $state;
    }

    public function showInstance(){
        var_dump($this);
    }
}

$a = new Foo();
$a->showInstance();
$b = new Foo();
$b->showInstance();
$bar = 'Bar';
$c = new $bar(true);
$c->showInstance();
$d = new Bar(false);
$d->showInstance();
?>