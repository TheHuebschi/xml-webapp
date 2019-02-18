<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />

    <!-- variables to access the database XML files -->
    <xsl:variable name="companies" select="document('../../database/communities.xml')/communities"/>

    <xsl:template match="/">
        <html>
            <body>
                <h3>Communities</h3>
                <p>Communities.xsl</p>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>