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
            <meta charset="utf-8" />
            <title>Community Challenge</title>
            <meta name="author" content="XML Project Team #3" />
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link href="https://fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" href="../css/normalize.css" />
            <link rel="stylesheet" href="../css/skeleton.css" />
            <link rel="stylesheet" href="../css/master.css" />
            <link rel="icon" type="image/png" href="../images/favicon.png"/>
            <script src="../javascript/jquery-3.3.1.min.js"></script>
            <script src="../javascript/sweetalert.min.js"></script>
            <script src="../javascript/main.js"></script>
            <script src="../javascript/challenges_add.js"></script>


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

                    </div>
                </div>
            </div>

            <div class="container" id="content">
                <h4>Challenge hinzufügen</h4>

                <form name="newChallengeform"  onsubmit="return editChallenge()" method="post">

                    <div class="row">
                        <label for="companyId">Firma:</label>
                        <select name="companyID" id="companyId">
                            <xsl:apply-templates select="$companies/company" />
                        </select>
                    </div>

                    <div class="row">
                        <label for="TitleInput">Titel:</label>
                        <input class="u-full-width" type="text" placeholder="WG Challenge..." id="TitleInput" />
                    </div>

                    <div class="row">
                            <label for="priceInput">Preis:</label>
                            <input class="u-full-width" type="text" placeholder="CHF 2000.- Gutschein"   id="priceInput" />
                        </div>


                    <label for="descriptionInput">Beschreibung:</label>
                    <textarea class="u-full-width" type="text" placeholder="Challenge Rules.." id="descriptionInput"></textarea>

                    <a class="button" href="./challenges.xhtml">Abbrechen</a>
                    <input class="button-primary" type="submit" value="Speichern" />

                </form>
            </div>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="company">
        <option value="{@id}"><xsl:value-of select="name" /></option>
    </xsl:template>

</xsl:stylesheet>