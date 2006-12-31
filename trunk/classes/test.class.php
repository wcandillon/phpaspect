<?php
/**
 * Dynamic tests injections
 *
 * PHP versions 5 or more
 *
 *  phpAspect is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with GeSHi; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * @category   PHP
 * @package    phpAspect
 * @author     William Candillon <wcandillon@elv.telecom-lille1.eu>
 * @license   http://gnu.org/copyleft/gpl.html GNU GPL
 * @version    0.01
 * @link       http://phpaspect.org
 */

class Test{

    private static $currentId;
    private static $dynamicJPt = array();
    private static $map = array();

    public static function clearAll(){
        self::$currentId = null;
        self::$dynamicJPt = array();
        self::$map = array();
    }

    public static function setCurrentId($id, $pointcut){
        self::$currentId = $id[0]->value;
        if(isset($pointcut[0]->nodeValue)){
            self::$map[$pointcut[0]->nodeValue] = $id[0]->value;
        }
    }

    public static function setNewJPt($signature){
        if(!isset(self::$dynamicJPt[self::$currentId])){ self::$dynamicJPt[self::$currentId] = array(); }
        self::$dynamicJPt[self::$currentId][] = "php:function('Test::isNewJpt', .//php:class_name_reference, '".trim($signature[0]->nodeValue)."')";
    }

    public static function setCallJPt($object, $method){
        if(!isset(self::$dynamicJPt[self::$currentId])){ self::$dynamicJPt[self::$currentId] = array(); }
        self::$dynamicJPt[self::$currentId][] = "php:function('Test::isCallJpt', php:T_VARIABLE[2], '".trim($object[0]->nodeValue)."',  php:object_property, '".trim($method[0]->nodeValue)."')";
    }

    public static function setExecJPt(){
        if(!isset(self::$dynamicJPt[self::$currentId])){ self::$dynamicJPt[self::$currentId] = array(); }
        self::$dynamicJPt[self::$currentId][] = "false()";
    }

    public static function setOpenBracket(){
        if(!isset(self::$dynamicJPt[self::$currentId])){ self::$dynamicJPt[self::$currentId] = array(); }
        self::$dynamicJPt[self::$currentId][] = "'('";
    }

    public static function setCloseBracket(){
        self::$dynamicJPt[self::$currentId][] = "')'";
    }

    public static function setOr(){
        self::$dynamicJPt[self::$currentId][] = "' || '";
    }

    public static function setAnd(){
        self::$dynamicJPt[self::$currentId][] = "' && '";
    }

    public static function setNot(){
        self::$dynamicJPt[self::$currentId][] = "'!'";
    }

    public static function setJPt($name){
        if(!isset(self::$dynamicJPt[self::$currentId])){
            self::$dynamicJPt[self::$currentId] = array();
        }
        if(!isset(self::$dynamicJPt[self::$map[$name[0]->nodeValue]])){ return false; }
        self::$dynamicJPt[self::$currentId] +=  self::$dynamicJPt[self::$map[$name[0]->nodeValue]];
    }

    public static function isCallJPt($o, $oPattern, $n, $nPattern){
        if(isset($o[0]->nodeValue)){
            $o = trim($o[0]->nodeValue);
        }else{
            $o = "''";
        }
        if(!isset($n[0])){
            $n = '';
        }else{
            $n = trim($n[0]->nodeValue);
        }
        return "isCallType($o, '$oPattern', '$n', '$nPattern')";
    }

    public static function isNewJPt($node, $jp){
        if(isset($node[0])){
            $node = trim($node[0]->nodeValue);
        }else{
            $node = ' ';
        }
        if($node{0} != '$' && substr($jp, -1) != '+') return "true";
        if(substr($jp, -1) == '+'){
            $jp = trim(substr($jp, 0, -1));
            $subType = 'true';
        }else{
            $jp = trim($jp);
            $subType = 'false';
        }
        if($node{0} != '$'){ $node = "'".$node."'"; }
        return "isNewType('$jp', {$node}, $subType)";
    }

    /* the , '' is in case count(self::$dynamicJPt[$id[0]->value]) == 1 */
    public static function getTest($id){
        return 'concat('.implode(',', self::$dynamicJPt[$id[0]->value]).", '')";
    }
}
?>