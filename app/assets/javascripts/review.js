$(function() {
    var hiddenField = $('#comment_review');
    var leaves = $('.icon-leaf');
    leaves.on('click', function() {
        var number = $(this).data('id')
        leaves.css({
            'color': 'rgb(128, 128, 128)'
        });

        hiddenField.val('');
        hiddenField.val(number);
        leaves.slice(0, number)
            .css({
                'color': '#0f3518'
            });
    })
})