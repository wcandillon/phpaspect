<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
    <!ENTITY newline "
">
    <!ENTITY indent "    ">
    <!ENTITY quote '"'>
]>
<!--

-->
<xsl:stylesheet version="1.0" xmlns="&xsl;" xmlns:xsl="&xsl;" xmlns:php="&php;">
    <xsl:output method="text" indent="no"/>
	<xsl:template match="php:aspect_declaration_statement">
		<xsl:text>class</xsl:text>
	</xsl:template>
</xsl:stylesheet>

