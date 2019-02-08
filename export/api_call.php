
    <?php

    // load the FOP client.
    require_once 'fop_service_client.php';

    // locate the source FO file.
    // $foFile = $_SERVER['DOCUMENT_ROOT'].'/export/cache/Challenge_'.$_GET['id'].'.fo';
    // $foFile = 'svg.fo';

    // create an instance of the FOP client and perform service request.
    $serviceClient = new FOPServiceClient();
    $pdfFile = $serviceClient->processFile($fo_file_path);

    // generate HTML output and show results of service request
    // echo sprintf('<p>Successfully rendered FO File<br><strong><a href="%s">%s</a></strong></p>', $fofile, $fofile);
    // echo sprintf('<p>Generated PDF:<br><strong><a href="%s">download PDF</a></strong></p>', $pdffile);

    ?>
