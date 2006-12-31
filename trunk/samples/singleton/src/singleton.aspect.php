<?php
aspect Singleton{

    public $instances = array();

    pointcut singleton:new(Foo(*)) || new(Bar(*));

    around(): singleton{
        $className = $thisJoinPoint->getClassName();
        if(!isset($thisAspect->instances[$className])){
            $thisAspect->instances[$className] = proceed();
        }
        return $thisAspect->instances[$className];
    }

    public function Foo,Bar::__clone(){
        throw new Exception('Clone of '.get_class($this).' is not  allowed.', E_USER_ERROR);
    }
}
?>
