<?php
/**
 * XPath functions for phpAspect
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


class XPathFunctions{

    private static $proceed = null;
    private static $weaved = false;
    private static $ids = array();
    private static $callIds = array();
    private static $pointcuts = array();

    public static function clearAll(){
        self::$proceed = null;
        self::$weaved = false;
        self::$ids = array();
        self::$callIds = array();
        self::$pointcuts = array();
    }
    //private static $currentId;

    /*public static function setCurrentId($id,){
        self::$currentId = $id[0]->value;
    }*/

    public static function addCallId($id1, $i2){
        self::$callIds[$id1[0]->value] = $id2[0]->value;
    }

    public static function addPointcut($name, $expr){
        if(!isset(self::$pointcuts[$name[0]->wholeText])){ self::$pointcuts[$name[0]->wholeText] = ''; }
        self::$pointcuts[$name[0]->wholeText] .= $expr;
    }

    public static function getPointcut($name){
        return self::$pointcuts[$name[0]->wholeText];
    }

    public static function clearPointcuts(){
        self::$pointcuts = array();
    }

    public static function getNewJoinPoint($signature, $p, $parameters){
        if(substr(trim($signature[0]->nodeValue), -1) == '+'){
            $subType = 'true()';
        }else{
            $subType = 'false()';
        }
        return "(php:expr_without_variable/php:T_NEW
                        and (php:function('XPathFunctions::isType', php:expr_without_variable/php:class_name_reference/php:T_STRING, '".trim($signature[0]->nodeValue)."')
                                or php:expr_without_variable/php:class_name_reference/php:dynamic_class_name_reference
                                or $subType)
                        and ((normalize-space('".trim($p[0]->nodeValue)."') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = '$parameters')))";
    }

    public static function getCallJoinPoint($type, $name, $p, $parameters){
        if(trim($type[0]->nodeValue) == '->'){
            return "(php:T_OBJECT_OPERATOR and php:method_or_not/php:function_call_parameter_list and php:function('XPathFunctions::isMethodName', php:object_property, '".trim($name[0]->nodeValue)."')
                        and ((normalize-space('".trim($p[0]->nodeValue)."') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = '$parameters')))";
        }else{
            return "(false)";//todo
        }
    }

    public static function getExecJoinPoint($className, $methodModifiers, $methodName, $parametersCount){
        $className = trim($className[0]->nodeValue);
        $methodModifiers = trim($methodModifiers[0]->nodeValue);
        $methodName = trim($methodName[0]->nodeValue);
        return "(name()='php:class_statement' and not(//php:method_body/php:CHAR59) and not(ancestor::php:unticked_class_declaration_statement[1]/php:interface_entry) and php:T_STRING = '$methodName' and normalize-space(php:method_modifiers) = '$methodModifiers' and php:T_STRING = '$methodName' and ((normalize-space('$parametersCount') = '*') or count(php:parameter_list/descendant::php:non_empty_parameter_list) = '$parametersCount'))";
    }

    //public function registered 

    public static function addId($id, $v){
        if(isset($v[0]) && isset($id[0])){
            self::$ids[$id[0]->value] = array('id' => $v[0]->value, 'i' => 0);
        }
    }

    public static function addDirectId($id, $v){
        if(isset($v[0]) && isset($id[0])){
            self::$ids[$id[0]->value] = array('id' => $v[0]->value, 'i' => 1);
        }
    }

    public static function hasId($id){
        if(isset($id[0]->value) && isset(self::$ids[$id[0]->value])
            && self::$ids[$id[0]->value]['i']++ && self::$ids[$id[0]->value]['i'] >= 2){
            return true;
        }else{
            return false;
        }
    }

    public static function getId($id){
        return self::$ids[$id[0]->value]['id'];
    }

    public static function setWeaved($bool){
        self::$weaved = $bool;
    }

    public static function getWeaved(){
        return self::$weaved;
    }

    public static function getProceed(){
        if(!self::$weaved){
            return self::$proceed;
        }else{
            $dom = new DOMDocument('1.0', 'iso-8859-1');
            return $dom->createElementNS('http://php.net/xsl', 'php:T_VARIABLE', '$__return_result');
        }
    }

    public static function setProceed($proceed){
            $v = '';
            if(is_array($proceed)){
                foreach($proceed as $p){
                    $v .= $p->nodeValue;
                }
                self::$proceed = $v;
            }else{
                self::$proceed = (string)$proceed;
            }
    }

    public static function isType($className, $pattern){
        if(isset($className[0]) && eregi(str_replace('*', '.*', trim($pattern)), trim($className[0]->nodeValue))){
            return true;
        }else{
            return false;
        }
    }

    public static function isMethodName($name, $pattern){
        return eregi(str_replace('*', '.*', $pattern), trim($name[0]->nodeValue));
    }

    public static function hasIntroduction($className, $subType, $classes){
        if(!isset($className[0])){ return false; }
        if($classes == 'false'){ return false; }
        $className = $className[0]->nodeValue;
        $classes = explode(',', $classes);

        foreach($classes as $class){
            if(eregi(str_replace('*', '.*', $class), $className)){
                return true;
            }
            if(substr($class, -1) == '+'){
                foreach($subType as $type){
                    if(eregi(str_replace('*', '.*', substr($class, 0, -1)), $type->nodeValue)){
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static function explodeNodes($nodes){
        $str = '';
        foreach($nodes as $node){
            $node = str_replace("\n", '', $node->nodeValue);
            if(!strlen($str) || !preg_match('/'.str_replace('*', '\*', $str).'/i', $node)){
                $str .= trim($node).',';
            }
        }
        return substr($str, 0, -1);
    }
}

class Counter{

    private static $i=1;
    private static $lastId=0;

    public static function getId(){
        self::$i++;
        if(self::$i%2){
            return self::$lastId;
        }
        sleep(1);
        self::$lastId = md5(microtime(true));
        return self::$lastId;
    }
}
?>