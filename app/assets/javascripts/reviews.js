//reviews/index.html.erb for 'Load Reviews' link on Show Page
$(function() {
  $("a.load_reviews").on("click", function(e) {
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

//reviews/index.html.erb for 'More' reviews link on Index Page
$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/reviews/" + id + ".json", function(data) {
      var review = data;
      $("#body-" + id).html("Comments: " + '"' + review["content"] + '"');
    });
  });
});

//reviews/show.html.erb for 'Next' review button on Show Page
$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/reviews/" + nextId + ".json", function(data) {
       //val()Get value of form fields
//text() Get text content of selected element
//html() Get HTML content of selected element
      $('.restName').css({ 'font-weight': 'bold' });
      $(".restName").html(review["restaurant"]["name"]);
      $(".reviewBody").text(review["content"]);
      var cuisines = review["cuisines"];//["cuisines"]["name"]
      $(".reviewCuisines").text(cuisines);
      $('.reviewRating').css({ 'font-weight': 'bold' });
      $(".reviewRating").text(review["rating"]);
      var visitDate = review["date_visited"];
      var date = new Date(visitDate);
      var newDate = date.toString('MM/DD/YYYY');
      $(".reviewDateVisited").text(newDate);
      //$(".reviewDateVisited").text(review["date_visited"]);//text & val work
      //$(".reviewDateVisited").formatDateTime('mm/dd/yy', new Date(visitDate);
      $(".reviewUpdatedAt").text(review["updated_at"]);
      $('.userEmail').css({ 'font-weight': 'bold' });
      $(".userEmail").html(review["user"]["email"]);
      $("a[href$='.com']").html(review["restaurant"]["name"]);
  // re-set the id to current on the link
      $(".js-next").attr("data-id", review["id"]);
    });
  });
});
