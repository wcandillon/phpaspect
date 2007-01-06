<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE stylesheet [
   <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
   <!ENTITY php "http://php.net/xsl">
   <!ENTITY separator1 ":">
   <!ENTITY separator2 "&#10;">
   <!ENTITY separator3 " ">
]>
<!--
Unroll methods and functions calls

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
<xsl:output method="xml" encoding="ISO-8859-1" omit-xml-declaration="yes" />
<xsl:template match="php:*">
    <xsl:variable name="count" select="count(ancestor::php:unticked_statement)+1"/>
    <xsl:if test="name() = 'php:unticked_statement'">
        <xsl:for-each select="descendant::php:variable[
                                    not(count(ancestor::php:unticked_statement) &#62; $count)]">
            <xsl:sort select="@id" data-type="number" order="ascending" />
                <xsl:element name="php:unticked_statement" namespace="&php;">
                    <xsl:choose>
                        <xsl:when test="php:variable_properties and php:variable_properties/php:variable_property">
                            <xsl:value-of select="php:function('XPathFunctions::addDirectId', @id, php:variable_properties/php:variable_property[last()]/@id)" />
                        </xsl:when>
                        <xsl:when test="php:object_property and not(php:variable_properties/php:variable_property)">
                            <xsl:value-of select="php:function('XPathFunctions::addDirectId', @id, @id)" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="php:function('XPathFunctions::addDirectId', @id, php:base_variable_with_function_calls/@id)" />
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:element name="php:T_VARIABLE" namespace="&php;">$phpaspect_<xsl:value-of select="php:base_variable_with_function_calls/@id" /></xsl:element>
                    <xsl:element name="php:T_CHAR61" namespace="&php;"> = &#38;</xsl:element>
                        <xsl:copy-of select="php:base_variable_with_function_calls" />
                        <xsl:element name="php:T_CHAR59" namespace="&php;">;</xsl:element>
            </xsl:element>
            <xsl:if test="php:T_OBJECT_OPERATOR">
                <xsl:element name="php:unticked_statement" namespace="&php;">
                        <xsl:element name="php:T_VARIABLE" namespace="&php;">
                            $phpaspect_<xsl:value-of select="@id" />
                        </xsl:element>
                        <xsl:element name="php:T_CHAR61" namespace="&php;"> = &#38;</xsl:element>
                        <xsl:element name="php:T_VARIABLE" namespace="&php;">
                        <xsl:attribute name="object">1</xsl:attribute>
                        $phpaspect_<xsl:value-of select="php:base_variable_with_function_calls/@id" /></xsl:element>
                        <xsl:copy-of select="php:T_OBJECT_OPERATOR" />
                        <xsl:copy-of select="php:object_property" />
                        <xsl:copy-of select="php:method_or_not" />
                        <xsl:element name="php:T_CHAR59" namespace="&php;">;</xsl:element>
                </xsl:element>
                <xsl:for-each select=".//php:variable_property">
                    <xsl:sort select="@id" data-type="number" order="ascending" />
                    <xsl:element name="php:unticked_statement" namespace="&php;">
                        <xsl:element name="php:T_VARIABLE" namespace="&php;">$phpaspect_<xsl:value-of select="@id" /></xsl:element>
                        <xsl:element name="php:T_CHAR61" namespace="&php;"> = &#38;</xsl:element>
                            <xsl:choose>
                                <xsl:when test="preceding-sibling::php:*[1]/php:variable_property">
                                    <xsl:element name="php:T_VARIABLE" namespace="&php;">
                                        <xsl:attribute name="object">1</xsl:attribute>
                                        $phpaspect_<xsl:value-of select="preceding-sibling::php:*[1]/php:variable_property/@id" />
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="php:T_VARIABLE" namespace="&php;">
                                        <xsl:attribute name="object">1</xsl:attribute>
                                        $phpaspect_<xsl:value-of select="ancestor::php:variable[1]/@id" />
                                    </xsl:element>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:copy-of select="php:T_OBJECT_OPERATOR" />
                            <xsl:copy-of select="php:object_property" />
                            <xsl:copy-of select="php:method_or_not" />
                            <xsl:element name="php:T_CHAR59" namespace="&php;">;</xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
    </xsl:if>
    <xsl:copy>
        <xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
        <xsl:apply-templates select="*|text()"/>
    </xsl:copy>
</xsl:template>
</xsl:stylesheet> 
