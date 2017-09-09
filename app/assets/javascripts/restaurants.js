$(document).ready(function() {
  $("a.load_reviews").on("click", function(e){
    $(this).hide();
  //Send AJAX LOW-LEVEL get request
  $.ajax({
    method: "GET",
    url: this.href
  }).done(function(response) {
//get response
    $("div.reviews").html(response)
//Load data into html
  });
  e.preventDefault();      
  })
})
