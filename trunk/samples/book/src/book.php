<?php
require_once 'classes/book.class.php';
try{
    $book = new Book();
    $book->setTitle('Les colories');
    $book->setAuthor('Alexandre Jardin');
    $book->setIsbn('2070308057');
    $book->setPublisher('Editions Gallimard');
    $book->save();
    unset($book);
}catch(BookException $e){
    echo $e->getMessage();
}
?>
