//reviews/index.html.erb for 'Load Reviews' link on Show Page
$(function() {
  $("a.load_reviews").on("click", function(e) {
    e.preventDefault();p
 //Send AJAX HIGH-LEVEL get request
  $.get(this.href).success(function(json) {
    var $ol = $("div.reviews ol")
    $ol.html(" ")
    json.forEach(function(review) {
      $ol.append("<li>" + review + "</li>");
    });
  });
 //Load response into HTML of page
 });
});

//reviews/index.html.erb for 'More' reviews link on Index Page
$(function () {
  $(".js-more").on('click', function(e) {
    e.preventDefault();
    var id = $(this).data("id");
    $.get("/reviews/" + id + ".json", function(data) {
      var review = data;
      $("#body-" + id).html(review["content"]);
    });
  });
});

//reviews/show.html.erb for 'Next' review button on Show Page
$(function () {
  $(".js-next").on("click", function(e) {
    e.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/reviews/" + nextId + ".json", function(data) {
      var review = data;
      $(".restaurantName").text(review["restaurant"]["name"]);
      $(".reviewBody").text("Comments:" + " + review["content"] + ");
      $(".reviewCuisines").text("Cuisines:" + review["cuisine"]["name"]);
      $(".reviewRating").text(review["rating"]);
      $(".reviewDateVisited").date(review["date_visited"]);
      $(".reviewUpdatedAt").date(review["updated_at"]);
      $(".userEmail").text(review["user"]["email"]);
// re-set the id to current on the link
      $(".js-next").attr("data-id", review["id"]);
    });
  });
});

//reviews/_form.html.erb for New review form to render on same New page
  $(function () {
    $('form').submit(function(e) {
      //prevent form from submitting the default way
      e.preventDefault();

      var values = $(this).serialize();

      var posting = $.post('/reviews', values);

      posting.done(function(data) {
        var review = data;
        $("#restaurantName").text(review["restaurant"]["name"]);
        $("#reviewBody").text(review["content"]);
        $("#reviewCuisines").text(review["cuisines"]);
        $("#reviewRating").text(review["rating"]);
        $("#reviewDateVisited").date(review["date_visited"]);
      });
    });
  });
