$(document).ready(function() {
  $("a.load_reviews").on("click", function(e){
 //Send AJAX HIGH-LEVEL get request
  $.get(this.href).success(function(response) {				
    $("div.reviews").html(response)				
  });
//Load response into HTML of page
   e.preventDefault();
 })
})
