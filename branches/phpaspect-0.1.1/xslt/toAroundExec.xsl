<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<!--
Generates xslt expressions from executions around advices

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
<xsl:template match="*">
    <xsl:for-each select="//php:xpath_expr[preceding-sibling::php:T_AROUND and contains(text(), 'php:class_statement') and contains(text(), 'name()=')]">
        <xsl:element name="xsl:if" namespace="&xsl;">
            <xsl:attribute name="test"><xsl:value-of select="./text()" /></xsl:attribute>
            <xsl:call-template name="joinpointExec" />
            <xsl:copy-of select="following::php:inner_statement_list[1]" />
            <xsl:element name="php:code">unset($thisJoinPoint);</xsl:element>
            <xsl:element name="xsl:value-of" namespace="&xsl;">
                <xsl:attribute name="select">php:function('XPathFunctions::setWeaved', true())</xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:for-each>
</xsl:template>

<xsl:template name="joinpointExec">
    <xsl:element name="php:thisJoinpoint">$thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(</xsl:element>
        <xsl:element name="xsl:for-each" namespace="&xsl;">
            <xsl:attribute name="select">descendant::php:parameter_list/php:non_empty_parameter_list//php:T_VARIABLE</xsl:attribute>
            <xsl:element name="xsl:copy-of" namespace="&xsl;">
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
</xsl:stylesheet>