#!/bin/sh

DEFAULT_PHPASPECT_PATH=/home/wcandillon/soc/phpaspect/
#DEFAULT_PHPASPECT_PATH='/usr/share/php/PHP'

if [ $PHPASPECT_HOME="" ]; then
    echo -n "Enter the phpAspect path [$DEFAULT_PHPASPECT_PATH]: "
    read PHPASPECT_HOME
    [ "z$PHPASPECT_HOME" = "z" ] && PHPASPECT_HOME=$DEFAULT_PHPASPECT_PATH
fi

php $PHPASPECT_HOME/phpaspect.php -b book/src book/src book/bin
php $PHPASPECT_HOME/phpaspect.php -b checkout/src checkout/src checkout/bin
php $PHPASPECT_HOME/phpaspect.php -b context/src context/src context/bin
php $PHPASPECT_HOME/phpaspect.php -b observer/src observer/src observer/bin
php $PHPASPECT_HOME/phpaspect.php -b observer.v2/src observer.v2/src observer.v2/bin
php $PHPASPECT_HOME/phpaspect.php -b singleton/src singleton/src singleton/bin

