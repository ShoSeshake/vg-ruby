$(function() {
    var restName = $('#restaurant_name');
    var restLocation = $('#restaurant_location');
    var gurunaviId = $('#restaurant_gurunavi_id');
    $(document).on('click', '.guru-card__right', function() {
        var name = $(this).data('name');
        var location = $(this).data('area');
        var id = $(this).data('id');
        restLocation.val(location);
        restName.val(name);
        gurunaviId.val(id);
        $('#g-serach_form').remove();
        $('#new_restaurant').fadeIn(1000);
    })
})