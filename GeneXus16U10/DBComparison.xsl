<?xml version='1.0'?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gxcs="urn:CompareSchemas">

  <xsl:output method="xml"/>

  <xsl:template match="/">
    <Metadata>
      <Tables>
        <xsl:for-each select="/Metadata/Tables/Table">
          <Table>
            <Name>
              <xsl:value-of select="Name"/>
            </Name>
            <Attributes>
              <xsl:for-each select="Attributes/Attribute">
                <Attribute>
                  <Name>
                    <xsl:value-of select="Name"/>
                  </Name>
                  <Type>
                    <xsl:value-of select="Type"/>
                  </Type>
                  <Length>
                    <xsl:value-of select="Length"/>
                  </Length>
                  <Decimals>
                    <xsl:value-of select="Decimals"/>
                  </Decimals>
                  <AllowNulls>
                    <xsl:value-of select="AllowNulls"/>
                  </AllowNulls>
                  <Autonumber>
                    <xsl:value-of select="Autonumber"/>
                  </Autonumber>
                  <IsPrimaryKey>
                    <xsl:value-of select="IsPrimaryKey"/>
                  </IsPrimaryKey>
                </Attribute>
              </xsl:for-each>
            </Attributes>
            <ForeignKeys>
              <xsl:for-each select="ForeignKeys/ForeignKey">
                <ForeignKey>
                  <FKTable>
                    <xsl:value-of select="FKTable"/>
                  </FKTable>
                  <Relations>
                    <xsl:for-each select="Relations/Relation">
                      <Relation>
                        <Attribute>
                          <xsl:value-of select="Attribute"/>
                        </Attribute>
                        <FKAttribute>
                          <xsl:value-of select="FKAttribute"/>
                        </FKAttribute>
                      </Relation>
                    </xsl:for-each>
                  </Relations>
                </ForeignKey>
              </xsl:for-each>
            </ForeignKeys>
            <Indexes>
              <xsl:for-each select="Indexes/Index">
                <Index>
                  <xsl:variable name="Name" select="Name"/>
                  <Name><xsl:value-of select="gxcs:GetComparisonKBIndexName($Name)"/></Name>
						      <Unique><xsl:value-of select="Unique"/></Unique>
						      <Attributes>
						        <xsl:for-each select="Attributes/Attribute">
  							      <Attribute>
	  							      <Name><xsl:value-of select="Name"/></Name>
		  						      <Order><xsl:value-of select="Order"/></Order>
			  				      </Attribute>
				  		      </xsl:for-each>
					  	    </Attributes>
					      </Index>
				      </xsl:for-each>
				    </Indexes>
			    </Table>
		    </xsl:for-each>
	    </Tables>
    </Metadata>
  </xsl:template>

</xsl:stylesheet>