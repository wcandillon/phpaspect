rm -rf output/*
xsltproc --stringparam base.dir output/0.1/en/ --stringparam l10n.gentext.language en html-chunked.xsl 0.1/en/book.xml
php highlight.php output/0.1/en/
cp docbook.css phpaspect.png output/0.1/en/
mkdir output/0.1/en/figures/
cp 0.1/en/figures/*.png output/0.1/en/figures/