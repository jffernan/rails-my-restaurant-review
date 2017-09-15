//High-level AJAX GET request
$(function() {
  $(".load_more_reviews").on("click", function(e) {
    $.get( this.href).done(function( response ) {
      $(".reviews").html(response)
    })
    e.preventDefault();
  });
});

class Review {
  constructor(review) {
    this.id = id;
    this.restaurant_name = review.restaurant_name;
    this.content = review.content;
    this.rating = review.rating;
    this.date_visited = review.date_visited;
    this.user = review.user;
    this.user_id = review.user_id;
    this.restaurant_id = review.restaurant_id;
  }
   reviewComments() {
    return "You commented about <b>"+this.restaurant_name+': "'+this.content+'."</b>';
   }
};
