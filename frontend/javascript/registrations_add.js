window.onload = function() {
    if(typeof getUrlVars()["id"] != 'undefined'){
        prepareRequest();
    }
};

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}

function prepareRequest(){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            loadregistration(xhttp.responseXML);
        }
    };
    xhttp.open("GET", "../../database/challenges.xml", true);
    xhttp.send(); 
}

function loadregistration(xml) {
    document.getElementById("dateInput").value = getElementByXPath(xml, "date");
    document.getElementById("TitleInputApp").value = getElementByXPath(xml, "title");
    document.getElementById("PicInput").value = getElementByXPath(xml, "pictureLink");
    document.getElementById("descriptionInputApp").value = getElementByXPath(xml, "description");
    
}

function getElementByXPath(xml, elementName){
    var xhttp = new XMLHttpRequest();
    var result = "";
    path = "/challenges/challenge/registrations/registration[@id='" + getUrlVars()["id"] +"']/" + elementName
    if (xml.evaluate) {
        var nodes = xml.evaluate(path, xml, null, XPathResult.ANY_TYPE, null);
        result = nodes.iterateNext().childNodes[0].nodeValue;
    // Code For Internet Explorer
    } else if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
        xml.setProperty("SelectionLanguage", "XPath");
        result = xml.selectNodes(path).nodes[0].childNodes[0].nodeValue;
    }
    return result;
}

function addRegistration() {
    var challengeId = document.forms["newRegistration"]["challengeId"].value;
    var communityId = document.forms["newRegistration"]["communityId"].value;
    var titleInput = document.forms["newRegistration"]["titleInput"].value;
    var descriptionInput = document.forms["newRegistration"]["descriptionInput"].value;
    var formData = new FormData();
    formData.append('challengeId', challengeId);
    formData.append('communityId', communityId);
    formData.append('titleInput', titleInput);
    formData.append('picInput', $('#picInput')[0].files[0]);
    formData.append('descriptionInput', descriptionInput);
 
    $.ajax({
    url: '../php/registrations_add.php',
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(data) {
        success(data);
    },
    error: function() {
        error();
    }
    });
    return false;
  }

  function success(data) {
    if(data != "success"){
        alert(data);
    }else{
        alert("Bewerbung erfolgreich eingereicht!");
        window.location.href = "challenges.xhtml";
    }
  }

  function error() {
    alert("Etwas ist schiefgelaufen!");
  }