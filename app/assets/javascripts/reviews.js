$(function() {
  $("a.load_reviews").on("click", function(e) {
 //Send AJAX HIGH-LEVEL get request
<<<<<<< HEAD
  $.get(this.href).success(function(json) {
    var $ol = $("div.reviews ol")
    $ol.html("")
    json.forEach(function(review) {
      $ol.append("<li>" + review + "</li>");
    })
  })
  //Load response into HTML of page
=======
  $.get(this.href).success(function(response) {				
    $("div.reviews").html(response)				
  });
//Load response into HTML of page
>>>>>>> 4ddff9235800fb5bca4ad93cf5b40844c01dd91a
   e.preventDefault();
 })
})
