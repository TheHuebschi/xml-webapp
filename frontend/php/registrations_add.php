<?php 
    $challengeId = $_POST['challengeId'];
    $communityId = $_POST['communityId'];
    $title = $_POST['titleInput'];
    $description = $_POST['descriptionInput'];
    $date = date('d.m.Y');

    $picInput = htmlspecialchars($_POST["picInput"]);
    $picInputName = $_FILES['picInput']['name'];

    $pictureLink = uploadPicture($picInputName);
    
    $xml = simplexml_load_file('../../database/challenges.xml');
    addregistration($xml, $challengeId, $communityId, $date, $title, $description, $pictureLink);
    persistXML('../../database/challenges_temp.xml', $xml);
    
    if (validateXML() && $pictureLink != "error") {
        echo "success";
        replaceXML();
        removeTempXML();
        http_response_code(200);
    } elseif($pictureLink != "error") {
        echo "Die Eingaben konnten nicht erfolgreich validiert werden!";
        removeTempXML();
        http_response_code(200);
        
    }else{
        removeTempXML();
        http_response_code(200);
    }

    function addregistration($xml, $challengeId, $communityId, $date, $title, $description, $pictureLink) {
        $xPathQuery = '//challenge[@id="' . "$challengeId" . '"]/registrations';
        $registrations = $xml->xpath($xPathQuery)[0];
        
        $registration= $registrations->addChild('registration');
        $registration->addAttribute('communityId', $communityId);
        $registration->addChild('date', $date);
        $registration->addChild('title', $title);
        $registration->addChild('description', $description);
        $registration->addChild('pictureLink', $pictureLink);
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

    function uploadPicture($picInput){
        $errorText = "Error: ";
        $target_dir = "../../database/images/";
        $target_file = $target_dir . basename(str_replace("\\", '/', $picInput)); 
        $pictureLink = "https://xml.temperli.online/database/images/" . basename(str_replace("\\", '/', $picInput));
    
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
        
        // Check if image file is a actual image or fake image
        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
            $errorText .= "Nur JPG, JPEG, PNG & GIF files sind erlaubt. ";
            $uploadOk = 0;
        }

        // Check if file already exists
        if (file_exists($target_file)) {
            $errorText .= "Die Datei existiert bereits. ";
            $uploadOk = 0;
        }
        // Check file size
        if ($_FILES["picInput"]["size"] > 2000000) {
            $errorText .= "Die Datei ist zu gross. Sie muss unter 2MB sein.";
            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            echo $errorText;
            return "error";
        // if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($_FILES["picInput"]["tmp_name"], $target_file)) {
            } else {
                echo "Ein Fehler beim Upload ist aufgetreten." . $_FILES[0];
                return "error";
            }
        }
        return $pictureLink;
    }
?>