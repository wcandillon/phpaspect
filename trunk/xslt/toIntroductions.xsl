<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<!--
Generate introductions to xslt expressions

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
<xsl:output method="xml" encoding="ISO-8859-1" omit-xml-declaration="yes" />
<xsl:template match="php:*">
    <xsl:if test="name(.) = 'php:aspect_statement' and not(./php:class_statement)">
        <xsl:element name="xsl:if" namespace="&xsl;">
            <xsl:variable name="types" select="php:function('XPathFunctions::explodeNodes', descendant::php:aspect_class_signature/php:aspect_signature_r)" />
            <xsl:attribute name="test">name(.) = 'php:class_statement_list' and 
                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type
                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, '<xsl:value-of select="$types" />')</xsl:attribute>
            <xsl:if test="./php:variable_modifiers[1]">
                <xsl:element name="php:introduction" namespace="&php;">
                    <xsl:attribute name="xml:space">preserve</xsl:attribute>
                    <xsl:variable name="modifiers" select="./php:variable_modifiers" />
                    <xsl:for-each select="descendant::php:aspect_variable_introduction">
                        <xsl:sort select="." order="descending" />
                        <xsl:element name="xsl:if" namespace="&xsl;">
                            <xsl:attribute name="test">php:function('XPathFunctions::hasIntroduction', $className, $subType, '<xsl:value-of select="php:function('XPathFunctions::explodeNodes', ./php:aspect_class_signature)" />')</xsl:attribute>
                            <xsl:element name="php:variable_modifiers" namespace="&php;">
                                <xsl:value-of select="$modifiers" />
                            </xsl:element>
                            <xsl:copy-of select="./php:T_VARIABLE" />
                            <xsl:copy-of select="./php:CHAR61" />
                            <xsl:copy-of select="./php:static_scalar" />
                            <xsl:element name="php:CHAR59" namespace="&php;">;</xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:if>
            <xsl:if test="./php:aspect_constant_introduction[1]">
                <xsl:element name="php:introduction" namespace="&php;">
                    <xsl:attribute name="xml:space">preserve</xsl:attribute>
                    <xsl:for-each select="descendant::php:aspect_constant_introduction">
                        <xsl:sort select="." order="descending" />
                        <xsl:element name="xsl:if" namespace="&xsl;">
                            <xsl:attribute name="test">php:function('XPathFunctions::hasIntroduction', $className, $subType, '<xsl:value-of select="php:function('XPathFunctions::explodeNodes', ./php:aspect_class_signature)" />')</xsl:attribute>
                            <xsl:element name="php:T_CONST" namespace="&php;">const</xsl:element>
                            <xsl:copy-of select="./php:T_STRING" />
                            <xsl:copy-of select="./php:CHAR61" />
                            <xsl:copy-of select="./php:static_scalar" />
                            <xsl:element name="php:CHAR59" namespace="&php;">;</xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:if>
            <xsl:if test="./php:method_modifiers[1]">
                <xsl:element name="php:introduction" namespace="&php;">
                    <xsl:attribute name="xml:space">preserve</xsl:attribute>
                    <xsl:copy-of select="./php:method_modifiers" />
                    <xsl:copy-of select="./php:T_FUNCTION" />
                    <xsl:copy-of select="./php:T_STRING" />
                    <xsl:copy-of select="./php:CHAR40" />
                    <xsl:copy-of select="./php:parameter_list" />
                    <xsl:copy-of select="./php:CHAR41" />
                    <xsl:copy-of select="./php:method_body" />
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:if>
    <xsl:apply-templates select="*"/>
</xsl:template>
</xsl:stylesheet>