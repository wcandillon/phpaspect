<?php

class FileSystem {
    
	/**
     * Copy a file, or recursively copy a folder and its contents
     *
     * Add the filter parameter (William Candillon)
     * 
     * @author      Aidan Lister <aidan@php.net>
     * @version     1.0.1
     * @link        http://aidanlister.com/repos/v/function.copyr.php
     * @param       string   $source    Source path
     * @param       string   $dest      Destination path
     * @return      bool     Returns TRUE on success, FALSE on failure
     */
    public static function copyr($source, $dest, $filter=''){
        // Simple copy for a file
        if (is_file($source)){
        	if(eregi(pathinfo($source, PATHINFO_EXTENSION), $filter)){
        		return false;
        	}
        	return copy($source, $dest);
        }
    
        // Make destination directory
        if (!is_dir($dest)) {
            mkdir($dest);
        }

        // Loop through the folder
        $dir = dir($source);
        while (false !== $entry = $dir->read()) {
            // Skip pointers
            if ($entry == '.' || $entry == '..') {
                continue;
            }
            // Deep copy directories
            if ($dest !== "$source/$entry") {
                self::copyr("$source/$entry", "$dest/$entry", $filter);
            }
        }
        // Clean up
        $dir->close();
        return true;
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
    public static function rmdir($dir){
        $dh = opendir($dir);
        while(($file = readdir($dh)) !== false){
            if($file == '.' || $file == '..'){
                continue;
            }elseif(is_dir($dir.'/'.$file)){
                self::rmdir($dir.'/'.$file);
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
    
    public static function mapPath($path){
    	$includePath = explode(PATH_SEPARATOR, get_include_path());
  		foreach($includePath as $prefix){
		    $potentialPath = $prefix.DIRECTORY_SEPARATOR.$path;
		    if(file_exists($potentialPath)){
		    	return($potentialPath);
		    }
		}
    	return false;
    }
}

?>
