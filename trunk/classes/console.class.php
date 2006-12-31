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

if(!@require_once('Console/Getopt.php')){
  die("phpAspect has a dependency with the pear Console_Getopt package\nPlease try: pear install Console_Getopt");
}

class Console extends Console_Getopt{

    /**
     * Aspects folder
     *
     * @name    aspects
     * @access  private
     * @var     string
     * @see     usage
     */
    private $aspects;

    /**
     * Source folder
     *
     * @name    source
     * @access  private
     * @var     string
     * @see     usage
     */
    private $source;

    /**
     * Target folder
     *
     * @name    target
     * @access  private
     * @var     string
     * @see     usage
     */
    private $target;

    /**
     * Verbosity of the weaving
     *
     * @name    verbose
     * @access  private
     * @var     boolean
     * @see     usage
     */
    private $verbose = false;

    /**
     * Weaving eval
     *
     * @name    eval
     * @access  private
     * @var     boolean
     * @see     usage
     */
    private $eval = false;

    /**
     * Beautify the output code
     *
     * @name    beautify
     * @access  private
     * @var     boolean
     * @see     usage
     */
    private $beautify = false;

    /**
     * Remove the targeted directory
     *
     * @name    beautify
     * @access  private
     * @var     boolean
     * @see     usage
     */
    private $remove = false;

    /**
     * Code to weave
     *
     * @name    code
     * @access  private
     * @var     string
     * @see     usage
     */
    private $code;

    /**
     * Short options
     *
     * @name    shortOptions
     * @access  private
     * @var     string
     * @see     http://pear.php.net/manual/en/package.console.console-getopt.intro-options.php
     */
    private $shortOptions = 'vVr:ehbd';

    /**
     * Long options
     *
     * @name    longOptions
     * @access  private
     * @var     string
     * @see     http://pear.php.net/manual/en/package.console.console-getopt.intro-options.php
     */
    private $longOptions = array('help', 'verbose', 'version', 'eval', 'code=', 'beautify', 'remove');

    /**
     * Version number
     *
     * @name    VERSION
     * @access  public
     */
    const VERSION = 0.01;

    /**
     * Date version
     *
     * @name    DATE_VERSION
     * @access  public
     */
    const DATE_VERSION = 'January 01 2007';

    /**
     * Console constructor
     * Check if phpAspect is launched in command-line and if register_argc_argv is turned on.
     *
     * @name    __construct
     * @access  public
     * @throws  Exception
     */
    public function __construct(){
        if(!isset($_SERVER['argc']) || !$_SERVER['argc']){
            throw new Exception("Could not read cmd args (register_argc_argv=Off?)\nphpAspect can only run in cli mode");
        }
    }

    /**
     * Console::aspects getter.
     *
     * @name    getAspects
     * @access  public
     * @return  string
     */
    public function getAspects(){
        return $this->aspects;
    }

    /**
     * Console::source getter.
     *
     * @name    getSource
     * @access  public
     * @return  string
     */
    public function getSource(){
        return $this->source;
    }

    /**
     * Console::target getter.
     *
     * @name    getTarget
     * @access  public
     * @return  string
     */
    public function getTarget(){
        return $this->target;
    }

    /**
     * Console::verbose getter.
     *
     * @name    getVerbose
     * @access  public
     * @return  boolean
     */
    public function getVerbose(){
        return $this->verbose;
    }

    /**
     * Console::eval getter.
     *
     * @name    getEval
     * @access  public
     * @return  boolean
     */
    public function getEval(){
        return $this->eval;
    }

    /**
     * Console::beautify getter.
     *
     * @name    getBeautify
     * @access  public
     * @return  boolean
     */
    public function getBeautify(){
        return $this->beautify;
    }

    /**
     * Console::code getter.
     *
     * @name    getCode
     * @access  public
     * @return  boolean
     */
    public function getCode(){
        return $this->code;
    }

    /**
     * Set the user options
     * Parse the user options and set it in the object.
     *
     * @name    setOptions
     * @access  public
     * @throws  Exception
     */
    public function setOptions(){
        $opt = $this->getopt($this->readPHPArgv(),
                                $this->shortOptions,
                                    $this->longOptions);

        if(PEAR::isError($opt)){
            $this->usage();
            exit(1);
        }

        foreach($opt[0] as $o){
            switch($o[0]){
                case 'V':
                    throw new Exception($this->version());
                case 'h':
                    throw new Exception($this->usage());
                case 'v':
                    $this->verbose = true;
                case 'e':
                    $this->eval = true;
                case 'b':
                    $this->beautify = true;
                case 'd':
                    $this->remove = true;
                case 'r':
                    $this->code = $o[1];
            }
        }

        if(!isset($opt[1][0]) || !isset($opt[1][1]) || !isset($opt[1][2])){
            throw new Exception($this->usage());
        }elseif(!is_dir($opt[1][0])){
            throw new Exception($opt[1][0]." isn't a valid directory");
        }elseif(!is_dir($opt[1][1])){
            throw new Exception($opt[1][1]." isn't a valid directory");
        }

        $this->aspects = $opt[1][0];
        $this->source  = $opt[1][1];
        $this->target  = $opt[1][2];

        if(is_dir($this->target) && (!$this->remove || !$this->rmdir($this->target))){
            throw new Exception($this->target." isn't a writable directory");
        }
        if(!mkdir($this->target)){
            throw new Exception("Couldn't create the ".$this->target." directory");
        }
    }

    /**
     * Get the user options
     * Options for weaving.
     *
     * @name    getOptions
     * @access  public
     * @return  array
     */
    public function getOptions(){
        return array('verbose' => $this->verbose, 'eval' => $this->eval, 'beautify' => $this->beautify);
    }

    /**
     * phpAspect usage
     * Command line usage of phpAspect.
     *
     * @name    usage
     * @access  public
     * @return  string
     */
    public function usage(){
         return "Usage: phpaspect.php [options] <aspects> <source> <target>
                     [options] <aspect> -r <code>\n
  -v, --verbose             Activate verbose mode.
  -e, --eval                Weave eval code.
  -r, --code      <code>    Weave the PHP <code>.
  -b, --beautify            Beautify the output code (for debug purpose only).
  -h, --help                This help.
  -d, --remove              Remove the targeted directory.
  -V, --version             Version number.\n

  Report bugs to <phpaspect@googlegroups.com>\n";
    }

    /**
     * phpAspect version
     * Version number of phpAspect.
     *
     * @name    usage
     * @access  public
     * @return  string
     */
    public function version(){
        return sprintf("phpAspect version %.2f, %s\nAuthor: William Candillon <wcandillon@php.net>\nWebsite: http://phpaspect.org\n", self::VERSION, self::DATE_VERSION);
    }

    /**
     * Recursive removal of directory
     *
     * @name    rmdir
     * @access  public
     * @param   string  directory name
     * @return  integer
     * @see     http://php.net/manual/en/function.rmdir.php
     * @see     http://php.net/manual/en/function.unlink.php
     */
    public function rmdir($dir){
        $dh = opendir($dir);
        while(($file = readdir($dh)) !== false){
            if($file == '.' || $file == '..'){
                continue;
            }elseif(is_dir($dir.'/'.$file)){
                $this->rmdir($dir.'/'.$file);
            }else{
                if(!unlink($dir.'/'.$file)){
                    throw new Exception("Can't delete the $dir/$file file. Check your permissions.");
                }
            }
        }
        closedir($dh);
        if(!rmdir($dir)){
            throw new Exception("Can't delete the $dir directory. Check your permissions.");
        }
        return true;
    }

    /**
     * Cleanning the temporary directory of phpAspect
     *
     * @name    cleanTmp
     * @access  public
     * @param   pid  processus id
     * @return  void
     * @see     http://php.net/manual/en/function.scandir.php
     * @see     http://php.net/manual/en/function.filectime.php
     */
    public function cleanTmp($pid){
        $files = scandir(INSTALL_PATH.'tmp/');
        foreach($files as $file){
            if($file == '.' || $file == '..') continue;
            if((substr($file, 0, strlen((string)$pid)) == $pid) or
                 filectime(INSTALL_PATH.'tmp/'.$file)<time()-3600){
                unlink(INSTALL_PATH.'tmp/'.$file);
            }
        }
    }

    /**
     * Check the dependencies in order to run phpAspect properly
     *
     * @name    checkDependency
     * @access  public
     * @return  void
     * @see     http://php.net/manual/en/function.extension_loaded.php
     * @see     http://php.net/manual/en/function.dl.php
     */
    public function checkDependency(){
      $prefix = (PHP_SHLIB_SUFFIX === 'dll') ? 'php_' : '';
      if(!extension_loaded('parse_tree') && !dl($prefix . 'parse_tree.' . PHP_SHLIB_SUFFIX)){
        throw new Exception("phpAspect has dependency with the Parse_Tree Pecl extension\npecl install -f Parse_Tree");
      }
      if(!@require_once('PHP/Beautifier.php')){
        throw new Exception("phpAspect has dependency with the Beautifier Pear extension\npear install -f PHP_Beautifier");
      }
      return true;
    }
}
?>