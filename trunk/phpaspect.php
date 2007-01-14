<?php
/**
 * Command-line handler of phpAspect
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

define('INSTALL_PATH', dirname(__FILE__).'/');

set_include_path(get_include_path().PATH_SEPARATOR.
                    $_ENV['PWD'].PATH_SEPARATOR.
                    INSTALL_PATH);
chdir($_ENV['PWD']);

require_once "classes/console.class.php";
require_once "classes/weaver.class.php";
require_once "classes/xpathfunctions.class.php";
require_once "classes/test.class.php";

try{
    $console = new Console();
    /* Parse command-line options */
    $console->checkDependency();
    $console->setOptions();

    /* Launch the weaving */
    $weaver = new Weaver($console->getOptions());
    $weaver->setAspects($console->getAspects());

    if($console->getCode()){
        echo $weaver->weaveCode($console->getCode());
    }else{
        $weaver->weaveProject($console->getSource(), $console->getTarget());
    }
    $console->cleanTmp(getmypid());
}catch(Exception $e){
    echo $e->getMessage()."\n";
}
?>