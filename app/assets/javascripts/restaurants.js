$(document).ready(function() {
  $("a.load_reviews").on("click", function(e) {
    $.get(this.href).success(function(json) {
      ol$.html(" ")
    json.forEach(function(review) {
      ol$.append("<li>" + review.content + "</li>");
  e.preventDefault();
  })
})
