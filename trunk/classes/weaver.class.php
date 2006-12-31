<?php
/**
 * phpAspect Weaver
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

define('LIBXML_OPTIONS', LIBXML_DTDLOAD | LIBXML_NOENT | LIBXML_DTDATTR | LIBXML_NOCDATA);

class Weaver{

    /**
     * Weaving aspects
     *
     * @name    aspects
     * @access  private
     * @var     array
     */
    private $aspects = array();

    /**
     * Aspects classes entities includes
     *
     * @name    includes
     * @access  private
     * @var     array
     */
    private $includes = array();

    /**
     * Weaving options
     *
     * @name    options
     * @access  private
     * @var     array
     */
    private $options = array();

    /**
     * Instance of the PHP_Beautifier
     *
     * @name    b
     * @access  private
     * @var     Beautifier
     * @see     http://beautifyphp.sourceforge.net/docs/
     */
    private $b;

    /**
     * Weaver::__construct
     *
     * @name    __construct
     * @access  public
     */
    public function __construct($options){
        if($options['beautify']){
            $this->b = new PHP_Beautifier();
            $this->b->addFilter('Pear');
            $this->b->addFilter('IndentStyles');
            $this->b->addFilter('Default');
            $this->b->setIndentChar(' ');
            $this->b->setIndentNumber(4);
        }
    }

    public function beautifyCode($code){
        if($this->b){
            $this->b->setInputString($code);
            $this->b->process();
            return $this->b->get();
        }else{
            return $code;
        }
    }

    public function xsltProc($input, $xslt, $line=0){
        //echo "line: $line\n";
        $xml1 = new DOMDocument();
        $xml2 = new DOMDocument();
        $xsl = new XSLTProcessor();

        $xsl->registerPHPFunctions();
        $xml1->loadXML($input, LIBXML_OPTIONS);
        $xml2->load($xslt, LIBXML_OPTIONS);
        $xsl->importStyleSheet($xml2);
        $xml = $xsl->transformToXML($xml1);
        return $xml;
    }

    /**
     * Weaver::aspects setter.
     *
     * @name    setAspects
     * @access  public
     * @param   string $aspects Aspects directory
     */
    public function setAspects($aspects){
        $dh = opendir($aspects);
        while(($file = readdir($dh)) !== false){
            if($file == '.' || $file == '..'){
                continue;
            }elseif(is_dir($file)){
                $this->setAspects($file);
            }elseif(substr($file, -11) == '.aspect.php'){
                $this->aspects[] = $aspects.'/'.$file;
            }
        }
        closedir($dh);
    }

    /**
     * Weaver::options setter.
     *
     * @name    setOptions
     * @access  public
     * @param   array $aspects options
     */
    public function setOptions($options){
        $this->options = $options;
    }

    public function weaveProject($source, $target){
        $this->aspects2classes($target);
        ob_start();
        require_once INSTALL_PATH.'xslt/toWeave.xsl.php';
        $aspect = ob_get_contents();
        ob_end_clean();
        file_put_contents(INSTALL_PATH.'tmp/'.getmypid().'_aspect.xsl', $aspect);
        $this->weaveFiles($source, $source, $target, 0);
    }

    /**
     * @
     * @todo Gérer avec les DIRECTORY_SEPARATOR
     **/
    public function weaveFiles($source, $_source, $_target, $sub){
        $dh = opendir($_source);
        while(($file = readdir($dh)) !== false){
            if($file == '.' || $file == '..'){
                continue;
            }elseif(is_dir($_source.'/'.$file)){
                mkdir($_target.'/'.$file);
                $this->weaveFiles($source, $_source.'/'.$file, $_target.'/'.$file, $sub++);
            }else{
                XPathFunctions::clearAll();
                $path = $_target.'/'.$file;
                if(substr($file, -4) == '.php' && substr($file, -11) != '.aspect.php'){
                    $xml = $this->xsltProc(parse_tree_from_file($_source.'/'.$file),
                                                INSTALL_PATH.'xslt/toPrepConstructions.xsl', __LINE__);
                    $xml = $this->xsltProc($xml, INSTALL_PATH.'xslt/toPrepCalls.xsl', __LINE__);
                    $xml = $this->xsltProc($xml, INSTALL_PATH.'xslt/toPrepare.xsl', __LINE__);
                    $xml = $this->xsltProc($xml, INSTALL_PATH.'tmp/'.getmypid().'_aspect.xsl', __LINE__);
                    //$xml = $this->xsltProc($xml, INSTALL_PATH.'xslt/toOptimize.xsl', __LINE__);
                    $_path = '';
                    for($i=2;$i<$sub;$i++){
                        $_path .= '../';
                    }
                    $fp = fopen($path, 'w');
                    fwrite($fp, "<?php\n");
                    fwrite($fp, 'if(!function_exists(\'isType\')){ require_once \''.$_path."_phpaspect/functions.php';\n");
                    fwrite($fp, 'require_once \''.$_path."_phpaspect/joinpoint.class.php';\n");
                    fwrite($fp, 'require_once \''.$_path."_phpaspect/newjoinpoint.class.php';\n");
                    fwrite($fp, 'require_once \''.$_path."_phpaspect/calljoinpoint.class.php';\n");
                    fwrite($fp, 'require_once \''.$_path."_phpaspect/aspect.interface.php';\n");
                    foreach($this->includes as $include){
                        fwrite($fp, 'require_once \''.$_path.'_phpaspect/'.$include."class.php';\n");
                    }
                    fwrite($fp, "}\n?>");
                    fwrite($fp, $this->beautifyCode($this->xsltProc(trim($xml), INSTALL_PATH.'xslt/toWrite.xsl', __LINE__)));
                    fclose($fp);
                    unset($xml);
                }elseif(substr($file, -11) != '.aspect.php'){
                    //copy($_source.'/'.$file, $_target.'/'.$file);
                }
            }
        }
        closedir($dh);
    }

    public function weaveCode($code){

    }

    public function aspects2classes($target){
        mkdir($target.'/_phpaspect/');
        copy(INSTALL_PATH.'include/functions.php', $target.'/_phpaspect/functions.php');
        copy(INSTALL_PATH.'include/aspect.interface.php', $target.'/_phpaspect/aspect.interface.php');
        copy(INSTALL_PATH.'include/joinpoint.class.php', $target.'/_phpaspect/joinpoint.class.php');
        copy(INSTALL_PATH.'include/newjoinpoint.class.php', $target.'/_phpaspect/newjoinpoint.class.php');
        copy(INSTALL_PATH.'include/calljoinpoint.class.php', $target.'/_phpaspect/calljoinpoint.class.php');
        foreach($this->aspects as $aspect){
            $this->includes[] = basename($aspect, 'aspect.php');
            XPathFunctions::clearPointcuts();
            $xml = parse_tree_from_file($aspect);
            $this->xsltProc($xml, INSTALL_PATH.'xslt/toDynamicJP.xsl', __LINE__);
            $xml = $this->xsltProc($xml, INSTALL_PATH.'xslt/toXPath.xsl', __LINE__);
            file_put_contents($target.'/_phpaspect/'.basename($aspect, 'aspect.php').'class.php',
                                $this->xsltProc($xml, INSTALL_PATH.'xslt/toClass.xsl', __LINE__));
            file_put_contents(INSTALL_PATH.'tmp/'.getmypid().basename($aspect, 'php').'intro',
                                $this->xsltProc($xml, INSTALL_PATH.'xslt/toIntroductions.xsl', __LINE__));
            file_put_contents(INSTALL_PATH.'tmp/'.getmypid().basename($aspect, 'php').'before',
                                $this->xsltProc($xml, INSTALL_PATH.'xslt/toBefore.xsl', __LINE__));
            file_put_contents(INSTALL_PATH.'tmp/'.getmypid().basename($aspect, 'php').'around',
                                $this->xsltProc($xml, INSTALL_PATH.'xslt/toAround.xsl', __LINE__));
            file_put_contents(INSTALL_PATH.'tmp/'.getmypid().basename($aspect, 'php').'after',
                                $this->xsltProc($xml, INSTALL_PATH.'xslt/toAfter.xsl', __LINE__));
            file_put_contents(INSTALL_PATH.'tmp/'.getmypid().basename($aspect, 'php').'before_exec',
                                $this->xsltProc($xml, INSTALL_PATH.'xslt/toBeforeExec.xsl', __LINE__));
            file_put_contents(INSTALL_PATH.'tmp/'.getmypid().basename($aspect, 'php').'around_exec',
                                $this->xsltProc($xml, INSTALL_PATH.'xslt/toAroundExec.xsl', __LINE__));
            file_put_contents(INSTALL_PATH.'tmp/'.getmypid().basename($aspect, 'php').'after_exec',
                                $this->xsltProc($xml, INSTALL_PATH.'xslt/toAfterExec.xsl', __LINE__));
            Test::clearAll();
            unset($xml);
        }
    }
}
?>