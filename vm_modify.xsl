<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
    version="1.0"
    xmlns=""
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

  <xsl:output method="xml" 
	      encoding="utf-8" 
	      indent="yes" />

  <!--Identity template, 
      provides default behavior that copies all content into the output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/domain/name" >
    <name><xsl:value-of select="$name" /></name>
  </xsl:template>

  <xsl:template match="/domain/uuid" >
    <uuid><xsl:value-of select="$uuid" /></uuid>
  </xsl:template>

  <xsl:template match="/domain/devices/disk[@device='disk']/source" >
    <source><xsl:attribute name="dev" ><xsl:value-of select="$device-path" /></xsl:attribute></source>
  </xsl:template>

  <xsl:template match="/domain/devices/disk[@device='disk']/driver" >
    <driver>
      <xsl:copy-of select="@*" />
      <xsl:attribute name="type" >qcow2</xsl:attribute>
    </driver>
  </xsl:template>  

  <xsl:template match="/domain/devices/interface[@type='network']/mac" >
    <mac><xsl:attribute name="address" ><xsl:value-of select="$mac-address" /></xsl:attribute></mac>
  </xsl:template>

</xsl:stylesheet>
