<?php 
    $date = htmlspecialchars($_POST["date"]);
    $title = htmlspecialchars($_POST["title"]);
    $picture = htmlspecialchars($_POST["picture"]);
    $description = htmlspecialchars($_POST["description"]);
 
    
    $xml = simplexml_load_file('../../database/challenges.xml');

    if (empty($id)) {
        $id = getNextFreeId($xml);
        addregistration($xml, $date, $title, $picture, $description);
    }
    else {
        editregistration($xml, $date, $title, $picture, $description);
    }
    
    persistXML('../../database/challenges_temp.xml', $xml);
    
    if (validateXML()) {
        replaceXML();
        removeTempXML();
        http_response_code(200);
    } else {
        removeTempXML();
        http_response_code(500);
    }

    function getNextFreeId($xml) {
        $xPathQuery = '//@id';
        $results = $xml->xpath($xPathQuery);
        rsort($results);
        
        return $results[count($results)-1] + 1;
    }

    function addregistration($xml, $date, $title, $picture, $description) {
        $community = $xml->addChild('registration');
       // $community->addAttribute('id', $id);
        $community->addChild('date', $date);
        $community->addChild('title', $title);
        $community->addChild('description', $description);
        $community->addChild('pictureLink', $pictureLink);
    }

    function editregistration($xml, $date, $title, $picture, $description) {
        $xPathQuery = '//challenge[@id="' . "$id" . '"]';
        $community = $xml->xpath($xPathQuery)[0];

        $community->date = $date;
        $community->title = $title;
        $community->picture = $picture;
        $community->description = $description;
       
    }

    function persistXML($path, $xml) {
        file_put_contents($path, $xml->asXML());
    }

    function validateXML() {
        $data = file_get_contents('../../database/challenges_temp.xml');
        $xml = new DOMDocument();
        $xml->loadXML($data);

        libxml_use_internal_errors(true);
        
        $xsd = '../../database/challenges.xsd';
        $result = $xml->schemaValidate($xsd);
        
        if (!$result) {
            return false;
        }
        else {
            return true;
        }
    }

    function replaceXML() {
        unlink('../../database/challenges.xml');
        rename('../../database/challenges_temp.xml', '../../database/challenges.xml');
    }

    function removeTempXML() {
        unlink('../../database/challenges_temp.xml');
    }
?>