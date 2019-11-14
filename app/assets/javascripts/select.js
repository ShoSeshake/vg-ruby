$(function() {
    $("#select-order").on("change", function() {
        Rails.fire($('#search-form')[0], 'submit');
    });
});