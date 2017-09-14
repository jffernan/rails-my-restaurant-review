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
  e.preventDefault(); // Check placement + closing
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
      //$(".restName").html(data["restaurant"]["name"]);
      $(".restName").html("<a href='/restaurants/"+current_restaurant['id'].toString()+"'>data["restaurant"]["name"]</a>");
      $(".reviewBody").text(data["content"]);
      var cuisines = data["cuisines"]["name"]; //["cuisine"]["name"]
      $(".reviewCuisines").append(cuisines);
      $('.reviewRating').css({ 'font-weight': 'bold' });
      $(".reviewRating").text(data["rating"]);
      var visitDate = data["date_visited"];
      var date = new Date(visitDate);
      var newDate = date.toLocaleDateString();
      $(".reviewDateVisited").text(newDate);
      $(".reviewUpdatedAt").text(data["updated_at"]);
      $('.userEmail').css({ 'font-weight': 'bold' });
      $(".userEmail").html(data["user"]["email"]);
      $("a[href$='.com']").html(data["restaurant"]["name"]);
  // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
