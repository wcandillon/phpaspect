<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<!--
Generates xslt expressions from after executions advices

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
<xsl:stylesheet version="1.0" xmlns:xsl="&xsl;" xmlns:php="&php;">
<xsl:output method="xml" encoding="ISO-8859-1" omit-xml-declaration="yes" />
<xsl:template match="*">
    <xsl:for-each select="//php:xpath_expr[preceding-sibling::php:T_AFTER and contains(text(), 'php:class_statement') and contains(text(), 'name()=')]">
        <xsl:element name="xsl:if" namespace="&xsl;">
            <xsl:attribute name="test"><xsl:value-of select="./text()" /></xsl:attribute>
            <xsl:element name="xsl:copy" namespace="&xsl;">
                <xsl:call-template name="joinpoint" />
            </xsl:element>
        </xsl:element>
    </xsl:for-each>
</xsl:template>

<xsl:template name="joinpoint">
    <!--
        Instanciate the thisJoinPoint variable
    -->
    <xsl:call-template name="joinpointExec" />
    <!--
        Generating the advice function
    -->
    <xsl:element name="xsl:variable" namespace="&xsl;">
        <xsl:attribute name="name">advice_name</xsl:attribute>
        <xsl:attribute name="select">php:function('Counter::getId')</xsl:attribute>
    </xsl:element>
    <xsl:element name="php:function">if(!function_exists('</xsl:element>
    <php:T_STRING>__phpaspect<xsl:element name="xsl:value-of"><xsl:attribute name="select">$advice_name</xsl:attribute></xsl:element>
    </php:T_STRING>
    <xsl:element name="php:function">')){ function</xsl:element>
    <xsl:element name="php:T_STRING">&separator3;__phpaspect
        <xsl:element name="xsl:value-of">
            <xsl:attribute name="select">$advice_name</xsl:attribute>
        </xsl:element>
    </xsl:element>
    <xsl:element name="php:CHAR40">(</xsl:element>
    <xsl:call-template name="joinpointArgs" />
    <xsl:element name="php:CHAR41">)</xsl:element>
    <xsl:element name="php:CHAR123">{</xsl:element>
    <!--
        Calling the advice function
    -->
    <xsl:element name="xsl:copy">
        <xsl:value-of select="following-sibling::php:inner_statement_list" />
    </xsl:element>
    <xsl:element name="php:CHAR125">}}</xsl:element>
    <xsl:element name="php:T_STRING">__phpaspect
        <xsl:element name="xsl:value-of">
            <xsl:attribute name="select">php:function('Counter::getId')</xsl:attribute>
        </xsl:element>
    </xsl:element>
    <xsl:element name="php:CHAR40">(</xsl:element>
    <xsl:call-template name="joinpointArgs" />
    <xsl:element name="php:CHAR41">)</xsl:element>
    <xsl:element name="php:CHAR59">;</xsl:element>
    <xsl:element name="php:thisJoinpoint">unset($thisJoinPoint);</xsl:element>
</xsl:template>

<xsl:template name="joinpointExec">
    <xsl:element name="php:thisJoinpoint">$thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(</xsl:element>
        <xsl:element name="xsl:for-each">
            <xsl:attribute name="select">descendant::php:parameter_list/php:non_empty_parameter_list//php:T_VARIABLE</xsl:attribute>
            <xsl:element name="xsl:copy-of">
                <xsl:attribute name="select">.</xsl:attribute>
            </xsl:element>
            <php:CHAR44>,</php:CHAR44>
        </xsl:element>
        <xsl:element name="php:thisJoinpoint" namespace="&php;">), </xsl:element>
        <xsl:element name="php:T_VARIABLE" namespace="&php;">$this</xsl:element>
        <xsl:element name="php:thisJoinpoint" namespace="&php;">, '</xsl:element>
        <xsl:element name="xsl:copy-of" namespace="&xsl;">
            <xsl:attribute name="select">php:T_STRING</xsl:attribute>
        </xsl:element>
        <xsl:element name="php:thisJoinpoint" namespace="&php;">');</xsl:element>
</xsl:template>

<xsl:template name="joinpointArgs">
    <php:T_VARIABLE>$thisJoinPoint</php:T_VARIABLE>
    <xsl:for-each select="parent::php:aspect_statement/php:aspect_advices_variables//php:variable">
        <php:CHAR44>,</php:CHAR44>
        <xsl:copy-of select="." />
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>