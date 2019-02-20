<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />

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
                    Hello, <?php echo 'php'; ?>.
                    <h4>Hi Communities. Hi Companies. Hi everyone.</h4>
                    <h5>Hi Communities.</h5>
                    <p>Egal ob WG, Schrebbergarten oder Fan-Club – hier kann sich jede Community anmelden. Das Beste daran: Durch ausgeschriebene Challenges könnt ihr an kreativ werden! Ihr schiesst euer bestes Foto zur Challenge, beschreibt kurz warum genau eure Community gewinnen soll und schon könnt ihr tolle Preise gewinnen!</p>
                    <p>Einfach <a href="./communities_edit.xhtml">hier</a> registrieren und sofort <a href="./challenges.xhtml">teilnehmen</a>!</p>
                    <h5>Hi Companies.</h5>
                    <p>Ihr wollt eure Produkte und/oder Dienstleistungen einer Communities näherbringen? Dann seid ihr hier goldrichtig! Schreibt coole Challenges aus und erhaltet innerhalb kurzer Zeit die ersten Registrierungen. Ihr werdet schlussendlich aus einer Vielzahl von Einreichungen die Gewinner-Community küren. Es warten tolle Bilder, emotionale Begründungen und zeitnahe Feedbacks auf euch!</p>
                    <p>Direkt <a href="./companies_edit.xhtml">hier</a> registrieren und gleich Challgenes <a href="./challenges.xhtml">ausschreiben</a>!</p>
                    <h5>Hi everyone.</h5>
                    <p>Du willst einfach ein bisschen rumstöbern und mal schauen was es so gibt? Kein Problem! Klicke dich einfach durch, schau' dir die teilnehmenden Communities und Companies an oder gönn' dir die kreativen Anmeldungen mit all ihren interessanten Bildern.</p>
                </div>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>
