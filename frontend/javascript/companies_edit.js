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
            loadCompany(xhttp.responseXML);
        }
    };
    xhttp.open("GET", "../../database/companies.xml", true);
    xhttp.send(); 
}

function loadCompany(xml) {
    document.getElementById("nameInput").value = getElementByXPath(xml, "name");
    document.getElementById("descriptionInput").value = getElementByXPath(xml, "description");
    document.getElementById("locationInput").value = getElementByXPath(xml, "location");
    document.getElementById("numberOfEmployeesInput").value = getElementByXPath(xml, "numberOfEmployees");
}

function getElementByXPath(xml, elementName){
    var xhttp = new XMLHttpRequest();
    var result = "";
    path = "/companies/company[@id='" + getUrlVars()["id"] +"']/" + elementName
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

function editCompanies() {
    var idInput = getUrlVars()["id"];
    var nameInput = document.forms["editCompaniesForm"]["nameInput"].value;
    var descriptionInput = document.forms["editCompaniesForm"]["descriptionInput"].value;
    var locationInput = document.forms["editCompaniesForm"]["locationInput"].value;
    var numberOfEmployeesInput = document.forms["editCompaniesForm"]["numberOfEmployeesInput"].value;
    
    $.ajax({
    url: '../php/companies_edit.php',
    type: 'POST',
    data: {
        'id': idInput,
        'name': nameInput,
        'location': locationInput,
        'numberOfEmployees': numberOfEmployeesInput,
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
    swal({
        title: "Geschafft!",
        text: "Deine Company wurde erfolgreich hinzugefügt/angepasst!",
        icon: "success",
        button: "Weiter entdecken!",
    }).then(() => {
        window.location.href = "companies.xhtml";
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