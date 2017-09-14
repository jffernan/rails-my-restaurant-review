//High-level AJAX GET request
$(function() {
  $(".load_more_reviews").on("click", function(e) {
    $.get( this.href).done(function( response ) {
      $(".reviews").html(response)
    })
    e.preventDefault();
  });
});
