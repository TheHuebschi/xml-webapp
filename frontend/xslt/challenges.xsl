<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />
    <xsl:variable name="challenges" select="document('../../database/challenges.xml')/challenges"/>
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
                <link rel="stylesheet" href="../css/w3.css" />
                <link rel="icon" type="image/png" href="../images/favicon.png"/>
                <script src="../javascript/jquery-3.3.1.min.js"></script>
                <script src="../javascript/main.js" charset="utf-8"></script>
                <script src="../javascript/slider.js"></script>
                <script src="../javascript/sweetalert.min.js"></script>
                <script src="../javascript/ie-arrayfrom.js"></script>
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
                    <h4>Challenges</h4>
                    <a class="button button-primary" href="../xhtml/Challenges_application.xhtml">Challenge ausschreiben</a>
                    <a class="button button-primary" id="challenge-button" href="../xhtml/Challenges_addRegistration.xhtml">Bewerbung einreichen</a>
                    <table id="challengeTable" class="u-full-width">
                        <thead>
                            <tr>
                                <th>Titel</th>
                                <th>Firma</th>
                                <th>Beschreibung</th>
                                <th>Preise</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="$challenges/challenge">
                                <xsl:sort select="title" data-type="text" order="ascending"/>
                            </xsl:apply-templates>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>

    </xsl:template>
    <xsl:template match="challenge">
        <xsl:variable name="companyIdForName" select="@companyId"/>
        <tr>
            <td style="font-weight:bold;"><xsl:value-of select="title" /></td>
            <td><a href="../xhtml/companies_edit.xhtml?id={$companyIdForName}" style="color:black;text-decoration: underline;"><xsl:value-of select="$companies/company[@id=$companyIdForName]/name" /></a></td>
            <td><xsl:value-of select="description" /></td>
            <td><xsl:value-of select="price" /></td>
            <td>
                <a class="button button-primary" href="javascript:resetSlideIndex();showChallengePictures({@id});">
                    <img src="../images/gallery-icon.png" class="galleryIcon" />
                </a>
            </td>
            <td>
                <a class="button button-primary" href="../../export/index.php?id={@id}">
                    <img src="../images/printer-icon.png" class="printerIcon" />
                </a>
            </td>
        </tr>
        <tr class="hiddenPictures" id="challengePictures{@id}">
            <td colspan="6">
                <div class="w3-content w3-display-container" style="width: 80%;">
                    <div class="galleryDiv galleryDiv{@id}">
                        <xsl:apply-templates select="registrations" />
                        <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1,{@id})">&#10094;</button>
                        <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1, {@id})">&#10095;</button>
                    </div>
                </div>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="registration">
        <img src="{pictureLink}" alt="{pictureLink}" class="challengeIMG mySlides" />
        <div class="challengeIMGOverlay">
            <p><xsl:value-of select="date" /><br></br><br></br>
                <xsl:value-of select="title" /><br></br><br></br>
                <xsl:value-of select="description" />
            </p>
        </div>
    </xsl:template>


</xsl:stylesheet>