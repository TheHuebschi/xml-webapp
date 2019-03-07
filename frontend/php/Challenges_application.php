<?php 
    $id = htmlspecialchars($_POST["id"]);
    $companyId = htmlspecialchars($_POST["companyId"]);
    $title = htmlspecialchars($_POST["title"]);
    $price = htmlspecialchars($_POST["price"]);
    $description = htmlspecialchars($_POST["description"]);
    
    
    $xml = simplexml_load_file('../../database/challenges.xml');

    if (empty($id)) {
        $id = getNextFreeId($xml);
        addChallenge($xml, $id, $companyId, $title, $price, $description);
    }
    else {
        editChallenge($xml, $id, $companyId, $title, $price, $description);
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

    function addChallenge($xml, $id,$companyId, $title, $price, $description) {
        $challenge = $xml->addChild('challenge');
        $challenge->addAttribute('id', $id);
        $challenge->addAttribute('companyId', $companyId);
        $challenge->addChild('title', $title);
        $challenge->addChild('description', $description);
        $challenge->addChild('price', $price);
        $challenge->addChild('registrations');

        
    }

    function editChallenge($xml, $id, $companyId, $title, $price, $description) {
        $xPathQuery = '//challenge[@id="' . "$id" . '" ]'  ;
        $challenge = $xml->xpath($xPathQuery)[0];

        $challenge->title = $title;
        $challenge->price = $price;
        $challenge->description = $description;
      
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