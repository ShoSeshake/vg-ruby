$(function() {
    var modal = $('#genre-modal');
    $('.genre-btn ').on('click', function() {
        modal.fadeIn(500);

    })
    $('.genre-selected ').on('click', function() {
        modal.fadeOut(500);
    })
    var genreBtn = $('.genre-list__select');
    genreBtn.on('click', function() {
        $(this).toggleClass('checked');
        var checkbox = $(this).find('.genre-checkbox')
        if (checkbox.prop('checked')) {
            checkbox.prop('checked', false);
        } else {
            checkbox.prop('checked', true);
        }
    })
})