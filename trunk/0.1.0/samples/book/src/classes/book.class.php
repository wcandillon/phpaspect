<?php
class Book{

    private $title;
    private $isbn;
    private $publisher;
    private $author;

    public function save(){
        if(!$this->db){
            throw new BookException("Connection to the db failed\n");
        }
    }

    public function getTitle(){ return $this->title; }
    public function getIsbn(){ return $this->isbn; }
    public function getPublisher(){ return $this->publisher; }
    public function getAuthor(){ return $this->author; }

    public function setTitle($title){
        $this->title = $title;
    }

    public function setIsbn($isbn){
        $this->isbn = $isbn;
    }

    public function setPublisher($publisher){
        $this->publisher = $publisher;
    }

    public function setAuthor($author){
        $this->author = $author;
    }
}

class BookException extends Exception{}
?>