$(function() {

    var myRecipe = $('#my_recipes');
    var likedRecipe = $('#liked_recipes');
    var commentedRecipe = $('#commented_recipes');
    var myReview = $('#my_reviews');
    var commentedReview = $('#commented_reviews');
    var darkBackground = $('#dark-background-follow');
    var confirmation = $('#follow-confirmation');
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
    $('#user-follow').on('click', function() {
        confirmation.fadeIn(500);
        darkBackground.fadeIn(500);
    })
    darkBackground.on('click', function() {
        confirmation.fadeOut(500);
        darkBackground.fadeOut(500);
    })
    $(document).on('click', '.follow-confirmation__cancel__btn', function() {
        confirmation.fadeOut(500);
        darkBackground.fadeOut(500);
    })
    $(document).on('click', '#new_relationship', function() {
        confirmation.hide();
        darkBackground.hide();
    })
    $(document).on('click', '.edit_relationship', function() {
        confirmation.hide();
        darkBackground.hide();
    })
})