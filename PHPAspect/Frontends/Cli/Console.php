<?php

require_once 'Console/Getopt.php';
require_once 'PHPAspect/Weaver/WeavingPreferences.php';
require_once 'PHPAspect/Utils/FileSystem.php';

class Console extends Console_Getopt{

    /**
     * Aspect source folder
     *
     * @name    aspects
     * @access  private
     * @var     string
     * @see     usage
     */
    private $aspectSource;

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

    private $weavingPreferences;

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
     * Remove the targeted directory
     *
     * @name    beautify
     * @access  private
     * @var     boolean
     * @see     usage
     */
    private $remove = false;

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
    private $longOptions = array('help', 'verbose', 'version', 'eval', 'code=', 'beautify');

    /**
     * Version number
     *
     * @name    VERSION
     * @access  public
     */
    const VERSION = 1.0;

    /**
     * Date version
     *
     * @name    DATE_VERSION
     * @access  public
     */
    const DATE_VERSION = 'October 09 2007';

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

        $this->weavingPreferences = new WeavingPreferences();
    }

    /**
     * Console::aspects getter.
     *
     * @name    getAspectSource
     * @access  public
     * @return  string
     */
    public function getAspectSource(){
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

    public function getWeavingPreferences(){
        return $this->weavingPreferences;
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
                    $this->weavingPreferences->setVerbose(true);
                case 'b':
                    $this->weavingPreferences->setBeautify(true);
                case 'r':
                    $this->code = $o[1];
                case 'd':
                	$this->remove = true;
            }
        }
		
        $this->aspects = $opt[1][0];
        $this->source  = $opt[1][1];
        $this->target  = $opt[1][2];
        
        $this->weavingPreferences->setRuntimeIncludePath($this->target);
        
        if(!isset($this->aspects) || !isset($this->source) || !isset($this->target)){
            throw new Exception($this->usage());
        }elseif(!is_dir($this->aspects)){
            throw new Exception($this->aspects." isn't a valid directory");
        }elseif(!is_dir($this->source)){
            throw new Exception($this->source." isn't a valid directory");
        }
        
        if(!is_writable($this->target) && !mkdir($this->target)){
            throw new Exception($this->target." isn't a writable directory");
        }
        
        if($this->remove){
        	FileSystem::rmdir($this->target);
        	mkdir($this->target);
        }
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
  -e, --eval                Weave eval code. (not implemented yet)
  -r, --code      <code>    Weave the PHP <code>. (not implemented yet)
  -b, --beautify            Beautify the output code.
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
        return sprintf("phpAspect version %.2f, %s\nAuthor: William Candillon <wcandillon@elv.telecom-lille1.eu>\nWebsite: http://phpaspect.org\n", self::VERSION, self::DATE_VERSION);
    }
}
?>