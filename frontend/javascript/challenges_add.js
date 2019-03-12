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
            loadchallenge(xhttp.responseXML);
        }
    };
    xhttp.open("GET", "../../database/challenges.xml", true);
    xhttp.send(); 
}

function loadchallenge(xml) {
    document.getElementById("TitleInput").value = getElementByXPath(xml, "title");
    document.getElementById("descriptionInput").value = getElementByXPath(xml, "description");
    document.getElementById("priceInput").value = getElementByXPath(xml, "price");
    //document.getElementById("companyId").value = getElementByXPath(xml, "companyId");
    
}

function getElementByXPath(xml, elementName){
    var xhttp = new XMLHttpRequest();
    var result = "";
    path = "/challenges/challenge[[@id='" + getUrlVars()["id"] +"']/" + elementName
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

function editChallenge() {
    var idInput = getUrlVars()["id"];
    var companyId = document.forms["newChallengeform"]["companyId"].value;
    var titleInput = document.forms["newChallengeform"]["TitleInput"].value;
    var priceInput = document.forms["newChallengeform"]["priceInput"].value;
    var descriptionInput = document.forms["newChallengeform"]["descriptionInput"].value;
    $.ajax({
    url: '../php/challenges_add.php',
    type: 'POST',
    data: {
        'id': idInput,
        'companyId': companyId,
        'title': titleInput,
        'price': priceInput,
        'description': descriptionInput
        
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
    alert("Deine Challenge wurde erfolgreich hinzugefügt!");
    window.location.href = "challenges.xhtml";
  }

  function error() {
    alert("Die Eingaben konnten nicht erfolgreich validiert werden!");
  }