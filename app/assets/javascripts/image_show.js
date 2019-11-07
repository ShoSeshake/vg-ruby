$(function() {
    var subs = $('.image-sub');
    subs.on('click', function() {
        var src = $(this).data('image')
        $('.image-main').attr('src', src)
    });
})