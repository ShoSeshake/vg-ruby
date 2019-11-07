$(function() {
    var ingredients = $('.recipe-show__right__ingredient__all__list');
    ingredients.on('click', function() {
        $(this).toggleClass('grey');
    })

    var instructions = $('.recipe-show__instructions__box');
    instructions.on('click', function() {
        $(this).toggleClass('grey');
    })
})