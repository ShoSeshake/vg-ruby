$(function() {
    $('#comment-icon').on('click', function() {
        $('.comment-modal').fadeIn(500);
    })
    $('.comment-modal__cancel').on('click', function() {
        $('.comment-modal').fadeOut(500);
    })

})