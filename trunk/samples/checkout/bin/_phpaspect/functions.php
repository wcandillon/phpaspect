<?php
/**
 * Project:     phpaspect: aspect-oriented programming for PHP
 * File:        functions.joinpoint.php
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * For questions, help, comments, discussion, etc., please join the
 * phpaspect googlegroups. Send an e-mail to
 * phpaspect@googlegroups.com
 *
 * @link http://phpaspect.org/
 * @copyright 2005.
 * @author William Candillon <wcandillon@elv.enic.fr>
 * @package phpaspect
 * @version 0.2
 */

function isType($pattern, $class, $subType=false){
    $class = get_class($class);
    if(!$subType){
        return eregi($pattern, $class);
    }else{
        if(eregi($pattern, $class)) return true;
        $reflectionClass = new reflectionClass($class);
        $interfaces = $reflectionClass->getInterfaces();
        foreach($interfaces as $interface){
                if(eregi($pattern, $interface->name)) return true;
        }
        $parentClass = $reflectionClass->getParentClass();
        while($parentClass instanceof ReflectionClass){
                if(eregi($pattern, $parentClass->name)) return true;
                $parentClass = $parentClass->getParentClass();
        }
        return false;
    }
}

function isNewType($pattern, $class, $subType=false){
    if(!$subType){
        return eregi($pattern, $class);
    }else{
        if(eregi($pattern, $class)) return true;
        $reflectionClass = new reflectionClass($class);
        $interfaces = $reflectionClass->getInterfaces();
        foreach($interfaces as $interface){
                if(eregi($pattern, $interface->name)) return true;
        }
        $parentClass = $reflectionClass->getParentClass();
        while($parentClass instanceof ReflectionClass){
                if(eregi($pattern, $parentClass->name)) return true;
                $parentClass = $parentClass->getParentClass();
        }
        return false;
    }
}


function isCallType($o, $oPattern, $n, $nPattern){
    $c1 = false;
    $c2 = true;
    $subType = false;
    if(substr($oPattern, -1) == '+'){
        $oPattern = substr($oPattern, 0, -1);
        $subType = true;
    }
    $c1 = isType(str_replace('*', '.*', $oPattern), $o, $subType);
    if($n{0} == '$'){
        $n = substr($n, 1);
        $c2 = eregi(str_replace('*', '.*', $nPattern), $$n);
    }
    return $c1 && $c2;
}
?>
