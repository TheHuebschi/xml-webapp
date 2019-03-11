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

function editRegistration() {
    //var idInput = getUrlVars()["id"];
    var communityId = document.forms["newRegistration"]["communityId"].value;
    var dateInput = document.forms["newRegistration"]["dateInput"].value;
    var titleInput = document.forms["newRegistration"]["TitleInputApp"].value;
    var PicInput = document.forms["newRegistration"]["PicInput"].value;
    var descriptionInput = document.forms["newRegistration"]["descriptionInputApp"].value;
 
    $.ajax({
    url: '../php/Challenges_AddRegistration.php',
    type: 'POST',
    data: {
    //    'id': idInput,
        'communityId': communityId,
        'date': dateInput,
        'title': titleInput,
        'PicInput': PicInput,
        'description': descriptionInput,
 
    },
    success: function() {
        success();
    },
    error: function() {
        error();
    }
    });
    return false;
  }

  function success() {
    swal({
        title: "Geschafft!",
        text: "Deine registration wurde erfolgreich hinzugefügt!",
        icon: "success",
        button: "Weiter entdecken!",
    }).then(() => {
        window.location.href = "challenges.xhtml";
    }); 
  }

  function error() {
    swal({
        title: "Oh oh!",
        text: "Die Eingaben konnten nicht erfolgreich validiert werden!",
        icon: "error",
        button: "Jetzt fixen!",
      });
  }