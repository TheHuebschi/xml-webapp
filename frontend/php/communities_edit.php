<?php 
    $id = htmlspecialchars($_POST["id"]);
    $name = htmlspecialchars($_POST["name"]);
    $email = htmlspecialchars($_POST["email"]);
    $location = htmlspecialchars($_POST["location"]);
    $size = htmlspecialchars($_POST["size"]);
    $description = htmlspecialchars($_POST["description"]);
    echo "Id: $id, Name: $name, Email: $email, Location: $location, Size: $size, Description: $description.\n";

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
        echo "true";
        replaceXML();
        removeTempXML();
        http_response_code(200);
    } else {
        echo "false";
        removeTempXML();
        http_response_code(500);
    }

    function getNextFreeId($xml) {
        $xPathQuery = '//@id';
        $results = $xml->xpath($xPathQuery);
        sort($results);
        return $results[0] + 1;
    }

    function addCommunity($xml, $id, $name, $email, $location, $size, $description) {
        $community = $xml->addChild('community');
        $community->addAttribute('id', $id);
        $community->addChild('name', $name);
        $community->addChild('description', $description);
        $community->addChild('size', $size);
        $community->addChild('location', $location);
        $community->addChild('mail', $email);
    }

    function editCommunity($xml, $id, $name, $email, $location, $size, $description) {
        $character = $xml->addChild('prof', 'Thomas Koller');
        $character->addAttribute('teaches', 'swe');
    }

    function persistXML($path, $xml) {
        file_put_contents($path, $xml->asXML());
    }

    function validateXML() {
        $data = file_get_contents('../../database/communities_temp.xml');
        $xml = new DOMDocument();
        $xml->loadXML($data);
        // disable error output to client
        libxml_use_internal_errors(true);
        // validate against schema
        $xsd = '../../database/communities.xsd';
        $result = $xml->schemaValidate($xsd);
        // show errors
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

    //printXML($xml);

    //function printXML($xml) {
    //    foreach ($xml->community as $community) {
    //        echo $community, ' id: ', $community['id'], '<br />';
    //    }
    //}
?>