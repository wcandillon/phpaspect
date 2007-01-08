<?php
aspect context{
    before():exec(public *::foo(0))
                && file('B.php')
                 && within(Bar){
        echo "Before a foo within Bar in B.php file\n";
    }
}
?> 
