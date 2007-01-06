<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<!--
Generates xslt expressions from Around advices

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
<xsl:template match="php:*">
    <xsl:if test="name(.) = 'php:start' and not(descendant::php:start)">
            <xsl:for-each select="//php:xpath_expr[preceding-sibling::php:T_AROUND]">
                <xsl:element name="xsl:if">
                    <xsl:attribute name="test"><xsl:value-of select="./text()" /></xsl:attribute>
                    <xsl:element name="php:T_IF">if</xsl:element>
                    <xsl:element name="php:CHAR40">(</xsl:element>
                    <xsl:element name="php:expr">
                        <xsl:element name="xsl:value-of">
                            <xsl:attribute name="select"><xsl:value-of select="php:function('Test::getTest', @id)" /></xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="php:CHAR41">)</xsl:element>
                    <xsl:element name="php:CHAR123">{</xsl:element>
                    <!--
                        Generating the advice function
                    -->
                    <xsl:element name="xsl:if">
                        <xsl:attribute name="test">php:expr_without_variable/php:T_NEW</xsl:attribute>
                        <xsl:element name="php:thisJoinpoint">$thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(</xsl:element>
                        <xsl:element name="xsl:for-each">
                            <xsl:attribute name="select">descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list</xsl:attribute>
                            <xsl:element name="xsl:copy-of">
                                <xsl:attribute name="select">.</xsl:attribute>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="php:thisJoinpoint">), "</xsl:element>
                        <xsl:element name="xsl:copy-of">
                            <xsl:attribute name="select">php:expr_without_variable/php:class_name_reference</xsl:attribute>
                        </xsl:element>
                        <xsl:element name="php:thisJoinpoint">");</xsl:element>
                    </xsl:element>
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
                    <xsl:copy-of select="following::php:inner_statement_list[1]" />
                    <xsl:element name="php:thisJoinpoint">unset($thisJoinPoint);</xsl:element>
                    <xsl:element name="xsl:value-of">
                        <xsl:attribute name="select">php:function('XPathFunctions::setWeaved', true())</xsl:attribute>
                    </xsl:element>
                    <xsl:element name="php:CHAR125">}</xsl:element>
                    <xsl:element name="php:T_ELSE">else</xsl:element>
                    <xsl:element name="php:CHAR123">{</xsl:element>
                        <xsl:element name="xsl:copy-of">
                            <xsl:attribute name="select">.</xsl:attribute>
                        </xsl:element>
                        <xsl:element name="php:T_VARIABLE">$__return_result</xsl:element>
                        <xsl:element name="php:CHAR61"> = </xsl:element>
                        <xsl:element name="xsl:copy-of">
                            <xsl:attribute name="select">./php:T_VARIABLE[1]</xsl:attribute>
                        </xsl:element>
                    <xsl:element name="php:CHAR59">;</xsl:element>
                    <xsl:element name="php:CHAR125">}</xsl:element>
                </xsl:element>
            </xsl:for-each>
    </xsl:if>
    <xsl:apply-templates select="*" />
</xsl:template>
</xsl:stylesheet>