<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />

    <!-- variables to access the database XML files -->
    <xsl:variable name="challenges" select="document('../../database/challenges.xml')/challenges"/>

    <xsl:template match="/">
    
        <h3>Home</h3>
        <p>Willkommen auf meiner Webseite! Diese Seite dient als Testat-Aufgabe des Moduls WEBTEC. Klicke dich ruhig durch den One-Pager, es gibt spannenden Inhalt zu entdecken ...</p>


    </xsl:template>

</xsl:stylesheet>