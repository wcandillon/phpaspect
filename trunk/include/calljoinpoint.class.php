<?php
/**
 * Project:     phpaspect: aspect-oriented programming for PHP
 * File:        new.joinpoint.php
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
class CallJoinPoint extends JoinPoint{

    private $args;
    private $object;
    private $method;

    public function __construct($signature, $line, $file, $args, $object, $method){
        parent::__construct('call', $signature, $line, $file);
        $this->args      = $args;
        $this->object    = $object;
        $this->method    = $method;
    }

    public function getArgs(){
        return $this->args;
    }

    public function getArg($i){
        return $this->args[$i];
    }

    public function getTarget(){
        return $this->object;
    }

    public function getClassName(){
        return $this->className;
    }

    public function getMethodName(){
        return $this->method;
    }
}
?>
