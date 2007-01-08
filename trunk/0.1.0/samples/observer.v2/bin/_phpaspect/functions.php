<?php
/**
 * Functions library
 *
 * PHP versions 5 or more
 *
 *  phpAspect is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with phpAspect; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * @category   PHP
 * @package    phpAspect
 * @author     William Candillon <wcandillon@elv.telecom-lille1.eu>
 * @license   http://gnu.org/copyleft/gpl.html GNU GPL
 * @version    0.1.0
 * @link       http://phpaspect.org
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
