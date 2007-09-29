<?xml version="1.0" encoding="ISO-8859-1"?>
<!--
Generates xslt expressions from After advices

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
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="&xsl;" xmlns:php="&php;">
<xsl:output method="xml" encoding="ISO-8859-1" omit-xml-declaration="yes" />

<xsl:template match="*">
    <xsl:for-each select="//php:xpath_expr[preceding-sibling::php:T_AFTER]">
        <xsl:element name="xsl:if">
            <xsl:attribute name="test"><xsl:value-of select="./text()" /></xsl:attribute>
            <xsl:call-template name="joinpoint" />
        </xsl:element>
    </xsl:for-each>
</xsl:template>

<xsl:template name="joinpoint">
    <xsl:element name="php:T_IF" >if</xsl:element>
    <xsl:element name="php:CHAR40">(</xsl:element>
    <xsl:element name="php:expr">
        <xsl:element name="xsl:value-of">
            <xsl:attribute name="select">
                <xsl:value-of select="php:function('Test::getTest', @id)" />
            </xsl:attribute>
        </xsl:element>
    </xsl:element>
    <xsl:element name="php:CHAR41">)</xsl:element>
    <xsl:element name="php:CHAR123">{</xsl:element>
    <!--
        Instanciate the thisJoinPoint variable
    -->
    <xsl:call-template name="joinpointCall" />
    <xsl:call-template name="joinpointNew" />
    <!--
        Generating the advice function
    -->
    <xsl:element name="php:function">function</xsl:element>
    <xsl:element name="php:T_STRING">&separator3;__phpaspect
        <xsl:element name="xsl:value-of">
            <xsl:attribute name="select">php:function('Counter::getId')</xsl:attribute>
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
    <xsl:element name="php:thisJoinpoint">unset($thisJoinPoint);</xsl:element>
    <xsl:element name="php:CHAR125">}</xsl:element>
    <xsl:element name="php:T_STRING">__phpaspect
        <xsl:element name="xsl:value-of">
            <xsl:attribute name="select">php:function('Counter::getId')</xsl:attribute>
        </xsl:element>
    </xsl:element>
    <xsl:element name="php:CHAR40">(</xsl:element>
    <xsl:call-template name="joinpointArgs" />
    <xsl:element name="php:CHAR41">)</xsl:element>
    <xsl:element name="php:CHAR59">;</xsl:element>
    <xsl:element name="php:CHAR125">}</xsl:element>
</xsl:template>

<!-- JoinPoint Call
    Instancie un joinpoint de type call
-->
<xsl:template name="joinpointCall">
    <xsl:element name="xsl:if">
        <xsl:attribute name="test">php:T_OBJECT_OPERATOR</xsl:attribute>
        <xsl:element name="php:thisJoinpoint">$thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(</xsl:element>
        <xsl:element name="xsl:for-each">
            <xsl:attribute name="select">descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list</xsl:attribute>
            <xsl:element name="xsl:copy-of">
                <xsl:attribute name="select">.</xsl:attribute>
            </xsl:element>
        </xsl:element>
        <xsl:element name="php:thisJoinpoint">), </xsl:element>
        <xsl:element name="xsl:copy-of">
            <xsl:attribute name="select">php:T_VARIABLE[2]</xsl:attribute>
        </xsl:element>
        <xsl:element name="php:thisJoinpoint">, '</xsl:element>
        <xsl:element name="xsl:copy-of">
            <xsl:attribute name="select">php:object_property</xsl:attribute>
        </xsl:element>
        <xsl:element name="php:thisJoinpoint">');</xsl:element>
    </xsl:element>
</xsl:template>

<!-- JoinPoint New 
        Instancie un joinpoint de type new
-->
<xsl:template name="joinpointNew">
    <xsl:element name="xsl:if">
        <xsl:attribute name="test">php:expr_without_variable/php:T_NEW</xsl:attribute>
        <xsl:element name="php:thisJoinpoint">$thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(</xsl:element>
        <xsl:element name="xsl:for-each">
        <xsl:attribute name="select">descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list</xsl:attribute>
            <xsl:element name="xsl:copy-of">
                <xsl:attribute name="select">.</xsl:attribute>
            </xsl:element>
        </xsl:element>
        <xsl:element name="php:thisJoinpoint">), </xsl:element>
        <xsl:element name="xsl:copy-of">
            <xsl:attribute name="select">descendant::php:T_VARIABLE[1]</xsl:attribute>
        </xsl:element>
        <xsl:element name="php:thisJoinpoint">);</xsl:element>
    </xsl:element>
</xsl:template>

<xsl:template name="joinpointArgs">
    <xsl:element name="php:T_VARIABLE">$thisJoinPoint</xsl:element>
    <xsl:if test="parent::php:aspect_statement/php:unset_variables">
        <xsl:element name="php:CHAR44">,</xsl:element>
        <xsl:copy-of select="parent::php:aspect_statement/php:unset_variables" />
    </xsl:if>
</xsl:template>
</xsl:stylesheet>