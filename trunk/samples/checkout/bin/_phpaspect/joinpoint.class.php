<?php
/**
 * JoinPoint Introspection
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
class JoinPoint{

    protected $kind;
    protected $signature;
    protected $line;
    protected $file;

    public function __construct($kind, $signature, $line, $file){
        $this->kind      = $kind;
        $this->signature = $signature;
        $this->line      = $line;
        $this->file      = $file;
    }

    public function getKind(){
        return $this->getKind;
    }

    public function getSignature(){
        return $this->signature;
    }

    public function getLine(){
        return $this->line;
    }

    public function getFile(){
        return $this->file;
    }
}
?>
