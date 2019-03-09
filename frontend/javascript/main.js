function collapseNavigation() {
    var x = document.getElementById("myTopnav");
    if (x.className == "topnav") {
        x.className += " responsive";
    }
    else {
        x.className = "topnav";
    }
}

init();

function init(){
  document.addEventListener('DOMContentLoaded', function() {
    addCommunitiesTableRowHandler();
    addCompaniesTableRowHandler();
  }, false);
}

function showChallengePictures(id) {
  var element = document.getElementById("challengePictures" + id);
  var challengePictures = document.querySelectorAll("#challengePictures" + id + " .challengeIMG");
  if (challengePictures.length != 0){
    if (element.className == "hiddenPictures"){
      Array.from(document.getElementsByClassName('notHiddenPictures')).forEach(function(element) {
        element.className = "hiddenPictures";
      });
      element.className = "notHiddenPictures";
      showDivs(1,id);
    } else{
      Array.from(document.getElementsByClassName('notHiddenPictures')).forEach(function(element) {
        element.className = "hiddenPictures";
      });
    }
  }
}

function addCommunitiesTableRowHandler() {
    if(document.getElementById("communitiesTable")!=null){
        var table = document.getElementById("communitiesTable");
        var rows = table.getElementsByTagName('tr');
        for ( var i = 1; i < rows.length; i++) {
            rows[i].i = i;
            rows[i].onclick = function() {
                window.location='./communities_edit.xhtml?id=' + table.rows[this.i].cells[1].innerHTML;
            };
        }
    }
}

function addCompaniesTableRowHandler() {
  if(document.getElementById("companiesTable")!=null){
      var table = document.getElementById("companiesTable");
      var rows = table.getElementsByTagName('tr');
      for ( var i = 1; i < rows.length; i++) {
          rows[i].i = i;
          rows[i].onclick = function() {
              window.location='./companies_edit.xhtml?id=' + table.rows[this.i].cells[1].innerHTML;
          };
      }
  }
}