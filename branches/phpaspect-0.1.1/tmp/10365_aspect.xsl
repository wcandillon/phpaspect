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
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'false')"/><xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="name(.) = 'php:class_statement_list' and &#10;                                                    parent::php:unticked_class_declaration_statement/php:class_entry_type&#10;                                                     and php:function('XPathFunctions::hasIntroduction', parent::php:unticked_class_declaration_statement/php:*[2]/text(), parent::php:unticked_class_declaration_statement/descendant::php:fully_qualified_class_name/php:T_STRING, 'Foo,Bar')"><php:introduction xmlns:php="http://php.net/xsl" xml:space="preserve"><php:method_modifiers id="id2396618">
<php:non_empty_member_modifiers id="id2396623">
<php:member_modifier id="id2396627">
<php:T_PUBLIC id="id2396632">public</php:T_PUBLIC>
</php:member_modifier>
</php:non_empty_member_modifiers>
</php:method_modifiers><php:T_FUNCTION id="id2396641">function</php:T_FUNCTION><php:T_STRING id="id2396716">__clone</php:T_STRING><php:CHAR40 id="id2396721">(</php:CHAR40><php:parameter_list id="id2396727">
</php:parameter_list><php:CHAR41 id="id2397280">)</php:CHAR41><php:method_body id="id2397285">
<php:CHAR123 id="id2397290">{</php:CHAR123>
<php:inner_statement_list id="id2397295">
<php:inner_statement_list id="id2397300">
</php:inner_statement_list>
<php:ACTION2 id="id2397305">
</php:ACTION2>
<php:inner_statement id="id2397311">
<php:statement id="id2397315">
<php:unticked_statement id="id2397320">
<php:T_THROW id="id2397324">throw</php:T_THROW>
<php:expr id="id2397330">
<php:expr_without_variable id="id2397335">
<php:T_NEW id="id2397339">new</php:T_NEW>
<php:class_name_reference id="id2397345">
<php:T_STRING id="id2397349">Exception</php:T_STRING>
</php:class_name_reference>
<php:ACTION41 id="id2397356">
</php:ACTION41>
<php:ctor_arguments id="id2397362">
<php:CHAR40 id="id2397366">(</php:CHAR40>
<php:function_call_parameter_list id="id2397372">
<php:non_empty_function_call_parameter_list id="id2397376">
<php:non_empty_function_call_parameter_list id="id2397381">
<php:expr_without_variable id="id2397385">
<php:expr id="id2397390">
<php:expr_without_variable id="id2397394">
<php:expr id="id2397399">
<php:expr_without_variable id="id2397403">
<php:scalar id="id2397408">
<php:common_scalar id="id2397412">
<php:T_CONSTANT_ENCAPSED_STRING id="id2397417">'Clone of '</php:T_CONSTANT_ENCAPSED_STRING>
</php:common_scalar>
</php:scalar>
</php:expr_without_variable>
</php:expr>
<php:CHAR46 id="id2397428">.</php:CHAR46>
<php:expr id="id2397433">
<php:r_variable id="id2397438">
<php:variable id="id2397442">
<php:base_variable_with_function_calls id="id2397447">
<php:function_call id="id2397451">
<php:T_STRING id="id2397456">get_class</php:T_STRING>
<php:CHAR40 id="id2397462">(</php:CHAR40>
<php:ACTION49 id="id2397467">
</php:ACTION49>
<php:function_call_parameter_list id="id2397473">
<php:non_empty_function_call_parameter_list id="id2397477">
<php:variable id="id2397481">
<php:base_variable_with_function_calls id="id2397486">
<php:base_variable id="id2397490">
<php:reference_variable id="id2397495">
<php:compound_variable id="id2397500">
<php:T_VARIABLE id="id2397504">$this</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:non_empty_function_call_parameter_list>
</php:function_call_parameter_list>
<php:CHAR41 id="id2397517">)</php:CHAR41>
</php:function_call>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR46 id="id2397530">.</php:CHAR46>
<php:expr id="id2397536">
<php:expr_without_variable id="id2397540">
<php:scalar id="id2397545">
<php:common_scalar id="id2397549">
<php:T_CONSTANT_ENCAPSED_STRING id="id2397554">' is not  allowed.'</php:T_CONSTANT_ENCAPSED_STRING>
</php:common_scalar>
</php:scalar>
</php:expr_without_variable>
</php:expr>
</php:expr_without_variable>
</php:non_empty_function_call_parameter_list>
<php:CHAR44 id="id2397566">,</php:CHAR44>
<php:expr_without_variable id="id2397572">
<php:scalar id="id2397576">
<php:T_STRING id="id2397581">E_USER_ERROR</php:T_STRING>
</php:scalar>
</php:expr_without_variable>
</php:non_empty_function_call_parameter_list>
</php:function_call_parameter_list>
<php:CHAR41 id="id2397591">)</php:CHAR41>
</php:ctor_arguments>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2397600">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:CHAR125 id="id2397610">}</php:CHAR125>
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
<xsl:if xmlns:xsl="http://www.w3.org/1999/XSL/Transform" test="(php:expr_without_variable/php:T_NEW&#10;                        and (php:function('XPathFunctions::isType', php:expr_without_variable/php:class_name_reference/php:T_STRING, 'Foo')&#10;                                or php:expr_without_variable/php:class_name_reference/php:dynamic_class_name_reference&#10;                                or false())&#10;                        and ((normalize-space('*') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = ''))) or (php:expr_without_variable/php:T_NEW&#10;                        and (php:function('XPathFunctions::isType', php:expr_without_variable/php:class_name_reference/php:T_STRING, 'Bar')&#10;                                or php:expr_without_variable/php:class_name_reference/php:dynamic_class_name_reference&#10;                                or false())&#10;                        and ((normalize-space('*') = '*') or (count(descendant::php:non_empty_function_call_parameter_list) = '')))"><php:T_IF xmlns:php="http://php.net/xsl">if</php:T_IF><php:CHAR40 xmlns:php="http://php.net/xsl">(</php:CHAR40><php:expr xmlns:php="http://php.net/xsl"><xsl:value-of select="concat(php:function('Test::isNewJpt', .//php:class_name_reference, 'Foo'),' || ',php:function('Test::isNewJpt', .//php:class_name_reference, 'Bar'), '')"/></php:expr><php:CHAR41 xmlns:php="http://php.net/xsl">)</php:CHAR41><php:CHAR123 xmlns:php="http://php.net/xsl">{</php:CHAR123><xsl:if test="php:expr_without_variable/php:T_NEW"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new NewJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), "</php:thisJoinpoint><xsl:copy-of select="php:expr_without_variable/php:class_name_reference"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">");</php:thisJoinpoint></xsl:if><xsl:if test="php:T_OBJECT_OPERATOR"><php:thisJoinpoint xmlns:php="http://php.net/xsl">$thisJoinPoint = new CallJoinPoint('', __LINE__, __FILE__, array(</php:thisJoinpoint><xsl:for-each select="descendant::php:function_call_parameter_list/php:non_empty_function_call_parameter_list"><xsl:copy-of select="."/></xsl:for-each><php:thisJoinpoint xmlns:php="http://php.net/xsl">), </php:thisJoinpoint><xsl:copy-of select="php:T_VARIABLE[2]"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">, '</php:thisJoinpoint><xsl:copy-of select="php:object_property"/><php:thisJoinpoint xmlns:php="http://php.net/xsl">');</php:thisJoinpoint></xsl:if><php:inner_statement_list xmlns:php="http://php.net/xsl" id="id2394100">
<php:inner_statement_list id="id2394104">
<php:inner_statement_list id="id2394108">
<php:inner_statement_list id="id2394112">
</php:inner_statement_list>
<php:ACTION2 id="id2394118">
</php:ACTION2>
<php:inner_statement id="id2394123">
<php:statement id="id2394127">
<php:unticked_statement id="id2394131">
<php:expr id="id2394135">
<php:expr_without_variable id="id2394139">
<php:variable id="id2394144">
<php:base_variable_with_function_calls id="id2394978">
<php:base_variable id="id2394981">
<php:reference_variable id="id2393866">
<php:compound_variable id="id2395056">
<php:T_VARIABLE id="id2393878">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
<php:CHAR61 id="id2395072">=</php:CHAR61>
<php:expr id="id2395077">
<php:r_variable id="id2395081">
<php:variable id="id2395086">
<php:base_variable_with_function_calls id="id2395090">
<php:base_variable id="id2395094">
<php:reference_variable id="id2395098">
<php:compound_variable id="id2394428">
<php:T_VARIABLE id="id2394435">$thisJoinPoint</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2394445">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2394450">
</php:ACTION57>
<php:object_property id="id2394455">
<php:object_dim_list id="id2394459">
<php:variable_name id="id2394464">
<php:T_STRING id="id2394468">getClassName</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2394476">
</php:ACTION58>
<php:method_or_not id="id2394481">
<php:CHAR40 id="id2394485">(</php:CHAR40>
<php:ACTION60 id="id2394491">
</php:ACTION60>
<php:function_call_parameter_list id="id2394496">
</php:function_call_parameter_list>
<php:CHAR41 id="id2394501">)</php:CHAR41>
</php:method_or_not>
<php:variable_properties id="id2394507">
</php:variable_properties>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2394518">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:ACTION2 id="id2394527">
</php:ACTION2>
<php:inner_statement id="id2394532">
<php:statement id="id2394537">
<php:unticked_statement id="id2394541">
<php:T_IF id="id2394545">if</php:T_IF>
<php:CHAR40 id="id2394550">(</php:CHAR40>
<php:expr id="id2394555">
<php:expr_without_variable id="id2394559">
<php:CHAR33 id="id2394564">!</php:CHAR33>
<php:expr id="id2394569">
<php:expr_without_variable id="id2394573">
<php:internal_functions_in_yacc id="id2394577">
<php:T_ISSET id="id2394581">isset</php:T_ISSET>
<php:CHAR40 id="id2394586">(</php:CHAR40>
<php:isset_variables id="id2394592">
<php:variable id="id2394596">
<php:base_variable_with_function_calls id="id2394601">
<php:base_variable id="id2394605">
<php:reference_variable id="id2394609">
<php:compound_variable id="id2394614">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2394628">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2394634">
</php:ACTION57>
<php:object_property id="id2394639">
<php:object_dim_list id="id2394644">
<php:object_dim_list id="id2394648">
<php:variable_name id="id2394653">
<php:T_STRING id="id2394658">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2394665">[</php:CHAR91>
<php:dim_offset id="id2394671">
<php:expr id="id2394676">
<php:r_variable id="id2394680">
<php:variable id="id2394685">
<php:base_variable_with_function_calls id="id2394689">
<php:base_variable id="id2394694">
<php:reference_variable id="id2394698">
<php:compound_variable id="id2395985">
<php:T_VARIABLE id="id2395989">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2396003">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2396010">
</php:ACTION58>
<php:method_or_not id="id2396016">
</php:method_or_not>
<php:variable_properties id="id2396021">
</php:variable_properties>
</php:variable>
</php:isset_variables>
<php:CHAR41 id="id2396028">)</php:CHAR41>
</php:internal_functions_in_yacc>
</php:expr_without_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR41 id="id2396039">)</php:CHAR41>
<php:ACTION3 id="id2396044">
</php:ACTION3>
<php:statement id="id2396050">
<php:unticked_statement id="id2396054">
<php:CHAR123 id="id2396059">{</php:CHAR123>
<php:inner_statement_list id="id2396064">
<php:inner_statement_list id="id2396069">
</php:inner_statement_list>
<php:ACTION2 id="id2396074">
</php:ACTION2>
<php:inner_statement id="id2396080">
<php:statement id="id2396084">
<php:unticked_statement id="id2396088">
<php:expr id="id2396092">
<php:expr_without_variable id="id2396096">
<php:variable id="id2396101">
<php:base_variable_with_function_calls id="id2396105">
<php:base_variable id="id2396110">
<php:reference_variable id="id2396114">
<php:compound_variable id="id2396119">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2396133">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2396139">
</php:ACTION57>
<php:object_property id="id2396144">
<php:object_dim_list id="id2396149">
<php:object_dim_list id="id2396153">
<php:variable_name id="id2396158">
<php:T_STRING id="id2396162">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2396170">[</php:CHAR91>
<php:dim_offset id="id2396175">
<php:expr id="id2396180">
<php:r_variable id="id2396184">
<php:variable id="id2396189">
<php:base_variable_with_function_calls id="id2396193">
<php:base_variable id="id2396198">
<php:reference_variable id="id2396202">
<php:compound_variable id="id2396207">
<php:T_VARIABLE id="id2396211">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2396225">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2396233">
</php:ACTION58>
<php:method_or_not id="id2396239">
</php:method_or_not>
<php:variable_properties id="id2396244">
</php:variable_properties>
</php:variable>
<php:CHAR61 id="id2396251">=</php:CHAR61>
<php:expr id="id2396324">
<php:r_variable id="id2396328">
<php:variable id="id2396333">
<php:base_variable_with_function_calls id="id2396337">
<xsl:copy-of select="php:function('XPathFunctions::getProceed')"/>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:expr_without_variable>
</php:expr>
<php:CHAR59 id="id2396382">;</php:CHAR59>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:CHAR125 id="id2396392">}</php:CHAR125>
</php:unticked_statement>
</php:statement>
<php:ACTION4 id="id2396400">
</php:ACTION4>
<php:elseif_list id="id2396405">
</php:elseif_list>
<php:else_single id="id2396411">
</php:else_single>
</php:unticked_statement>
</php:statement>
</php:inner_statement>
</php:inner_statement_list>
<php:ACTION2 id="id2396421">
</php:ACTION2>
<php:inner_statement id="id2396426">
<php:statement id="id2396431">
<php:unticked_statement id="id2396436">
<php:T_VARIABLE>$__return_result</php:T_VARIABLE><php:CHAR61>=</php:CHAR61>
<php:variable id="id2396446">
<php:base_variable_with_function_calls id="id2396450">
<php:base_variable id="id2396455">
<php:reference_variable id="id2396459">
<php:compound_variable id="id2396464">
<php:T_VARIABLE>$GLOBALS['__phpaspect']['Singleton']</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
<php:T_OBJECT_OPERATOR id="id2396478">-&gt;</php:T_OBJECT_OPERATOR>
<php:ACTION57 id="id2396484">
</php:ACTION57>
<php:object_property id="id2396489">
<php:object_dim_list id="id2396494">
<php:object_dim_list id="id2396498">
<php:variable_name id="id2396503">
<php:T_STRING id="id2396508">instances</php:T_STRING>
</php:variable_name>
</php:object_dim_list>
<php:CHAR91 id="id2396515">[</php:CHAR91>
<php:dim_offset id="id2396521">
<php:expr id="id2396525">
<php:r_variable id="id2396530">
<php:variable id="id2396534">
<php:base_variable_with_function_calls id="id2396539">
<php:base_variable id="id2396543">
<php:reference_variable id="id2396548">
<php:compound_variable id="id2396552">
<php:T_VARIABLE id="id2396557">$className</php:T_VARIABLE>
</php:compound_variable>
</php:reference_variable>
</php:base_variable>
</php:base_variable_with_function_calls>
</php:variable>
</php:r_variable>
</php:expr>
</php:dim_offset>
<php:CHAR93 id="id2396571">]</php:CHAR93>
</php:object_dim_list>
</php:object_property>
<php:ACTION58 id="id2396579">
</php:ACTION58>
<php:method_or_not id="id2396584">
</php:method_or_not>
<php:variable_properties id="id2396590">
</php:variable_properties>
</php:variable>
<php:CHAR59 id="id2396596">;</php:CHAR59>
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