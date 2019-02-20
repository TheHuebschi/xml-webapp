function validateForm() {
  var titleInput = document.forms["contactForm"]["titleInput"].value;
  var nameInput = document.forms["contactForm"]["nameInput"].value;
  var prenameInput = document.forms["contactForm"]["prenameInput"].value;
  var emailInput = document.forms["contactForm"]["emailInput"].value;
  if (titleInput == "Select") {
    swal({
      title: "Fehler!",
      text: "Bitte gib mir deine Anrede an!",
      icon: "error",
      button: "Jetzt fixen!",
    });
  }
  else {
    $.ajax({
      url: '/php/serversideProcessing.php',
      type: 'POST',
      data: {
          'title': titleInput,
          'name': nameInput,
          'prename': prenameInput,
          'mail': emailInput
      },
      success: function(data) {
        message.innerHTML = data;
      },
      error: function(error) {
        message.innerHTML = "Etwas ist schief gelaufen!";
      }
    });
  }
  return false;
}

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
  }, false);
}

function addCommunitiesTableRowHandler() {
    if(document.getElementById("communitiesTable")!=null){
        var table = document.getElementById("communitiesTable");
        var rows = table.getElementsByTagName('tr');
        for ( var i = 1; i < rows.length; i++) {
            rows[i].i = i;
            rows[i].onclick = function() {
                window.location='./communities_edit.xhtml?id=' + table.rows[this.i].cells[0].innerHTML;
            };
        }
    }
}

