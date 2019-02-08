<!doctype html>
<html lang="en-CH">
<head>
<title>Export challenge...</title>

</head>
<body>
	<?php
    $id = $_GET['id'];
    if (! isset($_GET['id']) || ! preg_match('/^\d{1,9}$/', $id)) {
        $redirect = "/error.html?id=" . $id;
        header("HTTP/1.1 301 Moved Permanently");
        header("Location: $redirect");
    }
    $id = $_GET['id'];
    $pdf_file_path = $_SERVER['DOCUMENT_ROOT'] . '/export/cache/Challenge_' . $id . '.pdf';
    $fo_file_path = $_SERVER['DOCUMENT_ROOT'] . '/export/cache/Challenge_' . $id . '.fo';
    $xml_file_path = $_SERVER['DOCUMENT_ROOT'] . '/database/challenges.xml';
    $xsl_file_path = $_SERVER['DOCUMENT_ROOT'] . '/export/export_challenge.xsl';
    
    require 'xslt.php';
    
    require 'api_call.php';
    
    header("Content-Description: File Transfer");
    header("Content-Type: application/octet-stream");
    header("Content-Disposition: attachment; filename=" . basename($pdf_file_path));
    while (ob_get_level()) {
        ob_end_clean();
    }
    readfile($pdf_file_path);
    exit();
    ?>
</body>
</html>

