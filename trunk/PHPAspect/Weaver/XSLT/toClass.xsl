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
    <xsl:output method="text" />
	<xsl:template match="php:unticked_aspect_declaration_statement">
		<xsl:text>&lt;?php require_once 'PHPAspect/Runtime/Aspect.php'; class </xsl:text>
		<xsl:value-of select="php:T_STRING" />
		<xsl:value-of select="php:T_EXTENDS" />
		<xsl:value-of select="php:extends_from" />
		<xsl:value-of select="php:implements_list" />
		<xsl:choose>
			<xsl:when test="php:implements_list/php:T_IMPLEMENTS">
				<xsl:text>, Aspect</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>implements Aspect</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>{</xsl:text>
		<xsl:value-of select="//php:class_statement" />
		<xsl:text>}&newline;?&gt;</xsl:text>
<php:implements_list>
</php:implements_list>
	</xsl:template>
</xsl:stylesheet>