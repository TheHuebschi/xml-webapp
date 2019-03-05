<?php 
    $id = htmlspecialchars($_POST["id"]);
    $name = htmlspecialchars($_POST["name"]);
    $email = htmlspecialchars($_POST["email"]);
    $location = htmlspecialchars($_POST["location"]);
    $size = htmlspecialchars($_POST["size"]);
    $description = htmlspecialchars($_POST["description"]);
    
    $xml = simplexml_load_file('../../database/communities.xml');

    if (empty($id)) {
        $id = getNextFreeId($xml);
        addCommunity($xml, $id, $name, $email, $location, $size, $description);
    }
    else {
        editCommunity($xml, $id, $name, $email, $location, $size, $description);
    }
    
    persistXML('../../database/communities_temp.xml', $xml);
    
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

    function addCommunity($xml, $id, $name, $email, $location, $size, $description) {
        $community = $xml->addChild('community');
        $community->addAttribute('id', $id);
        $community->addChild('name', $name);
        $community->addChild('description', $description);
        $community->addChild('size', $size);
        $community->addChild('location', $location);
        $community->addChild('email', $email);
    }

    function editCommunity($xml, $id, $name, $email, $location, $size, $description) {
        $xPathQuery = '//community[@id="' . "$id" . '"]';
        $community = $xml->xpath($xPathQuery)[0];

        $community->name = $name;
        $community->email = $email;
        $community->location = $location;
        $community->size = $size;
        $community->description = $description;
    }

    function persistXML($path, $xml) {
        file_put_contents($path, $xml->asXML());
    }

    function validateXML() {
        $data = file_get_contents('../../database/communities_temp.xml');
        $xml = new DOMDocument();
        $xml->loadXML($data);

        libxml_use_internal_errors(true);
        
        $xsd = '../../database/communities.xsd';
        $result = $xml->schemaValidate($xsd);
        
        if (!$result) {
            return false;
        }
        else {
            return true;
        }
    }

    function replaceXML() {
        unlink('../../database/communities.xml');
        rename('../../database/communities_temp.xml', '../../database/communities.xml');
    }

    function removeTempXML() {
        unlink('../../database/communities_temp.xml');
    }
?>