$(function() {
    $("a.load_reviews").on("click", function(e){
//Send AJAX HIGH-LEVEL get request
  $.get(this.href).success(function(json) {
    var $ul = $("div.reviews ul")
    $ul.html(" ")
    json.forEach(function(review) {
      $ul.append("<li>" + review + "</li>");
    });
  });
 //Load response into HTML of page
  e.preventDefault();
 });
});
