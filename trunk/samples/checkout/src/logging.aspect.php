<?php
aspect TraceOrder{
  pointcut logAddItem:exec(public Order::addItem(2));
  pointcut logTotalAmount:call(Order->addItem(2));
  //pointcut giveDiscount:exec(public Order::getAmount(1));

  after($quantity, $reference): logAddItem{
    printf("%d %s added to the cart\n", $quantity, $reference);
  }

  after(): logTotalAmount{
    printf("Total amount of the cart: %.2f euros\n",
      $thisJoinPoint->getTarget()->getAmount());
  }

  /*around(): logAddItem{
    if(rand(0,1)){
      echo "Lucky you!, I'm gonna to give you a 20% discount\n";
      $sold = proceed();
      return $sold- $sold*0.2;
    }else{
      proceed();
    } 
  }*/
}
?> 
