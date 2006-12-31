<?php echo "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n";?>
<!DOCTYPE stylesheet [
    <!ENTITY xsl "http://www.w3.org/1999/XSL/Transform">
    <!ENTITY php "http://php.net/xsl">
    <!ENTITY separator1 ":">
    <!ENTITY separator2 "&#10;">
    <!ENTITY separator3 " ">
]>
<!--
Weaver stylesheet

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
<xsl:output method="xml" encoding="ISO-8859-1" />
<xsl:template match="php:*">
    <xsl:if test="name() = 'php:class_statement_list'">
        <xsl:variable name="className" select="parent::php:unticked_class_declaration_statement/*[2]/text()" />
        <xsl:variable name="subtype" select="parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING" />
    </xsl:if>
<?php
    $aspects = scandir(INSTALL_PATH.'tmp/');
    foreach($aspects as $aspect){
        if(substr($aspect, -5) == 'intro' && ereg(getmypid(), $aspect)){
            echo file_get_contents(INSTALL_PATH.'tmp/'.$aspect);
        }
    }
?>
    <xsl:choose>
        <xsl:when test="name() = 'php:unticked_statement' and not(descendant::php:unticked_statement) and php:T_CHAR59">
<?php
    foreach($aspects as $aspect){
        if(substr($aspect, -6) == 'before' && ereg(getmypid(), $aspect)){
            echo file_get_contents(INSTALL_PATH.'tmp/'.$aspect);
        }
    }
?>
            <xsl:choose>
                <xsl:when test="php:T_OBJECT_OPERATOR">
                    <xsl:value-of select="php:function('XPathFunctions::setProceed', ./php:*[local-name() = 'T_VARIABLE' or
                                                                                        local-name() = 'T_OBJECT_OPERATOR' or
                                                                                        local-name() = 'object_property' or
                                                                                        local-name() = 'method_or_not'])" /> 
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="php:function('XPathFunctions::setProceed', ./php:*[3])" /> 
                </xsl:otherwise>
            </xsl:choose>
<?php
    foreach($aspects as $aspect){
        if(substr($aspect, -6) == 'around' && ereg(getmypid(), $aspect)){
            echo file_get_contents(INSTALL_PATH.'tmp/'.$aspect);
        }
    }
?>
            <xsl:choose>
                <xsl:when test="php:function('XPathFunctions::getWeaved')">
                    <xsl:copy-of select="php:T_VARIABLE" />
                    <php:T_CHAR61>=</php:T_CHAR61>
                    <php:T_VARIABLE>$__return_result</php:T_VARIABLE>
                    <php:T_CHAR59>;</php:T_CHAR59>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="." />
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="php:function('XPathFunctions::setWeaved', false())" />
<?php
    foreach($aspects as $aspect){
        if(substr($aspect, -5) == 'after' && ereg(getmypid(), $aspect)){
            echo file_get_contents(INSTALL_PATH.'tmp/'.$aspect);
        }
    }
?>
        </xsl:when>
        <!-- Dealing with method execution -->
        <xsl:when test="name()='php:class_statement' and php:method_modifiers and not(//php:method_body/php:CHAR59)">
            <xsl:copy-of select="php:method_modifiers" />
            <xsl:copy-of select="php:T_FUNCTION" />
            <xsl:copy-of select="php:is_reference" />
            <xsl:copy-of select="php:T_STRING" />
            <xsl:copy-of select="php:CHAR40" />
            <xsl:copy-of select="php:parameter_list" />
            <xsl:copy-of select="php:CHAR41" />
            <php:CHAR123>{</php:CHAR123>
<?php
    foreach($aspects as $aspect){
        if(substr($aspect, -11) == 'before_exec' && ereg(getmypid(), $aspect)){
            echo file_get_contents(INSTALL_PATH.'tmp/'.$aspect);
        }
    }
?>
            <xsl:if test="not(php:method_modifiers//php:T_STATIC)">
                <xsl:value-of select="php:function('XPathFunctions::setProceed',
                                        concat('$this->__phpaspect', php:T_STRING, '(', php:parameter_list,')'))" />
            </xsl:if>
            <xsl:if test="php:method_modifiers//php:T_STATIC">
                <xsl:value-of select="php:function('XPathFunctions::setProceed',
                                        concat('self::__phpaspect', php:T_STRING, '(', php:parameter_list,')'))" />
            </xsl:if>
<?php
    foreach($aspects as $aspect){
        if(substr($aspect, -11) == 'around_exec' && ereg(getmypid(), $aspect)){
            echo file_get_contents(INSTALL_PATH.'tmp/'.$aspect);
        }
    }
?>
            <xsl:if test="not(php:function('XPathFunctions::getWeaved'))">
                    <php:T_VARIABLE>$__return_result</php:T_VARIABLE>
                    <php:T_EQUAL>=</php:T_EQUAL>
                    <xsl:if test="not(php:method_modifiers//php:T_STATIC)">
                        <xsl:copy>
                            <php:T_VARIABLE>$this->__phpaspect<xsl:value-of select="php:T_STRING" />(<xsl:value-of select="php:parameter_list" />)</php:T_VARIABLE>
                        </xsl:copy>
                    </xsl:if>
                    <xsl:if test="php:method_modifiers//php:T_STATIC">
                        <xsl:copy>
                            <php:T_VARIABLE>self::__phpaspect<xsl:value-of select="php:T_STRING" />(<xsl:value-of select="php:parameter_list" />)</php:T_VARIABLE>
                        </xsl:copy>
                    </xsl:if>
                    <php:T_CHAR59>;</php:T_CHAR59>
            </xsl:if>
            <xsl:value-of select="php:function('XPathFunctions::setWeaved', false())" />
<?php
    foreach($aspects as $aspect){
        if(substr($aspect, -10) == 'after_exec' && ereg(getmypid(), $aspect)){
            echo file_get_contents(INSTALL_PATH.'tmp/'.$aspect);
        }
    }
?>
            <php:T_RETURN>return</php:T_RETURN>
            <php:T_VARIABLE>$__return_result</php:T_VARIABLE>
            <php:T_CHAR59>;</php:T_CHAR59>
            <php:CHAR125>}</php:CHAR125>
    
            <xsl:copy-of select="php:method_modifiers" />
            <xsl:copy-of select="php:T_FUNCTION" />
            <xsl:copy-of select="php:is_reference" />
            <php:T_STRING>__phpaspect<xsl:value-of select="php:T_STRING" /></php:T_STRING>
            <xsl:copy-of select="php:CHAR40" />
            <xsl:copy-of select="php:parameter_list" />
            <xsl:copy-of select="php:CHAR41" />
            <php:CHAR123>{</php:CHAR123>
            <xsl:copy-of select="php:method_body/php:inner_statement_list" />
            <php:CHAR125>}</php:CHAR125>
        </xsl:when>
        <xsl:otherwise>
            <xsl:copy>
                <xsl:apply-templates select="*|text()"/>
            </xsl:copy>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
</xsl:stylesheet>