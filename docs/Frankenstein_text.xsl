<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->
    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:body">
        <div class="transcription-box">
            <div class="row">
                <div class="col-3"><br/><br/><br/><br/><br/>
                    <xsl:for-each select="//tei:add[@place = 'marginleft']">
                        <span class="{substring-after(@hand, '#')} margin-edit">
                            <xsl:apply-templates/><br/>
                        </span>
                    </xsl:for-each>
                </div>
                <div class="col-9">
                    <div class="transcription">
                        <xsl:apply-templates select="//tei:div[not(ancestor::tei:add[@place='marginleft'])]"/>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:add[@place = 'marginleft']">
        <span class="marginAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:add[@place='marginleft'] | tei:del[@place='marginleft']">
        <span class="{substring-after(@hand, '#')} margin-edit">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
   
   <!--It became optimal to separate each attribute rather than element, due to overriding complications-->
    <xsl:template match="*[@type='crossedOut']">
        <span class="{substring-after(@hand, '#')} strikethrough">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="*[@type='overwritten']">
        <span class="{substring-after(@hand, '#')} strikethrough">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="*[@place='overwritten']">
        <span class="{substring-after(@hand, '#')} supralinear">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
       
    <xsl:template match="*[@place='supralinear']">
        <span class="{substring-after(@hand, '#')} supralinear">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="*[@rendition='underlined']">
        <span class="{substring-after(@hand, '#')} underlined">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="*[@rend='underlined']">
        <span class="{substring-after(@hand, '#')} underlined">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
        
    <!--Circled Page Number:-->
    <xsl:template match="tei:metamark[@function='pagenumber']">
        <span class="circled-page-number">
            <xsl:value-of select="num/hi"/>
            <xsl:apply-templates/>
        </span>
    </xsl:template>        
        
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>    
    
    <xsl:template match="tei:div">
        <div class="#MWS">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
            
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:p/tei:list">
        <ul class="indent-list">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:p/tei:list/tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>
