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
            loadCommunity(xhttp.responseXML);
        }
    };
    xhttp.open("GET", "../../database/communities.xml", true);
    xhttp.send(); 
}

function loadCommunity(xml) {
    document.getElementById("nameInput").value = getElementByXPath(xml, "name");
    document.getElementById("descriptionInput").value = getElementByXPath(xml, "description");
    document.getElementById("sizeInput").value = getElementByXPath(xml, "size");
    document.getElementById("locationInput").value = getElementByXPath(xml, "location");
    document.getElementById("emailInput").value = getElementByXPath(xml, "mail");
}

function getElementByXPath(xml, elementName){
    var xhttp = new XMLHttpRequest();
    var result = "";
    path = "/communities/community[@id='" + getUrlVars()["id"] +"']/" + elementName
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