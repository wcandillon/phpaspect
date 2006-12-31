<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<!--
Generates xslt expressions from before executions advices

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
    <xsl:if test="name(.) = 'php:start' and not(descendant::php:start)">
        <xsl:for-each select="//php:xpath_expr[preceding-sibling::php:T_BEFORE and contains(text(), 'php:class_statement') and contains(text(), 'name()=')]">
                <xsl:element name="xsl:if" namespace="&xsl;">
                    <xsl:attribute name="test"><xsl:value-of select="./text()" /></xsl:attribute>
                     <xsl:element name="xsl:copy" namespace="&xsl;">
                        <xsl:value-of select="following-sibling::php:inner_statement_list" />
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
    </xsl:if>
    <xsl:apply-templates select="*"/>
</xsl:template>
</xsl:stylesheet>