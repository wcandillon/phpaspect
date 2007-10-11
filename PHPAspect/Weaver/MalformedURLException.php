<?php

define('FILE_URL', 1);
define('DIRECTORY_URL', 2);

class MalformedURLException extends Exception{
    
    private $url;
    
    public function __construct($url, $ressourceType=0){
        switch($ressourceType){
            case FILE_URL:
                $message = 'No such file:';
            case DIRECTORY_URL:
                $message = 'No such directory:';
            default:
                $message = 'No such ressource:';
        }
        parent::__construct($message.$url.' (include_path='.get_include_path().')');
        $this->url = $url;
    }
}
?>