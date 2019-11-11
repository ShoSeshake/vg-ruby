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
$(function() {
    var hiddenField = $('#restaurant_review');
    var apples = $('.icon-apple');
    apples.on('click', function() {
        var number = $(this).data('id')
        apples.css({
            'color': 'rgb(128, 128, 128)'
        });

        hiddenField.val('');
        hiddenField.val(number);
        apples.slice(0, number)
            .css({
                'color': 'rgb(247, 48, 48)'
            });
    })
})
$(function() {
    var hiddenField = $('#restaurant_comment_review');
    var apples = $('.icon-apple-review');
    apples.on('click', function() {
        var number = $(this).data('id')
        apples.css({
            'color': 'rgb(128, 128, 128)'
        });

        hiddenField.val('');
        hiddenField.val(number);
        apples.slice(0, number)
            .css({
                'color': 'rgb(247, 48, 48)'
            });
    })
})