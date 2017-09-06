$(function() {
  $("a.load_reviews").on("click", function(e) {
 //Send AJAX HIGH-LEVEL get request
  $.get(this.href).success(function(json) {
    var $ol = $("div.reviews ol")
    $ol.html(" ")
    json.forEach(function(review) {
      $ol.append("<li>" + review + "</li>");
    });
  });
 //Load response into HTML of page
   e.preventDefault();
 });
});

$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/reviews/" + id + ".json", function(data) {
      var review = data;
      $("#body-" + id).html(review["content"]);
    });
  });
});

