<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->

    
    <xsl:template match="tei:TEI">
                     <div class="row">
                         <div class="col1-meta">
                             <h4>About the manuscript page:</h4>
                             <h5>Source Description:</h5>
                             <xsl:value-of select="//tei:sourceDesc"/>
                             <h5>Licence:</h5>
                             <xsl:value-of select="//tei:licence"/> <!-- You can change the way the metadata is visualised as well-->
                         </div>
                         <div class="col2-meta">
                            <ul> 
                                <li>
                                    Total number of modifications: 
                                    <xsl:value-of select="count(//tei:del|//tei:add)" /> <!-- Counts all the add and del elements, and puts it in a list item -->
                                </li>
                                <li>
                                    Number of Modification by Mary Shelley:
                                    <xsl:value-of select="count(//*[(@hand='#MWS')])"/>
                                </li>
                                <li>
                                    Number of Modification by Percy Shelley:
                                    <xsl:value-of select="count(//*[(@hand='#PBS')])"/>
                                </li>
                            </ul>
                        </div>
                     </div>
        <hr/>
    </xsl:template>
    

</xsl:stylesheet>
