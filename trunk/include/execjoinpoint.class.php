<?php
/**
 * Execution Introspection Joinpoint
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
class ExecJoinPoint extends JoinPoint{

    private $args;
    private $object;
    private $method;
    private $source;

    public function __construct($signature, $line, $file, $args, $object, $method){
        parent::__construct('exec', $signature, $line, $file);
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

    public function getSource(){
        return $this->source;
    }

    public function getClassName(){
        return $this->className;
    }

    public function getMethodName(){
        return $this->method;
    }
}
?>