<?php 
    $id = htmlspecialchars($_POST["id"]);
    $name = htmlspecialchars($_POST["name"]);
    $location = htmlspecialchars($_POST["location"]);
    $size = htmlspecialchars($_POST["numberOfEmployees"]);
    $description = htmlspecialchars($_POST["description"]);
    
    $xml = simplexml_load_file('../../database/companies.xml');

    if (empty($id)) {
        $id = getNextFreeId($xml);
        addCompany($xml, $id, $name, $location, $numberOfEmployees, $description);
    }
    else {
        editCompany($xml, $id, $name, $location, $numberOfEmployees, $description);
    }
    
    persistXML('../../database/companies_temp.xml', $xml);
    
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

    function addCompany($xml, $id, $name, $location, $numberOfEmployees, $description) {
        $company = $xml->addChild('company');
        $company->addAttribute('id', $id);
        $company->addChild('name', $name);
        $company->addChild('description', $description);
        $company->addChild('location', $location);
        $company->addChild('numberOfEmployees', $numberOfEmployees);
    }

    function editCompany($xml, $id, $name, $location, $numberOfEmployees, $description) {
        $xPathQuery = '//company[@id="' . "$id" . '"]';
        $company = $xml->xpath($xPathQuery)[0];

        $company->name = $name;
        $company->location = $location;
        $company->numberOfEmployees = $numberOfEmployees;
        $company->description = $description;
    }

    function persistXML($path, $xml) {
        file_put_contents($path, $xml->asXML());
    }

    function validateXML() {
        $data = file_get_contents('../../database/companies_temp.xml');
        $xml = new DOMDocument();
        $xml->loadXML($data);

        libxml_use_internal_errors(true);
        
        $xsd = '../../database/companies.xsd';
        $result = $xml->schemaValidate($xsd);
        
        if (!$result) {
            return false;
        }
        else {
            return true;
        }
    }

    function replaceXML() {
        unlink('../../database/companies.xml');
        rename('../../database/companies_temp.xml', '../../database/companies.xml');
    }

    function removeTempXML() {
        unlink('../../database/companies_temp.xml');
    }
?>