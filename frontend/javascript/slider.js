var slideIndex = 1;

function plusDivs(n, challengeID) {
  showDivs(slideIndex += n, challengeID);
}

function resetSlideIndex(){
  slideIndex = 1;
}

function showDivs(n, challengeID) {
  var i;
  //var x = document.getElementsByClassName("mySlides");
  var x = document.querySelectorAll(".galleryDiv" + challengeID + " .challengeIMG");

  if (n > x.length){
    slideIndex = 1
  }
  if (n < 1) {
    slideIndex = x.length
  }
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none"; 
  }
  x[slideIndex-1].style.display = "block"; 
}