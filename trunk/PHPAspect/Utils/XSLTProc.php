<?php

require_once 'PHPAspect/Utils/FileSystem.php';

define('LIBXML_OPTIONS', LIBXML_DTDLOAD | LIBXML_NOENT | LIBXML_DTDATTR | LIBXML_NOCDATA);

/*
 * @TODO: check the reference counting (just in case)
 */
class XSLTProc{

    public  static function transformToDoc($xml, $xsl){
    	$xml = self::getDOMDocument($xml);
        $xsl = self::getDOMDocument($xsl);
        
    	$xsltProc = new XSLTProcessor();
        $xsltProc->importStyleSheet($xsl);

        return $xsltProc->transformToDoc($xml);
    }
    
    public static function transformToXML($xml, $xsl){
    	$xml = self::getDOMDocument($xml);
        $xsl = self::getDOMDocument($xsl);
        
    	$xsltProc = new XSLTProcessor();
        $xsltProc->importStyleSheet($xsl);

        return $xsltProc->transformToXML($xml);
    }

    public  static function getDOMDocument($xml){
        if($xml instanceof DOMDocument){
            return $xml;
        }elseif($path = FileSystem::mapPath($xml)){
            return DOMDocument::load($path, LIBXML_OPTIONS);
        }elseif(is_string($xml)){
            return DOMDocument::loadXML($xml, LIBXML_OPTIONS);
        }else{
            throw new InvalidParameterException($xml);
        }

    }
}
?>