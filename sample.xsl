<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes"/>
  
  <!-- THIS LINE REMOVES DASHES AS TEXT NODES -->
  <xsl:template match="text()[normalize-space()='-']"/>
  
  <xsl:template match="/body/div/p/s">
    <html>
      <head>
        <link rel="stylesheet" href="styles.css"/>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="s">
    <s>
      <xsl:apply-templates select="w"/>
    </s>
  </xsl:template>
  
  <xsl:template match="w">
    <span class="tooltip">
      <a href="{a/@href}" target="_blank">
        <xsl:value-of select="."/>
      </a>
      <span class="tooltiptext">
        lemma:
        <a href="{@ref}" target="_blank">
          <xsl:value-of select="@lemma"/>
        </a>
        <br/>
        pos: 
        <xsl:value-of select="@pos"/>
      </span>
    </span>
  </xsl:template>

  <!-- Prevent tooltips on w within head -->
  <xsl:template match="head//w">
    <xsl:value-of select="."/>
    <xsl:if test="following-sibling::*[1][not(self::pc)]">
      <xsl:text> </xsl:text>
    </xsl:if>
  </xsl:template>

  
  <xsl:template match="div[@type='section']/head">
    <h3><xsl:apply-templates select="@*|node()"/></h3>
  </xsl:template>
  
  <xsl:template match="div[@type='subsection']/head">
    <h4><xsl:apply-templates select="@*|node()"/></h4>
  </xsl:template>
  
</xsl:stylesheet>
