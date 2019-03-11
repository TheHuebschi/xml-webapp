<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />
    <xsl:variable name="communities" select="document('../../database/communities.xml')/communities"/>
    <xsl:variable name="challenges" select="document('../../database/challenges.xml')/challenges"/>

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
                <link rel="icon" type="image/png" href="../images/favicon.png" />
                <script src="../javascript/jquery-3.3.1.min.js"></script>
                <script src="../javascript/sweetalert.min.js"></script>
                <script src="../javascript/main.js"></script>
                <script src="../javascript/registrations_add.js"></script>
                

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
                    <h4>Bewerbung Einreichen</h4>

                    <form name="newRegistration" onsubmit="return addRegistration()"  method="post" enctype="multipart/form-data">

                        <div class="row">
                            <label for="challengeId">Challenge:</label>
                            <select name="challengeId" id="challengeId">
                                <xsl:apply-templates select="$challenges/challenge" />
                            </select>
                        </div>

                        <div class="row">
                            <label for="communityId">Community:</label>
                            <select name="communityId" id="communityId">
                                <xsl:apply-templates select="$communities/community" />
                            </select>
                        </div>

                        <div class="row">
                            <label for="titleInput">Titel:</label>
                            <input class="u-full-width" type="text"  id="titleInput" />
                        </div>   
        
                        <div class="row">
                            <label>Bild:</label>
                            <input class="button" type="file" name="picInput"  id="picInput" /> 
                        </div>

                        
                        <div class="row">
                            <label for="descriptionInput">Beschreibung</label>
                            <textarea class="u-full-width" placeholder="Was macht uns speziell?" id="descriptionInput"></textarea>
                        </div> 


                        <a class="button" href="./challenges.xhtml">Abbrechen</a>
                        <input class="button-primary" type="submit" value="Speichern" name="submit" />

                    </form>
                </div>
            </body>

        </html>
    </xsl:template>
    <xsl:template match="community">
        <option value="{@id}"><xsl:value-of select="name" /></option>
    </xsl:template>
    <xsl:template match="challenge">
        <option value="{@id}"><xsl:value-of select="title" /></option>
    </xsl:template>
</xsl:stylesheet>