<?php

require_once 'PHPAspect/Utils/FileSystem.php';

define('LIBXML_OPTIONS', LIBXML_DTDLOAD | LIBXML_NOENT | LIBXML_DTDATTR | LIBXML_NOCDATA);

class XSLTWeaver{

	const XSLT_TOWRITE = 'PHPAspect/Weaver/XSLT/toWrite.xsl';
    const XSLT_TOCLASS = 'PHPAspect/Weaver/XSLT/toClass.xsl';
    const XSLT_TOXSLT  = 'PHPAspect/Weaver/XSLT/toXSLT.xsl';
    
//    protected static function processFileIn($file, $xsl, $destination){
//        file_put_contents($destination, self::process($file, $xsl));
//    }
//    
//    protected static function processFile($file, $xsl){
//        file_put_contents($file, self::process($file, $xsl));
//    }
    
    /*
     * @TODO: test the reference counting with get memory usage
     * @return DOMDocument
     */
    protected static function process($xml, $xsl){
        
        if($xml instanceof DOMDocument){
            //Do nothing
        }elseif(realpath($xml)){
            $xml = DOMDocument::load($xml, LIBXML_OPTIONS);
        }elseif(is_string($xml)){
            $xml = DOMDOcument::loadXML($xml, LIBXML_OPTIONS);
        }else{
            throw new InvalidParameterException($xml);
        }

        if($xsl instanceof DOMDocument){
            //Do nothing
        }elseif($path = FileSystem::mapPath($xsl)){
            $xsl = DOMDocument::load($path, LIBXML_OPTIONS);
        }elseif(is_string($xsl)){
            $xsl = DOMDocument::loadXML($xsl, LIBXML_OPTIONS);
        }else{
            throw new InvalidParameterException($xsl);
        }
        
        $xsltProc = new XSLTProcessor();
        $xsltProc->importStyleSheet($xsl);
        return $xsltProc->transformToDoc($xml);
    }
}
?>