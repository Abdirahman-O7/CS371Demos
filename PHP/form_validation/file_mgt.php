<?php

    function get_file($file){
        if($file!="" || $file!=null)
        return addslashes(file_get_contents($file));
    }
    
    
    function get_type($type){
        $type = substr($type, strrpos($type, '.')+1);
        return convert_type($type);
    }
    
    
    function convert_type($type){
        $type=trim(strtolower($type));
        switch($type){
            case "jpg":
                return "image/jpeg";
            case "jpeg":
                return "image/jpeg";
            case "png":
                return "image/png";
            case "gif":
                return "image/gif";
        }
        return $type;
    }
    
    ?>