<?xml version="1.0" encoding="ISO-8859-1"?>
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
Version    0.1.0
Link       http://phpaspect.org/

-->
<xsl:stylesheet version="1.0" xmlns="&xsl;" xmlns:xsl="&xsl;" xmlns:php="&php;">
<xsl:output method="xml" encoding="ISO-8859-1" />
<xsl:template match="php:*">
    <xsl:if test="name() = 'php:class_statement_list'">
        <xsl:variable name="className" select="parent::php:unticked_class_declaration_statement/*[2]/text()" />
        <xsl:variable name="subtype" select="parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING" />
    </xsl:if>
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/>
    <xsl:choose>
        <xsl:when test="name() = 'php:unticked_statement' and not(descendant::php:unticked_statement) and php:T_CHAR59">
            <xsl:choose>
                <xsl:when test="php:T_OBJECT_OPERATOR">
                    <xsl:value-of select="php:function('XPathFunctions::setProceed', ./php:*[(local-name() = 'T_VARIABLE' and position()=3) or
                                                                                        local-name() = 'T_OBJECT_OPERATOR' or
                                                                                        local-name() = 'object_property' or
                                                                                        local-name() = 'method_or_not'])" /> 
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="php:function('XPathFunctions::setProceed', ./php:*[3])" /> 
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="php:function('XPathFunctions::getWeaved')">
                    <xsl:copy-of select="php:T_VARIABLE[1]" />
                    <php:T_CHAR61>=</php:T_CHAR61>
                    <php:T_VARIABLE>$__return_result</php:T_VARIABLE>
                    <php:T_CHAR59>;</php:T_CHAR59>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="." />
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="php:function('XPathFunctions::setWeaved', false())" />
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="(name()='php:class_statement' and not(//php:method_body/php:CHAR59) and&#10;                not(ancestor::php:unticked_class_declaration_statement[1]/php:interface_entry) &#10;                and (ancestor::php:unticked_class_declaration_statement[1]/php:T_STRING = 'Order' or php:function('XPathFunctions::isMethodName', ancestor::php:unticked_class_declaration_statement[1]/php:T_STRING, 'Order'))&#10;                and (php:T_STRING = 'addItem' or php:function('XPathFunctions::isMethodName', php:T_STRING, 'addItem')) &#10;                and (normalize-space(php:method_modifiers) = 'public'&#10;                 or  'public'='*')&#10;                )"><php:T_IF xmlns:php="http://php.net/xsl">if</php:T_IF><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:expr xmlns:php="http://php.net/xsl"><xsl:value-of select="concat(false(), '')"/></php:expr><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:if test="php:T_OBJECT_OPERATOR"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), </php:thisJoinpoint><xsl:copy-of select="php:T_VARIABLE[2]"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">, '</php:thisJoinpoint><xsl:copy-of select="php:object_property"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">');</php:thisJoinpoint></xsl:if><xsl:if test="php:expr_without_variable/php:T_NEW"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), </php:thisJoinpoint><xsl:copy-of select="descendant::php:T_VARIABLE[1]"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">);</php:thisJoinpoint></xsl:if><php:function xmlns:php="http://php.net/xsl">function</php:function><php:T_STRING xmlns:php="http://php.net/xsl"> __phpaspect
        <xsl:value-of select="php:function('Counter::getId')"/></php:T_STRING><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:T_VARIABLE xmlns:php="http://php.net/xsl">$thisJoinPoint</php:T_VARIABLE><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:copy>












printf
(









"%d %s added to the cart\n"




,





$quantity






,





$reference







)





;



</xsl:copy><php:thisJoinpoint xmlns:php="http://php.net/xsl">unset($thisJoinPoint);</php:thisJoinpoint><php:CHAR125 xmlns:php="http://php.net/xsl">}</php:CHAR125><php:T_STRING xmlns:php="http://php.net/xsl">__phpaspect
        <xsl:value-of select="php:function('Counter::getId')"/></php:T_STRING><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:T_VARIABLE xmlns:php="http://php.net/xsl">$thisJoinPoint</php:T_VARIABLE><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR59 xmlns:php="http://php.net/xsl">;</php:CHAR59><php:CHAR125 xmlns:php="http://php.net/xsl">}</php:CHAR125></xsl:if><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="(php:T_OBJECT_OPERATOR and php:method_or_not/php:function_call_parameter_list and php:function('XPathFunctions::isMethodName', php:object_property, 'addItem')&#10;                        and ((normalize-space('2') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = '2')))"><php:T_IF xmlns:php="http://php.net/xsl">if</php:T_IF><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:expr xmlns:php="http://php.net/xsl"><xsl:value-of select="concat(php:function('Test::isCallJpt', php:T_VARIABLE[2], 'Order',  php:object_property, 'addItem'), '')"/></php:expr><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:if test="php:T_OBJECT_OPERATOR"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), </php:thisJoinpoint><xsl:copy-of select="php:T_VARIABLE[2]"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">, '</php:thisJoinpoint><xsl:copy-of select="php:object_property"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">');</php:thisJoinpoint></xsl:if><xsl:if test="php:expr_without_variable/php:T_NEW"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), </php:thisJoinpoint><xsl:copy-of select="descendant::php:T_VARIABLE[1]"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">);</php:thisJoinpoint></xsl:if><php:function xmlns:php="http://php.net/xsl">function</php:function><php:T_STRING xmlns:php="http://php.net/xsl"> __phpaspect
        <xsl:value-of select="php:function('Counter::getId')"/></php:T_STRING><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:T_VARIABLE xmlns:php="http://php.net/xsl">$thisJoinPoint</php:T_VARIABLE><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:copy>












printf
(








"Total amount of the cart: %.2f euros\n"




,





$thisJoinPoint




-&gt;





getTarget






(




)





-&gt;



getAmount






(




)






)





;



</xsl:copy><php:thisJoinpoint xmlns:php="http://php.net/xsl">unset($thisJoinPoint);</php:thisJoinpoint><php:CHAR125 xmlns:php="http://php.net/xsl">}</php:CHAR125><php:T_STRING xmlns:php="http://php.net/xsl">__phpaspect
        <xsl:value-of select="php:function('Counter::getId')"/></php:T_STRING><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:T_VARIABLE xmlns:php="http://php.net/xsl">$thisJoinPoint</php:T_VARIABLE><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR59 xmlns:php="http://php.net/xsl">;</php:CHAR59><php:CHAR125 xmlns:php="http://php.net/xsl">}</php:CHAR125></xsl:if>
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
            <xsl:if test="not(php:method_modifiers//php:T_STATIC)">
                <xsl:value-of select="php:function('XPathFunctions::setProceed',
                                        concat('$this->__phpaspect', php:T_STRING, '(', php:parameter_list,')'))" />
            </xsl:if>
            <xsl:if test="php:method_modifiers//php:T_STATIC">
                <xsl:value-of select="php:function('XPathFunctions::setProceed',
                                        concat('self::__phpaspect', php:T_STRING, '(', php:parameter_list,')'))" />
            </xsl:if>
            <xsl:if test="not(php:function('XPathFunctions::getWeaved'))">
                    <php:T_VARIABLE>$__return_result</php:T_VARIABLE>
                    <php:T_EQUAL>=</php:T_EQUAL>
                    <xsl:if test="not(php:method_modifiers//php:T_STATIC)">
                        <xsl:copy>
                            <php:code>$this->__phpaspect<xsl:value-of select="php:T_STRING" />(</php:code>
                            <xsl:variable name="count" select="count(php:parameter_list/php:non_empty_parameter_list//php:T_VARIABLE)" />
                            <xsl:for-each select="php:parameter_list/php:non_empty_parameter_list//php:T_VARIABLE">
                                <xsl:copy-of select="." />
                                <xsl:if test="position()!=$count">
                                    <php:CHAR44>,</php:CHAR44>
                                </xsl:if>
                            </xsl:for-each>
                            <php:code>)</php:code>
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
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="(name()='php:class_statement' and not(//php:method_body/php:CHAR59) and&#10;                not(ancestor::php:unticked_class_declaration_statement[1]/php:interface_entry) &#10;                and (ancestor::php:unticked_class_declaration_statement[1]/php:T_STRING = 'Order' or php:function('XPathFunctions::isMethodName', ancestor::php:unticked_class_declaration_statement[1]/php:T_STRING, 'Order'))&#10;                and (php:T_STRING = 'addItem' or php:function('XPathFunctions::isMethodName', php:T_STRING, 'addItem')) &#10;                and (normalize-space(php:method_modifiers) = 'public'&#10;                 or  'public'='*')&#10;                )"><xsl:copy><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new ExecJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:parameter_list/php:non_empty_parameter_list//php:T_VARIABLE"><xsl:copy-of select="."/><php:CHAR44 xmlns:php="http://php.net/xsl">,</php:CHAR44></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), </php:thisJoinpoint><php:T_VARIABLE xmlns:php="http://php.net/xsl">$this</php:T_VARIABLE><php:thisJoinpoint xmlns:php="http://php.net/xsl">, '</php:thisJoinpoint><xsl:copy-of select="php:T_STRING"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">');</php:thisJoinpoint><xsl:variable name="advice_name" select="php:function('Counter::getId')"/><php:function xmlns:php="http://php.net/xsl">if(!function_exists('</php:function><php:T_STRING xmlns:php="http://php.net/xsl">__phpaspect<xsl:value-of select="$advice_name"/></php:T_STRING><php:function xmlns:php="http://php.net/xsl">')){ function</php:function><php:T_STRING xmlns:php="http://php.net/xsl"> __phpaspect
        <xsl:value-of select="$advice_name"/></php:T_STRING><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:T_VARIABLE xmlns:php="http://php.net/xsl">$thisJoinPoint</php:T_VARIABLE><php:CHAR44 xmlns:php="http://php.net/xsl">,</php:CHAR44><php:variable xmlns:php="http://php.net/xsl" id="id2399182">
<php:base_variable_with_function_calls id="id2399187">
<php:base_variable id="id2399192">
<php:reference_variable id="id2399197">
<php:compound_variable id="id2399201">
<php:T_VARIABLE id="id2399206">$quantity</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable><php:CHAR44 xmlns:php="http://php.net/xsl">,</php:CHAR44><php:variable xmlns:php="http://php.net/xsl" id="id2399230">
<php:base_variable_with_function_calls id="id2399234">
<php:base_variable id="id2399239">
<php:reference_variable id="id2399243">
<php:compound_variable id="id2399248">
<php:T_VARIABLE id="id2399252">$reference</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:copy>












printf
(









"%d %s added to the cart\n"




,





$quantity






,





$reference







)





;



</xsl:copy><php:CHAR125 xmlns:php="http://php.net/xsl">}}</php:CHAR125><php:T_STRING xmlns:php="http://php.net/xsl">__phpaspect
        <xsl:value-of select="php:function('Counter::getId')"/></php:T_STRING><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:T_VARIABLE xmlns:php="http://php.net/xsl">$thisJoinPoint</php:T_VARIABLE><php:CHAR44 xmlns:php="http://php.net/xsl">,</php:CHAR44><php:variable xmlns:php="http://php.net/xsl" id="id2399182">
<php:base_variable_with_function_calls id="id2399187">
<php:base_variable id="id2399192">
<php:reference_variable id="id2399197">
<php:compound_variable id="id2399201">
<php:T_VARIABLE id="id2399206">$quantity</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable><php:CHAR44 xmlns:php="http://php.net/xsl">,</php:CHAR44><php:variable xmlns:php="http://php.net/xsl" id="id2399230">
<php:base_variable_with_function_calls id="id2399234">
<php:base_variable id="id2399239">
<php:reference_variable id="id2399243">
<php:compound_variable id="id2399248">
<php:T_VARIABLE id="id2399252">$reference</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR59 xmlns:php="http://php.net/xsl">;</php:CHAR59><php:thisJoinpoint xmlns:php="http://php.net/xsl">unset($thisJoinPoint);</php:thisJoinpoint></xsl:copy></xsl:if>
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
                <xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
                <xsl:apply-templates select="*|text()"/>
            </xsl:copy>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
</xsl:stylesheet>