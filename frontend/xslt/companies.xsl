<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />

     <xsl:variable name="companies" select="document('../../database/companies.xml')/companies"/>

    <xsl:template match="/">
    
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>Community Challenge</title>
                <meta name="author" content="XML Project Team #3"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link href="https://fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="../css/normalize.css"/>
                <link rel="stylesheet" href="../css/skeleton.css"/>
                <link rel="stylesheet" href="../css/master.css"/>
                <link rel="icon" type="image/png" href="../images/favicon.png"/>
                <script src="../javascript/jquery-3.3.1.min.js"></script>
                <script src="../javascript/main.js" charset="utf-8"></script>
            </head>
            <body>
                <!-- Header -->
                <div id="headerBar">
                <div class="container">
                    <div class="row">
                    <div class="column">
                        <h1 id="title">Community Challenge</h1>
                    </div>
                    </div>
                </div>
                </div>

                <!-- Naviagtion -->
                <div id="navigationBar">
                    <div class="container">
                        <div class="topnav" id="myTopnav">
                        <a id="menu" onclick="collapseNavigation()">Menu</a>
                        <a href="./home.xhtml">Home</a>
                        <a href="./challenges.xhtml">Challenges</a>
                        <a href="./communities.xhtml">Communities</a>
                        <a href="./companies.xhtml">Companies</a>
                        <a href="javascript:void(0);" class="icon" onclick="collapseNavigation()">&#9776;</a>
                        </div>
                    </div>
                </div>

                <!-- Content -->
                <div class="container" id="content">
                    <h4>Companies</h4>
                    <table id="companiesTable" class="u-full-width">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Id</th>
                                <th>Standort</th>
                                <th>Anz. Mitarbeiter</th>
                                <th>Beschreibung</th>
                                <th>Bearbeiten</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="$companies" />
                        </tbody>
                    </table>
                    <a class="button button-primary" href="./companies_edit.xhtml">Company hinzufügen</a>
                </div>
            </body>
        </html>

    </xsl:template>
    <xsl:template match="company">
        <tr>
            <td><xsl:value-of select="name" /></td>
            <td><xsl:value-of select="@id" /></td>
            <td><xsl:value-of select="location" /></td>
            <td><xsl:value-of select="numberOfEmployees" /></td>
            <td><xsl:value-of select="description" /></td>
            <td><a class="button button-primary" href="#">Bearbeiten</a></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>