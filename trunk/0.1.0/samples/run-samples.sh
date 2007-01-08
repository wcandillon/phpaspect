#!/bin/sh

DEFAULT_PHPASPECT_PATH=/home/wcandillon/soc/phpaspect/
#DEFAULT_PHPASPECT_PATH='/usr/share/php/PHP'

if [ $PHPASPECT_HOME="" ]; then
    echo -n "Enter the phpAspect path [$DEFAULT_PHPASPECT_PATH]: "
    read PHPASPECT_HOME
    [ "z$PHPASPECT_HOME" = "z" ] && PHPASPECT_HOME=$DEFAULT_PHPASPECT_PATH
fi

if [ -d $1/src ]; then
    echo "Weaving the $1 sample"
    php $PHPASPECT_HOME/phpaspect.php -b $1/src $1/src $1/bin
    echo "Done, you can run the samples in their bin/ directory"
    echo "Have fun ! ;-)"
else
    echo "$1 is not a valid sample"
fi