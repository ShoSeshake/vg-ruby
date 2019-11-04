$(function() {
    var modal = $('#category-modal');
    $('.category-btn ').on('click', function() {
        modal.fadeIn(500);
    })
    $('.category-selected ').on('click', function() {
        modal.fadeOut(500);
    })
    var checkbox = $('.category-checkbox')
    checkbox.on('change', function() {
        var val = $('.category-checkbox:checked').val();
        var selectedBox = $(this).parent();
        if (val) {
            selectedBox.css({
                'color': 'white',
                'background-color': 'rgb(15, 53, 24)'
            });
        } else {
            selectedBox.css({
                'color': 'rgb(15, 53, 24)',
                'background-color': 'white'
            });

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