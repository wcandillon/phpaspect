<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<!--
Generates dynamics tests from pointcut expressions

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
    <xsl:choose>
        <xsl:when test="name(.) = 'php:aspect_pointcut' and not(ancestor::php:aspect_pointcut)">
                <xsl:value-of select="php:function('Test::setCurrentId', @id, preceding-sibling::php:T_STRING)" />
                <xsl:for-each select="descendant::*[name() = 'php:aspect_joinpoint' or name() = 'php:T_BOOLEAN_OR'
                                        or name() = 'php:T_BOOLEAN_AND' or name() = 'php:CHAR33'
                                        or (name() = 'php:CHAR40' and not(ancestor::php:aspect_joinpoint))
                                        or (name() = 'php:CHAR41' and not(ancestor::php:aspect_joinpoint))
                                        or (name() = 'php:T_STRING' and not(ancestor::php:aspect_joinpoint))]">
                    <xsl:if test="name(.) = 'php:aspect_joinpoint' and ./php:T_NEW[1]">
                        <xsl:value-of select="php:function('Test::setNewJPt', php:aspect_signature_r)" />
                    </xsl:if>
                    <xsl:if test="name(.) = 'php:aspect_joinpoint' and php:T_CALL">
                        <xsl:value-of select="php:function('Test::setCallJPt', php:aspect_signature_r, php:aspect_signature)" />
                    </xsl:if>
                    <xsl:if test="name(.) = 'php:aspect_joinpoint' and php:T_EXEC">
                        <xsl:value-of select="php:function('Test::setExecJPt')" />
                    </xsl:if>
                    <xsl:if test="name(.) = 'php:aspect_joinpoint' and php:T_FILE">
                        <xsl:value-of select="php:function('Test::setFileJPt')" />
                    </xsl:if>
                    <xsl:if test="name(.) = 'php:aspect_joinpoint' and php:T_WITHIN">
                        <xsl:value-of select="php:function('Test::setWithinJPt')" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:T_BOOLEAN_OR'">
                        <xsl:value-of select="php:function('Test::setOr')" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:T_BOOLEAN_AND'">
                        <xsl:value-of select="php:function('Test::setAnd')" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:CHAR33'">
                        <xsl:value-of select="php:function('Test::setNot')" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:CHAR40'">
                        <xsl:value-of select="php:function('Test::setOpenBracket')" />
                    </xsl:if>
                    <xsl:if test="name() = 'php:CHAR41'">
                        <xsl:value-of select="php:function('Test::setCloseBracket')" />
                    </xsl:if>
                    <xsl:if test="name(.) = 'php:aspect_joinpoint' and ./php:T_STRING[1]">
                        <xsl:value-of select="php:function('Test::setJPt', ./php:T_STRING[1])" />
                    </xsl:if>
                </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="*|text()"/>
                </xsl:copy>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
</xsl:stylesheet>