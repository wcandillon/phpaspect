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
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'Foo,Bar')"><php:introduction xmlns:php="http://php.net/xsl" xml:space="preserve"><php:method_modifiers id="id2395097">
<php:non_empty_member_modifiers id="id2395101">
<php:member_modifier id="id2395106">
<php:T_PUBLIC id="id2395110">public</php:T_PUBLIC>
</php:member_modifier>
</php:non_empty_member_modifiers>
</php:method_modifiers><php:T_FUNCTION id="id2395119">function</php:T_FUNCTION><php:T_STRING id="id2395194">__clone</php:T_STRING><php:CHAR40 id="id2395200">(</php:CHAR40><php:parameter_list id="id2395206">
</php:parameter_list><php:CHAR41 id="id2395211">)</php:CHAR41><php:method_body id="id2395216">
<php:CHAR123 id="id2395220">{</php:CHAR123>
<php:inner_statement_list id="id2395226">
<php:inner_statement_list id="id2395231">
</php:inner_statement_list>
<php:ACTION2 id="id2395236">
</php:ACTION2>
<php:inner_statement id="id2395242">
<php:statement id="id2395246">
<php:unticked_statement id="id2395251">
<php:T_THROW id="id2395255">throw</php:T_THROW>
<php:expr id="id2395261">
<php:expr_without_variable id="id2395266">
<php:T_NEW id="id2395270">new</php:T_NEW>
<php:class_name_reference id="id2395276">
<php:T_STRING id="id2395280">Exception</php:T_STRING>
</php:class_name_reference>
<php:ACTION41 id="id2395287">
</php:ACTION41>
<php:ctor_arguments id="id2395292">
<php:CHAR40 id="id2395297">(</php:CHAR40>
<php:function_call_parameter_list id="id2395303">
<php:non_empty_function_call_parameter_list id="id2395307">
<php:non_empty_function_call_parameter_list id="id2395312">
<php:expr_without_variable id="id2395316">
<php:expr id="id2395321">
<php:expr_without_variable id="id2394118">
<php:expr id="id2394122">
<php:expr_without_variable id="id2394127">
<php:scalar id="id2394131">
<php:common_scalar id="id2394136">
<php:T_CONSTANT_ENCAPSED_STRING id="id2394141">'Clone of '</php:T_CONSTANT_ENCAPSED_STRING>
</php:common_scalar>
</php:scalar>
</php:expr_without_variable>
</php:expr>
<php:CHAR46 id="id2394152">.</php:CHAR46>
<php:expr id="id2394157">
<php:r_variable id="id2394162">
<php:variable id="id2394166">
<php:base_variable_with_function_calls id="id2394171">
<php:function_call id="id2394175">
<php:T_STRING id="id2394180">get_class</php:T_STRING>
<php:CHAR40 id="id2394185">(</php:CHAR40>
<php:ACTION49 id="id2394191">
</php:ACTION49>
<php:function_call_parameter_list id="id2394197">
<php:non_empty_function_call_parameter_list id="id2394201">
<php:variable id="id2394205">
<php:base_variable_with_function_calls id="id2394210">
<php:base_variable id="id2394214">
<php:reference_variable id="id2394219">
<php:compound_variable id="id2394223">
<php:T_VARIABLE id="id2394228">$this</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:non_empty_function_call_parameter_list>
</php:function_call_parameter_list>
<php:CHAR41 id="id2394241">)</php:CHAR41>
</php:function_call>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR46 id="id2394254">.</php:CHAR46>
<php:expr id="id2394260">
<php:expr_without_variable id="id2394264">
<php:scalar id="id2394269">
<php:common_scalar id="id2394273">
<php:T_CONSTANT_ENCAPSED_STRING id="id2394278">' is not  allowed.'</php:T_CONSTANT_ENCAPSED_STRING>
</php:common_scalar>
</php:scalar>
</php:expr_without_variable>
</php:expr>
</php:expr_without_variable>
</php:non_empty_function_call_parameter_list>
<php:CHAR44 id="id2394290">,</php:CHAR44>
<php:expr_without_variable id="id2394295">
<php:scalar id="id2394300">
<php:T_STRING id="id2394304">E_USER_ERROR</php:T_STRING>
</php:scalar>
</php:expr_without_variable>
</php:non_empty_function_call_parameter_list>
</php:function_call_parameter_list>
<php:CHAR41 id="id2394315">)</php:CHAR41>
</php:ctor_arguments>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2394324">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:CHAR125 id="id2394333">}</php:CHAR125>
</php:method_body></php:introduction></xsl:if>
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
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="(php:expr_without_variable/php:T_NEW&#10;                        and (php:function('XPathFunctions::isType', php:expr_without_variable/php:class_name_reference/php:T_STRING, 'Foo')&#10;                                or php:expr_without_variable/php:class_name_reference/php:dynamic_class_name_reference&#10;                                or false())&#10;                        and ((normalize-space('*') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = ''))) or (php:expr_without_variable/php:T_NEW&#10;                        and (php:function('XPathFunctions::isType', php:expr_without_variable/php:class_name_reference/php:T_STRING, 'Bar')&#10;                                or php:expr_without_variable/php:class_name_reference/php:dynamic_class_name_reference&#10;                                or false())&#10;                        and ((normalize-space('*') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = '')))"><php:T_IF xmlns:php="http://php.net/xsl">if</php:T_IF><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:expr xmlns:php="http://php.net/xsl"><xsl:value-of select="concat(php:function('Test::isNewJpt', .//php:class_name_reference, 'Foo'),' || ',php:function('Test::isNewJpt', .//php:class_name_reference, 'Bar'), '')"/></php:expr><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:if test="php:expr_without_variable/php:T_NEW"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), "</php:thisJoinpoint><xsl:copy-of select="php:expr_without_variable/php:class_name_reference"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">");</php:thisJoinpoint></xsl:if><xsl:if test="php:T_OBJECT_OPERATOR"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), </php:thisJoinpoint><xsl:copy-of select="php:T_VARIABLE[2]"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">, '</php:thisJoinpoint><xsl:copy-of select="php:object_property"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">');</php:thisJoinpoint></xsl:if><php:inner_statement_list xmlns:php="http://php.net/xsl" id="id2394830">
<php:inner_statement_list id="id2394834">
<php:inner_statement_list id="id2394839">
<php:inner_statement_list id="id2394843">
</php:inner_statement_list>
<php:ACTION2 id="id2394848">
</php:ACTION2>
<php:inner_statement id="id2394853">
<php:statement id="id2394857">
<php:unticked_statement id="id2394861">
<php:expr id="id2394866">
<php:expr_without_variable id="id2394870">
<php:variable id="id2394874">
<php:base_variable_with_function_calls id="id2394878">
<php:base_variable id="id2394882">
<php:reference_variable id="id2394886">
<php:compound_variable id="id2394890">
<php:T_VARIABLE id="id2397922">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
<php:CHAR61 id="id2394907">=</php:CHAR61>
<php:expr id="id2394912">
<php:r_variable id="id2394916">
<php:variable id="id2394920">
<php:base_variable_with_function_calls id="id2394924">
<php:base_variable id="id2394928">
<php:reference_variable id="id2394933">
<php:compound_variable id="id2394937">
<php:T_VARIABLE id="id2397649">$thisJoinPoint</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2397657">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2397662">
</php:ACTION57>
<php:object_property id="id2397668">
<php:object_dim_list id="id2397672">
<php:variable_name id="id2397676">
<php:T_STRING id="id2397680">getClassName</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2397688">
</php:ACTION58>
<php:method_or_not id="id2397694">
<php:CHAR40 id="id2397698">(</php:CHAR40>
<php:ACTION60 id="id2397703">
</php:ACTION60>
<php:function_call_parameter_list id="id2397708">
</php:function_call_parameter_list>
<php:CHAR41 id="id2397713">)</php:CHAR41>
</php:method_or_not>
<php:variable_properties id="id2397720">
</php:variable_properties>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2397730">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:ACTION2 id="id2397740">
</php:ACTION2>
<php:inner_statement id="id2397745">
<php:statement id="id2397749">
<php:unticked_statement id="id2397753">
<php:T_IF id="id2397757">if</php:T_IF>
<php:CHAR40 id="id2397762">(</php:CHAR40>
<php:expr id="id2397768">
<php:expr_without_variable id="id2397772">
<php:CHAR33 id="id2397776">!</php:CHAR33>
<php:expr id="id2397781">
<php:expr_without_variable id="id2397785">
<php:internal_functions_in_yacc id="id2397789">
<php:T_ISSET id="id2397794">isset</php:T_ISSET>
<php:CHAR40 id="id2397799">(</php:CHAR40>
<php:isset_variables id="id2397804">
<php:variable id="id2396148">
<php:base_variable_with_function_calls id="id2396152">
<php:base_variable id="id2396156">
<php:reference_variable id="id2396160">
<php:compound_variable id="id2396164">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2396179">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2396184">
</php:ACTION57>
<php:object_property id="id2396190">
<php:object_dim_list id="id2396195">
<php:object_dim_list id="id2396199">
<php:variable_name id="id2396204">
<php:T_STRING id="id2396208">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2396216">[</php:CHAR91>
<php:dim_offset id="id2396222">
<php:expr id="id2396226">
<php:r_variable id="id2396231">
<php:variable id="id2396236">
<php:base_variable_with_function_calls id="id2396240">
<php:base_variable id="id2396244">
<php:reference_variable id="id2396248">
<php:compound_variable id="id2396252">
<php:T_VARIABLE id="id2396257">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2396270">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2396278">
</php:ACTION58>
<php:method_or_not id="id2396283">
</php:method_or_not>
<php:variable_properties id="id2396288">
</php:variable_properties>
</php:variable>
</php:isset_variables>
<php:CHAR41 id="id2396295">)</php:CHAR41>
</php:internal_functions_in_yacc>
</php:expr_without_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR41 id="id2396306">)</php:CHAR41>
<php:ACTION3 id="id2396312">
</php:ACTION3>
<php:statement id="id2396317">
<php:unticked_statement id="id2396321">
<php:CHAR123 id="id2396326">{</php:CHAR123>
<php:inner_statement_list id="id2396331">
<php:inner_statement_list id="id2396336">
</php:inner_statement_list>
<php:ACTION2 id="id2396342">
</php:ACTION2>
<php:inner_statement id="id2396347">
<php:statement id="id2396351">
<php:unticked_statement id="id2396355">
<php:expr id="id2396360">
<php:expr_without_variable id="id2396364">
<php:variable id="id2396368">
<php:base_variable_with_function_calls id="id2396372">
<php:base_variable id="id2396377">
<php:reference_variable id="id2396381">
<php:compound_variable id="id2396386">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2396402">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2396407">
</php:ACTION57>
<php:object_property id="id2396413">
<php:object_dim_list id="id2396417">
<php:object_dim_list id="id2396421">
<php:variable_name id="id2396426">
<php:T_STRING id="id2396430">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2396438">[</php:CHAR91>
<php:dim_offset id="id2396444">
<php:expr id="id2396448">
<php:r_variable id="id2396453">
<php:variable id="id2396457">
<php:base_variable_with_function_calls id="id2396462">
<php:base_variable id="id2396466">
<php:reference_variable id="id2396471">
<php:compound_variable id="id2396475">
<php:T_VARIABLE id="id2396480">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2396494">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2396502">
</php:ACTION58>
<php:method_or_not id="id2396507">
</php:method_or_not>
<php:variable_properties id="id2396513">
</php:variable_properties>
</php:variable>
<php:CHAR61 id="id2396519">=</php:CHAR61>
<php:expr id="id2396525">
<php:r_variable id="id2396530">
<php:variable id="id2396534">
<php:base_variable_with_function_calls id="id2396538">
<xsl:copy-of select="php:function('XPathFunctions::getProceed')"/>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2396583">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:CHAR125 id="id2396593">}</php:CHAR125>
</php:unticked_statement>
</php:statement>
<php:ACTION4 id="id2396601">
</php:ACTION4>
<php:elseif_list id="id2396607">
</php:elseif_list>
<php:else_single id="id2396612">
</php:else_single>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:ACTION2 id="id2396622">
</php:ACTION2>
<php:inner_statement id="id2396628">
<php:statement id="id2396632">
<php:unticked_statement id="id2396637">
<php:T_VARIABLE>$__return_result</php:T_VARIABLE><php:CHAR61>=</php:CHAR61>
<php:variable id="id2396647">
<php:base_variable_with_function_calls id="id2396652">
<php:base_variable id="id2396656">
<php:reference_variable id="id2396661">
<php:compound_variable id="id2396665">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2394957">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2394962">
</php:ACTION57>
<php:object_property id="id2394968">
<php:object_dim_list id="id2394972">
<php:object_dim_list id="id2394977">
<php:variable_name id="id2394982">
<php:T_STRING id="id2394986">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2394994">[</php:CHAR91>
<php:dim_offset id="id2394999">
<php:expr id="id2395004">
<php:r_variable id="id2395008">
<php:variable id="id2395013">
<php:base_variable_with_function_calls id="id2395017">
<php:base_variable id="id2395022">
<php:reference_variable id="id2395026">
<php:compound_variable id="id2395031">
<php:T_VARIABLE id="id2395035">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2395049">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2395057">
</php:ACTION58>
<php:method_or_not id="id2395063">
</php:method_or_not>
<php:variable_properties id="id2395068">
</php:variable_properties>
</php:variable>
<php:CHAR59 id="id2395075">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list><php:thisJoinpoint xmlns:php="http://php.net/xsl">unset($thisJoinPoint);</php:thisJoinpoint><xsl:value-of select="php:function('XPathFunctions::setWeaved', true())"/><php:CHAR125 xmlns:php="http://php.net/xsl">}</php:CHAR125><php:T_ELSE xmlns:php="http://php.net/xsl">else</php:T_ELSE><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:copy-of select="."/><php:T_VARIABLE xmlns:php="http://php.net/xsl">$__return_result</php:T_VARIABLE><php:CHAR61 xmlns:php="http://php.net/xsl"> = </php:CHAR61><xsl:copy-of select="./php:T_VARIABLE[1]"/><php:CHAR59 xmlns:php="http://php.net/xsl">;</php:CHAR59><php:CHAR125 xmlns:php="http://php.net/xsl">}</php:CHAR125></xsl:if>
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