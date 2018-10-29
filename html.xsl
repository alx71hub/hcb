<?xml version='1.0'?>
<xsl:stylesheet
  version='1.0' 
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform' >

<xsl:output method='html' indent='yes'/>



<xsl:template match='bnf'>
<html>
  <head>
    <title>Hyperlinked C++ BNF Grammar</title>
    <style type='text/css'>
      body
      {
        font-family: Verdana, Arial;
        font-size: 18;
      }

      h1
      {
        text-align: center;
        font-size: 32;
      }

      .Credits
      {
        text-align: center;
      }
      
      .Section
      { 
        font-size: 18;
        text-align: right; 
        background-color: #FFA448; 
        color: black; 
      }

      tr.RuleRow
      { 
      }

      td.RuleColumn
      {
        font-size: 16 
      }

      .TerminalSymbol
      { 
        font-family: Lucida, Courier; 
        font-size: 16
      }

      .NonTerminalSymbol
      {
        font-size: 16
      }

      .Description
      {
        font-size: 16
      }

      .Note
      {
        font-size: 14; 
        color: red
      }

      A:link { color: blue; }
      A:visited { color: blue; }
      A:hover { color: #FFA448; }
      A:active { color: red; }

      A.NonTerminalSymbol:link { color: green; }
      A.NonTerminalSymbol:visited { color: green; }
      A.NonTerminalSymbol:hover { color: blue; }
      A.NonTerminalSymbol:active { color: red; }

    </style>
  </head>
  <body>
    <a name='TOP'><h1>Hyperlinked C++ BNF Grammar</h1></a>
    <div class='Credits'> 
	    <p>By <a href='https://alx71hub.github.io/hcb/'>Alessio Marchetti</a></p>
      <p>Version <xsl:value-of select='@version'/></p>
      <p>Last updated: <xsl:value-of select='@update'/></p>
    </div>
    <hr/>

    <h2>Purpose of this document</h2>

    <p>If you are a C++ developer then you sometimes need to have a look at the C++ BNF grammar. At least I do. </p>
    <p>But reading a set of BNF rules is difficult since you have to jump from one rule to the next one, maybe pages away from it. </p>
    <p>With this document I tried to make it easier to navigate among the BNF rules of the C++ language grammar; you can find here a hyperlinked graph whose nodes are the BNF productions of the C++ language grammar. </p>
    <p>If you find errors or inconsistencies, please <a href='http://hcb.alessio.marchetti.name/'>drop me a note</a>.</p>

    <h3>The BNF non-terminal for a C++ translation unit (translation-unit) is defined <a href='#basic.link'>here</a>.</h3>
    <h3>The BNF non-terminal for a C++ preprocessing file (preprocessing-file) is defined <a href='#cpp'>here</a>.</h3>

    <hr/>

    <h1>BNF Grammar Rules</h1>

    <table><xsl:apply-templates/></table>

    <hr/>

    <p><a href='#TOP'>Back to top</a></p>

  </body>
</html>
</xsl:template>



<xsl:template match='section'>
<tr class='Section'>
  <td>&#xA0;</td>
  <td>
    <h2>
      <a>
        <xsl:attribute name='name'><xsl:value-of select='@id'/></xsl:attribute>
        <xsl:value-of select='@id'/>
      </a>
    </h2>
  </td>
</tr>
<xsl:apply-templates/>
</xsl:template>



<xsl:template match='rule'>
<tr class='RuleRow'>
  <td class='RuleColumn'>
    <a>
      <xsl:attribute name='name'><xsl:value-of select='syntax'/></xsl:attribute>
      <b><xsl:value-of select='syntax'/><xsl:text>:</xsl:text></b>
    </a>
  </td>
  <td>
    <xsl:choose>
      <xsl:when test='@issue'>
        <span class='Note'>
          <xsl:text>See </xsl:text>
          <a>
            <xsl:attribute name='href'>http://www.open-std.org/jtc1/sc22/wg21/docs/cwg_toc.html</xsl:attribute>
            <xsl:text>C++ Standard Core Language Issue</xsl:text>
          </a>
          <xsl:text> n. </xsl:text>
          <xsl:value-of select='@issue'/>
        </span>
      </xsl:when>
      <xsl:when test='@note and not(@issue)'>
        <span class='Note'><xsl:text>&#xA0;----</xsl:text><xsl:value-of select='@note'/></span>
      </xsl:when>
      <xsl:otherwise>
        &#xA0;
      </xsl:otherwise>
    </xsl:choose>
  </td>
</tr>
<xsl:apply-templates/>
</xsl:template>



<xsl:template match='syntax'/>



<xsl:template match='alternative'>
<tr>
  <td>&#xA0;</td>
  <td>
    <xsl:apply-templates/>
    <xsl:if test='@issue'>
      <span class='Note'>
        <xsl:text>See </xsl:text>
        <a>
          <xsl:attribute name='href'>http://www.open-std.org/jtc1/sc22/wg21/docs/cwg_toc.html</xsl:attribute>
          <xsl:text>C++ Standard Core Language Issue</xsl:text>
        </a>
        <xsl:text> n. </xsl:text>
        <xsl:value-of select='@issue'/>
      </span>
    </xsl:if>
    <xsl:if test="@note and not(@issue)">
      <span class='Note'><xsl:text>&#xA0;&#xA0;&#xA0;&#xA0;</xsl:text><xsl:value-of select='@note'/></span>
    </xsl:if>
  </td>
</tr>
</xsl:template>



<xsl:template match='terminal'>
<xsl:choose>
  <xsl:when test="@sentence='true'">
    <span class='Description'><i><xsl:value-of select='.'/></i></span>
  </xsl:when>
  <xsl:otherwise>
    <span class='TerminalSymbol'><b><xsl:value-of select='.'/></b></span>
    <xsl:if test="@optional='true'">
      <sub>opt</sub>
    </xsl:if>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>



<xsl:template match='non-terminal'>
  <a class='NonTerminalSymbol'>
    <xsl:attribute name='href'>#<xsl:value-of select='.'/></xsl:attribute>
    <xsl:value-of select='.'/>
  </a>
  <xsl:if test="@optional='true'">
    <sub>opt</sub>
  </xsl:if>
</xsl:template>



</xsl:stylesheet>

