<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />
    
    <!-- variables to access the database XML files -->
    <xsl:variable name="companies" select="document('../database/companies.xml')/companies"/>

    <xsl:template match="/">
        <html>
            <body>
                <h3>Companies</h3>
                <xsl:apply-templates select="$companies" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="company">
        <a>
            <xsl:value-of select="name" />
        </a>
    </xsl:template>

</xsl:stylesheet>