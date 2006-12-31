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
Generate Classes from Aspects entities

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
Version    0.01
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
            <xsl:when test="name(.) = 'php:top_statement' and child::php:T_ASPECT[1]"><!-- Vérifier les propriétés et méthodes avec un nom réservé -->
                <xsl:text>if(!class_exists('Aspect_</xsl:text>
		<xsl:value-of select="./php:T_STRING/text()" />
		<xsl:text>')){ class Aspect_</xsl:text>
                <xsl:value-of select="./php:T_STRING/text()" />
                <xsl:text> implements Aspect{private static $instance = null;private function __construct(){/* empty */}public static function getInstance(){if(self::$instance === null){self::$instance = new
                 Aspect_</xsl:text>
                <xsl:value-of select="./php:T_STRING/text()" />
                <xsl:text>();}return self::$instance;}public function __call($m, $a){}public function __clone(){trigger_error('Clone is not allowed.', E_USER_ERROR);}
                </xsl:text>
                <xsl:apply-templates select="child::php:class_statement_list"/>
                <xsl:text>}}if(!isset($GLOBALS['__phpaspect']['</xsl:text>
                <xsl:value-of select="./php:T_STRING/text()" />
                <xsl:text>'])){$GLOBALS['__phpaspect']['</xsl:text>
                <xsl:value-of select="./php:T_STRING/text()" />
                <xsl:text>'] = Aspect_</xsl:text>
                <xsl:value-of select="./php:T_STRING/text()" />
                <xsl:text>::getInstance();}</xsl:text>
            </xsl:when>
            <xsl:when test="count(child::php:*)=0">
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
