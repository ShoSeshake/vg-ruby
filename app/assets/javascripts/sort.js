$(function() {
    var el = document.getElementById('instruction_box');
    var sortable = Sortable.create(el, {
        sort: 1,
        group: {
            name: 'common_lists',
            handle: '.instruction-number__form ',
            pull: 'clone',
            put: true
        },
        onEnd: function() {
            var positionForm = $('.instruction-number__form');
            var i = 1;
            positionForm.each(function() {
                $(this).val(i);
                i++;
            });
        },
        animation: 150
    });
})