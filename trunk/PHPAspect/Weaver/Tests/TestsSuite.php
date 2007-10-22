<?php


require_once('PHPUnit/Framework/TestSuite.php');

require_once('Weaver/Tests/PHPAspectWeaverTest.php');


/**
 * Static test suite.
 */
class TestsSuite extends PHPUnit_Framework_TestSuite
{

	/**
	 * Constructs the test suite handler.
	 */
	public function __construct() {
	
		$this->setName('TestsSuite');
		
        $this->addTestSuite('PHPAspectWeaverTest');
        

	}

	/**
	 * Creates the suite.
	 */
    public static function suite()
    {
        $suite = new self();
        return $suite;
    }
}

