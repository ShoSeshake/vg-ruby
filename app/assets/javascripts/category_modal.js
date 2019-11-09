$(function() {
    var modal = $('#category-modal');
    $('.category-btn ').on('click', function() {
        modal.fadeIn(500);

    })
    $('.category-selected ').on('click', function() {
        modal.fadeOut(500);
    })
    var categoryBtn = $('.category-list__select');
    categoryBtn.on('click', function() {
        $(this).toggleClass('checked');
        var checkbox = $(this).find('.category-checkbox')
        if (checkbox.prop('checked')) {
            checkbox.prop('checked', false);
        } else {
            checkbox.prop('checked', true);
        }
    })
    var deleteModal = $('.delete-modal');
    $('#delete-icon').on('click', function() {
        deleteModal.fadeIn(500);
    })
    $('.delete-modal__box__confirmation__cancel').on('click', function() {
        deleteModal.fadeOut(500);
    })

})