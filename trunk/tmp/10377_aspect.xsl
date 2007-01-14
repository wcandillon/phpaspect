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
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'Foo,Bar')"><php:introduction xmlns:php="http://php.net/xsl" xml:space="preserve"><php:method_modifiers id="id2396544">
<php:non_empty_member_modifiers id="id2396548">
<php:member_modifier id="id2396553">
<php:T_PUBLIC id="id2396557">public</php:T_PUBLIC>
</php:member_modifier>
</php:non_empty_member_modifiers>
</php:method_modifiers><php:T_FUNCTION id="id2396566">function</php:T_FUNCTION><php:T_STRING id="id2396641">__clone</php:T_STRING><php:CHAR40 id="id2396647">(</php:CHAR40><php:parameter_list id="id2396652">
</php:parameter_list><php:CHAR41 id="id2396658">)</php:CHAR41><php:method_body id="id2396663">
<php:CHAR123 id="id2396667">{</php:CHAR123>
<php:inner_statement_list id="id2394015">
<php:inner_statement_list id="id2394019">
</php:inner_statement_list>
<php:ACTION2 id="id2394025">
</php:ACTION2>
<php:inner_statement id="id2394030">
<php:statement id="id2394035">
<php:unticked_statement id="id2394040">
<php:T_THROW id="id2394044">throw</php:T_THROW>
<php:expr id="id2394050">
<php:expr_without_variable id="id2394054">
<php:T_NEW id="id2394059">new</php:T_NEW>
<php:class_name_reference id="id2394064">
<php:T_STRING id="id2394069">Exception</php:T_STRING>
</php:class_name_reference>
<php:ACTION41 id="id2394076">
</php:ACTION41>
<php:ctor_arguments id="id2394081">
<php:CHAR40 id="id2394086">(</php:CHAR40>
<php:function_call_parameter_list id="id2394091">
<php:non_empty_function_call_parameter_list id="id2394096">
<php:non_empty_function_call_parameter_list id="id2394100">
<php:expr_without_variable id="id2394105">
<php:expr id="id2394109">
<php:expr_without_variable id="id2394114">
<php:expr id="id2394118">
<php:expr_without_variable id="id2394123">
<php:scalar id="id2394128">
<php:common_scalar id="id2394132">
<php:T_CONSTANT_ENCAPSED_STRING id="id2394137">'Clone of '</php:T_CONSTANT_ENCAPSED_STRING>
</php:common_scalar>
</php:scalar>
</php:expr_without_variable>
</php:expr>
<php:CHAR46 id="id2394147">.</php:CHAR46>
<php:expr id="id2394153">
<php:r_variable id="id2394157">
<php:variable id="id2394162">
<php:base_variable_with_function_calls id="id2394166">
<php:function_call id="id2394171">
<php:T_STRING id="id2394176">get_class</php:T_STRING>
<php:CHAR40 id="id2394181">(</php:CHAR40>
<php:ACTION49 id="id2394187">
</php:ACTION49>
<php:function_call_parameter_list id="id2394192">
<php:non_empty_function_call_parameter_list id="id2394196">
<php:variable id="id2394201">
<php:base_variable_with_function_calls id="id2394206">
<php:base_variable id="id2394210">
<php:reference_variable id="id2394215">
<php:compound_variable id="id2394219">
<php:T_VARIABLE id="id2394224">$this</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:non_empty_function_call_parameter_list>
</php:function_call_parameter_list>
<php:CHAR41 id="id2394237">)</php:CHAR41>
</php:function_call>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR46 id="id2394250">.</php:CHAR46>
<php:expr id="id2394255">
<php:expr_without_variable id="id2394260">
<php:scalar id="id2394264">
<php:common_scalar id="id2394269">
<php:T_CONSTANT_ENCAPSED_STRING id="id2394274">' is not  allowed.'</php:T_CONSTANT_ENCAPSED_STRING>
</php:common_scalar>
</php:scalar>
</php:expr_without_variable>
</php:expr>
</php:expr_without_variable>
</php:non_empty_function_call_parameter_list>
<php:CHAR44 id="id2394286">,</php:CHAR44>
<php:expr_without_variable id="id2394291">
<php:scalar id="id2394296">
<php:T_STRING id="id2394300">E_USER_ERROR</php:T_STRING>
</php:scalar>
</php:expr_without_variable>
</php:non_empty_function_call_parameter_list>
</php:function_call_parameter_list>
<php:CHAR41 id="id2394310">)</php:CHAR41>
</php:ctor_arguments>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2394319">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:CHAR125 id="id2394329">}</php:CHAR125>
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
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="(php:expr_without_variable/php:T_NEW&#10;                        and (php:function('XPathFunctions::isType', php:expr_without_variable/php:class_name_reference/php:T_STRING, 'Foo')&#10;                                or php:expr_without_variable/php:class_name_reference/php:dynamic_class_name_reference&#10;                                or false())&#10;                        and ((normalize-space('*') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = ''))) or (php:expr_without_variable/php:T_NEW&#10;                        and (php:function('XPathFunctions::isType', php:expr_without_variable/php:class_name_reference/php:T_STRING, 'Bar')&#10;                                or php:expr_without_variable/php:class_name_reference/php:dynamic_class_name_reference&#10;                                or false())&#10;                        and ((normalize-space('*') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = '')))"><php:T_IF xmlns:php="http://php.net/xsl">if</php:T_IF><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:expr xmlns:php="http://php.net/xsl"><xsl:value-of select="concat(php:function('Test::isNewJpt', .//php:class_name_reference, 'Foo'),' || ',php:function('Test::isNewJpt', .//php:class_name_reference, 'Bar'), '')"/></php:expr><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:if test="php:expr_without_variable/php:T_NEW"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), "</php:thisJoinpoint><xsl:copy-of select="php:expr_without_variable/php:class_name_reference"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">");</php:thisJoinpoint></xsl:if><xsl:if test="php:T_OBJECT_OPERATOR"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), </php:thisJoinpoint><xsl:copy-of select="php:T_VARIABLE[2]"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">, '</php:thisJoinpoint><xsl:copy-of select="php:object_property"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">');</php:thisJoinpoint></xsl:if><php:inner_statement_list xmlns:php="http://php.net/xsl" id="id2393892">
<php:inner_statement_list id="id2393896">
<php:inner_statement_list id="id2393900">
<php:inner_statement_list id="id2393904">
</php:inner_statement_list>
<php:ACTION2 id="id2393909">
</php:ACTION2>
<php:inner_statement id="id2393914">
<php:statement id="id2393918">
<php:unticked_statement id="id2393923">
<php:expr id="id2393927">
<php:expr_without_variable id="id2393931">
<php:variable id="id2393935">
<php:base_variable_with_function_calls id="id2393939">
<php:base_variable id="id2393943">
<php:reference_variable id="id2393947">
<php:compound_variable id="id2393952">
<php:T_VARIABLE id="id2397920">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
<php:CHAR61 id="id2393968">=</php:CHAR61>
<php:expr id="id2393973">
<php:r_variable id="id2393977">
<php:variable id="id2393981">
<php:base_variable_with_function_calls id="id2393986">
<php:base_variable id="id2393990">
<php:reference_variable id="id2393994">
<php:compound_variable id="id2393998">
<php:T_VARIABLE id="id2397645">$thisJoinPoint</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2397654">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2397660">
</php:ACTION57>
<php:object_property id="id2397665">
<php:object_dim_list id="id2397669">
<php:variable_name id="id2397673">
<php:T_STRING id="id2397677">getClassName</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2397686">
</php:ACTION58>
<php:method_or_not id="id2397691">
<php:CHAR40 id="id2397695">(</php:CHAR40>
<php:ACTION60 id="id2397700">
</php:ACTION60>
<php:function_call_parameter_list id="id2397705">
</php:function_call_parameter_list>
<php:CHAR41 id="id2397710">)</php:CHAR41>
</php:method_or_not>
<php:variable_properties id="id2397717">
</php:variable_properties>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2397727">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:ACTION2 id="id2397737">
</php:ACTION2>
<php:inner_statement id="id2397742">
<php:statement id="id2397746">
<php:unticked_statement id="id2397750">
<php:T_IF id="id2397754">if</php:T_IF>
<php:CHAR40 id="id2397760">(</php:CHAR40>
<php:expr id="id2397765">
<php:expr_without_variable id="id2397769">
<php:CHAR33 id="id2397773">!</php:CHAR33>
<php:expr id="id2397778">
<php:expr_without_variable id="id2397782">
<php:internal_functions_in_yacc id="id2397786">
<php:T_ISSET id="id2397791">isset</php:T_ISSET>
<php:CHAR40 id="id2397796">(</php:CHAR40>
<php:isset_variables id="id2397801">
<php:variable id="id2396145">
<php:base_variable_with_function_calls id="id2396149">
<php:base_variable id="id2396153">
<php:reference_variable id="id2396157">
<php:compound_variable id="id2396161">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2396176">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2396181">
</php:ACTION57>
<php:object_property id="id2396187">
<php:object_dim_list id="id2396191">
<php:object_dim_list id="id2396196">
<php:variable_name id="id2396200">
<php:T_STRING id="id2396205">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2396213">[</php:CHAR91>
<php:dim_offset id="id2396219">
<php:expr id="id2396223">
<php:r_variable id="id2396228">
<php:variable id="id2396232">
<php:base_variable_with_function_calls id="id2396237">
<php:base_variable id="id2396241">
<php:reference_variable id="id2396245">
<php:compound_variable id="id2396249">
<php:T_VARIABLE id="id2396253">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2396267">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2396274">
</php:ACTION58>
<php:method_or_not id="id2396280">
</php:method_or_not>
<php:variable_properties id="id2396285">
</php:variable_properties>
</php:variable>
</php:isset_variables>
<php:CHAR41 id="id2396292">)</php:CHAR41>
</php:internal_functions_in_yacc>
</php:expr_without_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR41 id="id2396303">)</php:CHAR41>
<php:ACTION3 id="id2396308">
</php:ACTION3>
<php:statement id="id2396314">
<php:unticked_statement id="id2396318">
<php:CHAR123 id="id2396323">{</php:CHAR123>
<php:inner_statement_list id="id2396328">
<php:inner_statement_list id="id2396333">
</php:inner_statement_list>
<php:ACTION2 id="id2396338">
</php:ACTION2>
<php:inner_statement id="id2396344">
<php:statement id="id2396348">
<php:unticked_statement id="id2396352">
<php:expr id="id2396356">
<php:expr_without_variable id="id2396360">
<php:variable id="id2396365">
<php:base_variable_with_function_calls id="id2396369">
<php:base_variable id="id2396374">
<php:reference_variable id="id2396378">
<php:compound_variable id="id2396383">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2395051">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2395057">
</php:ACTION57>
<php:object_property id="id2395062">
<php:object_dim_list id="id2395067">
<php:object_dim_list id="id2395071">
<php:variable_name id="id2395076">
<php:T_STRING id="id2395080">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2395088">[</php:CHAR91>
<php:dim_offset id="id2395093">
<php:expr id="id2395098">
<php:r_variable id="id2395102">
<php:variable id="id2395107">
<php:base_variable_with_function_calls id="id2395111">
<php:base_variable id="id2395116">
<php:reference_variable id="id2395120">
<php:compound_variable id="id2395125">
<php:T_VARIABLE id="id2395129">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2395143">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2395151">
</php:ACTION58>
<php:method_or_not id="id2395157">
</php:method_or_not>
<php:variable_properties id="id2395162">
</php:variable_properties>
</php:variable>
<php:CHAR61 id="id2395169">=</php:CHAR61>
<php:expr id="id2395175">
<php:r_variable id="id2395179">
<php:variable id="id2395184">
<php:base_variable_with_function_calls id="id2395188">
<xsl:copy-of select="php:function('XPathFunctions::getProceed')"/>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2395233">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:CHAR125 id="id2395243">}</php:CHAR125>
</php:unticked_statement>
</php:statement>
<php:ACTION4 id="id2395251">
</php:ACTION4>
<php:elseif_list id="id2395256">
</php:elseif_list>
<php:else_single id="id2395262">
</php:else_single>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:ACTION2 id="id2395272">
</php:ACTION2>
<php:inner_statement id="id2395277">
<php:statement id="id2395282">
<php:unticked_statement id="id2395286">
<php:T_VARIABLE>$__return_result</php:T_VARIABLE><php:CHAR61>=</php:CHAR61>
<php:variable id="id2395297">
<php:base_variable_with_function_calls id="id2395301">
<php:base_variable id="id2395306">
<php:reference_variable id="id2395310">
<php:compound_variable id="id2395315">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2396404">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2396409">
</php:ACTION57>
<php:object_property id="id2396415">
<php:object_dim_list id="id2396419">
<php:object_dim_list id="id2396424">
<php:variable_name id="id2396428">
<php:T_STRING id="id2396433">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2396441">[</php:CHAR91>
<php:dim_offset id="id2396446">
<php:expr id="id2396451">
<php:r_variable id="id2396455">
<php:variable id="id2396459">
<php:base_variable_with_function_calls id="id2396464">
<php:base_variable id="id2396468">
<php:reference_variable id="id2396473">
<php:compound_variable id="id2396478">
<php:T_VARIABLE id="id2396482">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2396496">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2396504">
</php:ACTION58>
<php:method_or_not id="id2396510">
</php:method_or_not>
<php:variable_properties id="id2396515">
</php:variable_properties>
</php:variable>
<php:CHAR59 id="id2396522">;</php:CHAR59>
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