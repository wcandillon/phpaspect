<?php
aspect Trace{

    pointcut traceNew:new(Book(0));
    pointcut traceChanges:exec(public *::*(1)) && !exec(public Book::save(0));
    pointcut traceSave:call(*->save(0));

    before(): traceNew{
        echo "Before a construction of Book\n";
    }

    around(): traceNew{
        echo "Around a construction of a Book\n";
        return proceed();
    }

    after(): traceNew{
        echo "Before a construction of Book\n";
    }

    before(): traceChanges{
        echo "Before an execution of a ".$thisJoinPoint->getMethodName()."\n";
    }

    after(): traceChanges{
        echo "After an execution of a ".$thisJoinPoint->getMethodName()."\n";
    }

    before(): traceSave{
        echo "Before a save()\n";
    }

    around(): traceSave{
        echo "Around a save()\n";
        proceed();
    }

    after(): traceSave{
        echo "After a save()\n";
    }
}
?> 
