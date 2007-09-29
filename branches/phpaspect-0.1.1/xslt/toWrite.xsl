<?xml version="1.0" encoding="ISO-8859-1"?>
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
Unparse stylesheet

PHP versions 5 or more

phpAspect is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with phpAspect; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Category   PHP
Package    phpAspect
Author     William Candillon <wcandillon@elv.telecom-lille1.eu>
License   http://gnu.org/copyleft/gpl.html GNU GPL
Version    0.1.0
Link       http://phpaspect.org/

-->
<xsl:stylesheet version="1.0" xmlns="&xsl;" xmlns:xsl="&xsl;" xmlns:php="&php;">
    <xsl:output method="text" indent="no"/>
    <xsl:variable name="punctuation" select="'CHAR40,CHAR41,CHAR59,CHAR123,CHAR125,CHAR44,CHAR63,CHAR58,CHAR61,'" />
    <xsl:variable name="include" select="'
            T_INCLUDE,
	    T_INCLUDE_ONCE,
	    T_REQUIRE,
	    T_REQUIRE_ONCE,'" />
    <xsl:variable name="construct" select="'
            T_FUNCTION,
            T_PRINT,
            T_RETURN,
            T_ECHO,
            T_NEW,
            T_CLASS,
            T_EXTENDS,
            T_IMPLEMENTS
            T_VAR,
            T_GLOBAL,
            T_THROW,'" />
    <xsl:variable name="access" select="'
            T_INTERFACE,
            T_FINAL,
            T_ABSTRACT,
            T_PRIVATE,
            T_PUBLIC,
            T_PROTECTED,
            T_CONST,
            T_STATIC,'" />
    <xsl:template match="php:*">
        <xsl:choose>
            <xsl:when test="name(.) = 'php:start'">
                <xsl:text>&lt;?php&newline;</xsl:text>
                <xsl:for-each select="child::php:*"> 
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:text>&newline;?&gt;</xsl:text>
            </xsl:when>
            <xsl:when test="name(.) = 'php:T_INLINE_HTML'">
                <xsl:text>&newline;?&gt;</xsl:text>
                    <xsl:value-of select="."/>
                <xsl:text>&lt;?php&newline;</xsl:text>
            </xsl:when>
            <xsl:when test="name(.) = 'php:statement' and count(.)=1 and (parent::php:unticked_statement/child::php:T_IF 
            or parent::php:*/child::php:T_ELSE or parent::php:*/child::php:T_ELSEIF) and
                not(./php:unticked_statement/php:CHAR123[1])">
                <xsl:text>{</xsl:text>
                    <xsl:apply-templates select="child::php:*"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="name(.) = 'php:while_statement' and count(.)=1 and 
                parent::php:unticked_statement/child::php:T_WHILE and
                not(./php:statement/php:unticked_statement/php:CHAR123[1])">
                <xsl:text>{</xsl:text>
                    <xsl:apply-templates select="child::php:*"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="name(.) = 'php:for_statement' and count(.)=1 and 
                parent::php:unticked_statement/child::php:T_FOR and
                not(./php:statement/php:unticked_statement/php:CHAR123[1])">
                <xsl:text>{</xsl:text>
                    <xsl:apply-templates select="child::php:*"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="name(.) = 'php:foreach_statement' and count(.)=1 and 
                parent::php:unticked_statement/child::php:T_FOREACH and
                not(./php:statement/php:unticked_statement/php:CHAR123[1])">
                <xsl:text>{</xsl:text>
                    <xsl:apply-templates select="child::php:*"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="name(.) = 'php:declare_statement' and count(.)=1 and 
                parent::php:unticked_statement/child::php:T_DECLARE and
                not(./php:statement/php:unticked_statement/php:CHAR123[1])">
                <xsl:text>{</xsl:text>
                    <xsl:apply-templates select="child::php:*"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="count(child::php:*)=0">
	         <xsl:if test="local-name()='T_IMPLEMENTS' or local-name() = 'T_EXTENDS'">
			<xsl:text>&separator3;</xsl:text>
		</xsl:if>
		 <xsl:if test="./text()!='' and ./text()!='&#10;' and ./text()!='&lt;?='">
                     <xsl:value-of select="." />
		 </xsl:if>
		 <xsl:if test="contains(concat($access,$construct,$include), substring-after(name(.), 'php:'))">
			<xsl:text>&separator3;</xsl:text>
		</xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="child::php:*">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>