<?php 
    //$id = htmlspecialchars($_POST["id"]);
    $communityId = htmlspecialchars($_POST["communityId"]);
    $date = htmlspecialchars($_POST["date"]);
    $title = htmlspecialchars($_POST["title"]);
    $PicInput = htmlspecialchars($_POST["PicInput"]);
    $description = htmlspecialchars($_POST["description"]);

    // Upload Picture and store its link in  $pictureLink
    $target_dir = "../../database/images/";
    $target_file = $target_dir . basename($_FILES["PicInput"]["name"]);
    $pictureLink = "https://xml.temperli.online/database/images/" . basename($_FILES["PicInput"]["name"]);
    move_uploaded_file($_FILES["PicInput"]["tmp_name"], $target_file)    


    $xml = simplexml_load_file('../../database/challenges.xml');
    addregistration($xml, $communityId, $date, $title, $description, $pictureLink);


  /*  if (empty($id)) {
        $id = getNextFreeId($xml);
        addregistration($xml, $id, $communityId, $date, $title, $picture, $description, $target_file);
    }
    else {
        editregistration($xml, $id, $communityId, $date, $title, $picture, $description, $target_file);
    } */
    
    persistXML('../../database/challenges_temp.xml', $xml);
    
    if (validateXML()) {
        replaceXML();
        removeTempXML();
        http_response_code(200);
    } else {
        removeTempXML();
        http_response_code(500);
    }

  /*  function getNextFreeId($xml) {
        $xPathQuery = '//@id';
        $results = $xml->xpath($xPathQuery);
        rsort($results);
        
        return $results[count($results)-1] + 1;
    }
*/
    function addregistration($xml, $communityId, $date, $title, $description, $pictureLink) {
        //$registrations= $xml->xpath();
        $registration= $registrations->addChild('registration')
        $registration->addAttribute('communityId', $communityId);
        $registration->addChild('date', $date);
        $registration->addChild('title', $title);
        $registration->addChild('description', $description);
        $registration->addChild('pictureLink', $pictureLink);
    }


  /*  function editregistration($xml, $communityId, $date, $title, $description, $pictureLink) {
        $registration= $registrations->addChild('registration')
        //   $registrations = $xml->addChild('registration');
           $registration->addAttribute('communityId', $communityId);
           $registration->addChild('date', $date);
           $registration->addChild('title', $title);
           $registration->addChild('description', $description);
           $registration->addChild('target_file', $target_file);
        $xPathQuery = '//challenge[@id="' . "$id" . '"]';
        $community = $xml->xpath($xPathQuery)[0];

        $community->date = $date;
        $community->title = $title;
        $community->picture = $picture;
        $community->description = $description;
       
    }
*/
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
      //  unlink('../../database/challenges_temp.xml');
    }
?>