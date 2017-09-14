//reviews/index.html.erb for 'Load Reviews' link on Show Page
$(function() {
  $("a.load_more_reviews").on("click", function(e) {
//Send AJAX HIGH-LEVEL get request
  $.get(this.href).success(function(json) {
    var $ul = $("div.reviews ul")
    $ul.html("")
    json.forEach(function(review) {
      $ul.append("<li>" + review + "</li>");
    });
  });
  e.preventDefault(); // Check placement + closing
 });
});
