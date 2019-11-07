$(function() {
    var myRecipe = $('#my_recipes');
    var likedRecipe = $('#liked_recipes');
    var commentedRecipe = $('#commented_recipes');
    $('#user-recipes').on('click', function() {
        likedRecipe.hide();
        commentedRecipe.hide();
        myRecipe.fadeIn(500);
    })
    $('#user-likes').on('click', function() {

        likedRecipe.fadeIn(500);
        commentedRecipe.hide();
        myRecipe.hide();
    })
    $('#user-comments').on('click', function() {
        likedRecipe.hide();
        commentedRecipe.fadeIn(500);
        myRecipe.hide();
    })
});