$(function() {
    var addButton = $('.add-button');
    addButton.on('click', function() {
        var lastNumber = $('.instruction-number:last').data('number');
        var html = `<div class='flex-box'>
              <div class='instruction-number' data-number="${lastNumber+1}">
              <span>${lastNumber+1}.</span>
              </div>
              <textarea class="instruction-text" name="recipe[instructions_attributes][][text]" id="recipe_instructions_attributes_0_text"></textarea>
            </div>`
        $('.flex-box:last').after(html);
    })

})