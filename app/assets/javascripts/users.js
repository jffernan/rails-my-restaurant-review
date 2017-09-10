$(function() {
    $("a.load_reviews").on("click", function(e){
//Send AJAX HIGH-LEVEL get request
  $.get(this.href).success(function(json) {
    var $li = $("div.reviews li")
    $li.html(" ")
    json.forEach(function(review) {
      $li.append("<li>" + review + "</li>");
    });
  });
 //Load response into HTML of page
  e.preventDefault();
 });
});
