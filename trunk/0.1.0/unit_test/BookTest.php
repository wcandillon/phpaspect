<?php
require_once 'PHPUnit/Framework.php';
require_once 'PHPUnit/Extensions/OutputTestCase.php';
ob_start();
require_once '../samples/book/bin/book.php';
ob_end_clean();

BookTest::$book = $book;

class BookTest extends PHPUnit_Framework_TestCase{

  public static $book;

  public function testBookTitle(){
    $this->assertEquals('Les colories', self::$book->getTitle());
  }

  public function testBookAuthor(){
    $this->equalTo('Alexandre Jardin', self::$book->getAuthor());
  }

  public function testBookIsbn(){
    $this->equalTo('2070308057', self::$book->getIsbn());
  }

  public function testBookEditor(){
    $this->equalTo('Editions Gallimard', self::$book->getPublisher());
  }
}
?>
