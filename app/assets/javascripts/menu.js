$(function() {
    $('#menu-btn').on('click', function() {
        $('#modal-menu-bar').animate({
            "left": "0"
        })
        $('#modal-menu').fadeIn(500);
    })
    $('#menu-back').on('click', function() {
        $('#modal-menu').fadeOut(500);
        $('#modal-menu-bar').animate({
            "left": "-300px"
        })
    })
    $('#modal-menu').on('click', function() {
        $('#modal-menu').fadeOut(500);
        $('#modal-menu-bar').animate({
            "left": "-300px"
        })
    })
    $('#user-menu').on('click', function() {
        $('.user-hidden-menu').slideToggle(500);
    })
    $('#recipe-menu').on('click', function() {
        $('.recipe-hidden-menu').slideToggle(500);
    })
    $('.user-link').on('click', function(e) {
        e.preventDefault();
        var linkUrl = $(this).attr('href');
        $('.menu__bar__box').fadeOut(500);
        $('#modal-menu-bar').animate({
            'width': '100vw'
        });

        function action() {
            location.href = linkUrl;
        }
        setTimeout(action, 1000);
    })
    $('#menu-category').on('click', function() {
        $('#dark-background').fadeIn(500);
        $('#category-list').fadeIn(500);
    })
    $('#menu-ingredient').on('click', function() {
        $('#dark-background').fadeIn(500);
        $('#ingredient-list').fadeIn(500);
    })
    $('#dark-background').on('click', function() {
        $('#dark-background').fadeOut(500);
        $('#category-list').fadeOut(500);
        $('#ingredient-list').fadeOut(500);
    })
})