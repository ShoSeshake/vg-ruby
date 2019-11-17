$(function() {
    var subs = $('.image-sub');
    subs.on('click', function() {
        var src = $(this).data('image')
        $('.image-main').attr('src', src)
    });
})
$(function() {
    var subs = $('.rest-sub-photo');
    subs.on('click', function() {
        var src = $(this).data('photo')
        $('.restaurant-photo').attr('src', src)
    });
})