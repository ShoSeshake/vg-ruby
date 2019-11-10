$(function() {

    var myRecipe = $('#my_recipes');
    var likedRecipe = $('#liked_recipes');
    var commentedRecipe = $('#commented_recipes');
    var myReview = $('#my_reviews');
    var commentedReview = $('#commented_reviews')

    $('#user-page-recipe').on('click', function() {
        $('.hidden-user-recipe').slideToggle(500);
    })

    $('#user-page-review').on('click', function() {
        $('.hidden-user-review').slideToggle(500);
    })

    $('#user-recipes').on('click', function() {
        myRecipe.fadeIn(500);
        likedRecipe.hide();
        commentedRecipe.hide();
        myReview.hide();
        commentedReview.hide();
    })
    $('#user-likes').on('click', function() {

        likedRecipe.fadeIn(500);
        commentedRecipe.hide();
        myRecipe.hide();
        myReview.hide();
        commentedReview.hide();
    })
    $('#user-comments').on('click', function() {
        commentedRecipe.fadeIn(500);
        likedRecipe.hide();
        myRecipe.hide();
        myReview.hide();
        commentedReview.hide();
    })
    $('#users-review-btn').on('click', function() {
        myReview.fadeIn(500);
        likedRecipe.hide();
        myRecipe.hide();
        commentedReview.hide();
        commentedRecipe.hide();
    })
    $('#commented-review-btn').on('click', function() {
        commentedReview.fadeIn(500);
        likedRecipe.hide();
        myRecipe.hide();
        myReview.hide();
        commentedRecipe.hide();
    })
})