<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<!--
Joinpoints to XPath translation

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
    <xsl:choose>
        <xsl:when test="name() = 'php:aspect_pointcut' and not(ancestor::php:aspect_pointcut)">
            <xsl:element name="php:xpath_expr" namespace="&php;">
                <xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
                <!--xsl:value-of select="php:function('XPathFunctions::setCurrentId')" /-->
                <xsl:for-each select="descendant::*[name() = 'php:aspect_joinpoint' or name() = 'php:T_BOOLEAN_OR'
                                        or name() = 'php:T_BOOLEAN_AND' or name() = 'php:CHAR33'
                                        or (name() = 'php:CHAR40' and not(ancestor::php:aspect_joinpoint))
                                        or (name() = 'php:CHAR41' and not(ancestor::php:aspect_joinpoint))
                                        or (name() = 'php:T_STRING' and not(ancestor::php:aspect_joinpoint))]">
                    <!-- Construction joinpoint -->
                    <xsl:if test="name() = 'php:aspect_joinpoint' and php:T_NEW[1]">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), php:function('XPathFunctions::getNewJoinPoint', php:aspect_signature_r, php:aspect_parameters, normalize-space(php:aspect_parameters/php:T_LNUMBER/text())))" />
                        </xsl:if>
                        <xsl:value-of select="php:function('XPathFunctions::getNewJoinPoint', php:aspect_signature_r, php:aspect_parameters, normalize-space(php:aspect_parameters/php:T_LNUMBER/text()))" />
                    </xsl:if>
                    <!-- Execution joinpoint -->
                    <xsl:if test="name()='php:aspect_joinpoint' and php:T_EXEC">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), 
                            php:function('XPathFunctions::getExecJoinPoint', php:aspect_signature[1], php:method_modifiers, php:aspect_signature[2], normalize-space(php:aspect_parameters/php:T_LNUMBER/text())))" />
                        </xsl:if>
                        <xsl:value-of select="php:function('XPathFunctions::getExecJoinPoint', php:aspect_signature[1], php:method_modifiers, php:aspect_signature[2], normalize-space(php:aspect_parameters/php:T_LNUMBER/text()))" />
                    </xsl:if>
                    <!-- Call joinpoint -->
                    <xsl:if test="name() = 'php:aspect_joinpoint' and php:T_CALL">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), php:function('XPathFunctions::getCallJoinPoint', php:aspect_call, php:aspect_signature, php:aspect_parameters, normalize-space(php:aspect_parameters/php:T_LNUMBER/text())))" />
                        </xsl:if>
                        <xsl:value-of select="php:function('XPathFunctions::getCallJoinPoint', php:aspect_call, php:aspect_signature, php:aspect_parameters, normalize-space(php:aspect_parameters/php:T_LNUMBER/text()))" />
                    </xsl:if>
                    <!-- File joinpoint -->
                    <xsl:if test="name() = 'php:aspect_joinpoint' and php:T_FILE">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), php:function('XPathFunctions::getFileJoinPoint', php:T_CONSTANT_ENCAPSED_STRING))" />
                        </xsl:if>
                        <xsl:value-of select="php:function('XPathFunctions::getFileJoinPoint', php:T_CONSTANT_ENCAPSED_STRING)" />
                    </xsl:if>
                    <!-- Within joinpoint -->
                    <xsl:if test="name() = 'php:aspect_joinpoint' and php:T_WITHIN">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), php:function('XPathFunctions::getWithinJoinPoint', php:aspect_signature_r))" />
                        </xsl:if>
                        <xsl:value-of select="php:function('XPathFunctions::getWithinJoinPoint', php:aspect_signature_r)" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:T_BOOLEAN_OR'">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), ' or ')" />
                        </xsl:if>
                        <xsl:value-of select="' or '" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:T_BOOLEAN_AND'">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), ' and ')" />
                        </xsl:if>
                        <xsl:value-of select="' and '" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:CHAR33'">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), 'not')" />
                        </xsl:if>
                        <xsl:value-of select="'not'" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:CHAR40'">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), '(')" />
                        </xsl:if>
                        <xsl:value-of select="'('" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:CHAR41'">
                        <xsl:if test="ancestor::php:aspect_statement[1]/php:T_STRING">
                            <xsl:value-of select="php:function('XPathFunctions::addPointcut', ancestor::php:aspect_statement/php:T_STRING/text(), ')')" />
                        </xsl:if>
                        <xsl:value-of select="')'" />
                    </xsl:if>
                    <xsl:if test="name(.) = 'php:aspect_joinpoint' and ./php:T_STRING[1]">
                        <xsl:value-of select="php:function('XPathFunctions::getPointcut', php:T_STRING[1]/text())" />
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:when>
        <xsl:when test="name() = 'php:function_call' and ./php:T_STRING = 'proceed'">
            <xsl:element name="xsl:copy-of" namespace="&xsl;">
                <xsl:attribute name="select">php:function('XPathFunctions::getProceed')</xsl:attribute>
            </xsl:element>
        </xsl:when>
        <xsl:when test="name() = 'php:T_RETURN' and ancestor::php:inner_statement_list[preceding-sibling::php:T_AROUND]">
            <xsl:element name="php:T_VARIABLE" namespace="&php;">$__return_result</xsl:element>
            <xsl:element name="php:CHAR61" namespace="&php;">=</xsl:element>
        </xsl:when>
        <xsl:when test="name() = 'php:T_VARIABLE' and ./text() = '$thisAspect' and ancestor::php:inner_statement_list[preceding-sibling::php:T_BEFORE or preceding-sibling::php:T_AROUND or preceding-sibling::php:T_AFTER]">
            <xsl:element name="php:T_VARIABLE" namespace="&php;">$GLOBALS['__phpaspect']['<xsl:value-of select="ancestor::php:aspect_statement_list/preceding-sibling::php:T_STRING/text()" />']</xsl:element>
        </xsl:when>
        <xsl:otherwise>
                <xsl:copy>
		    <xsl:attribute name="id"><xsl:value-of select="generate-id()" /></xsl:attribute>
                    <xsl:apply-templates select="*|text()"/>
                </xsl:copy>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
</xsl:stylesheet>