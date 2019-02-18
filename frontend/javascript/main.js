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

function changePageContent(page) {
  $.ajax({
    url: 'xslt/' + page + '.xhtml',
    dataType: 'xslt'
  }).done(function(result) {
    $body = $("#content");
    $body.html($(result).children());
  });
}

/*function changePageContent(page) {
  $.ajax({
    success: function(data) {
      $body = $("#content");
      $.get ('xslt/' + page + '.xhtml', function (data)
      {
          $body.html($(data).children());
      }, 'xml');
    }
  });
}*/

function init() {
  var hash = window.location.hash;
  if (hash) {
    changePageContent(hash.replace("#", ""));
  }
  else {
    changePageContent('challenges');
  }
}

$(document).ready(
	init()
)
