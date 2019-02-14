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
    
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <title>Community Challenge Website</title>
            <meta name="author" content="XML Project Team #3">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
            <link rel="stylesheet" href="../css/normalize.css">
            <link rel="stylesheet" href="../css/skeleton.css">
            <link rel="stylesheet" href="../css/master.css">
            <link id="themeStyle" rel="stylesheet" href="../css/themes/grey.css">
            <link rel="icon" type="image/png" href="images/favicon.png">
            <script src="../javascript/jquery-3.3.1.min.js"></script>
            <script src="../javascript/main.js" charset="utf-8"></script>
        </head>
        <body>
            <!-- Header -->
            <div id="headerBar">
            <div class="container">
                <div class="row">
                <div class="column">
                    <h1>Community Challenge Website</h1>
                </div>
                </div>
            </div>
            </div>

            <!-- Naviagtion -->
            <div id="navigationBar">
            <div class="container">
                <div class="topnav" id="myTopnav">
                <a id="menu" onclick="collapseNavigation()">Menu</a>
                <a href="#home" onclick="changePageContent('home')">Home</a>
                <a href="#canvas" onclick="changePageContent('canvas')">Canvas</a>
                <a href="#formular" onclick="changePageContent('formular')">Formular</a>
                <a href="#about" onclick="changePageContent('about')">About</a>
                <a href="javascript:void(0);" class="icon" onclick="collapseNavigation()">&#9776;</a>
                </div>
            </div>
            </div>

            <!-- Content -->
            <div class="container" id="content"></div>
        </body>
        </html>


    </xsl:template>

</xsl:stylesheet>