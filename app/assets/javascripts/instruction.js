$(function() {
    var addButton = $('.add-button');
    addButton.on('click', function() {
        var lastNumber = $('.instruction-number__form:last').val();
        var newNumber = Number(lastNumber);
        var html = `<div class='flex-box instructions'>
                        <div class='instruction-number'>
                            <div class="ins-delete-btn">×</div><br>
                            <input type="text" readonly="readonly" value=${newNumber+1} name="recipe[instructions_attributes][][position]" class="instruction-number__form"> .
                        </div>
                        <textarea class="instruction-text" name="recipe[instructions_attributes][][text]" id="recipe_instructions_attributes_0_text"></textarea>
                    </div>`
        $('#instruction_box').append(html);
    })
    $(document).on('click', '.ins-delete-btn', function() {
        if ($('.instructions').length > 1) {
            $(this).parent().parent().remove();
            var positionForm = $('.instruction-number__form');
            var i = 1;
            positionForm.each(function() {
                $(this).val(i);
                i++;
            });
        } else {
            return false
        }
    })
    $(document).on('click', '.edit-ins-delete-btn', function() {
        if ($('.instructions').length > 1) {
            var hiddenBox = $(this).parent().siblings('.edit_hidden_box');
            var checkbox = hiddenBox.find('.instruction-checkbox');
            checkbox.prop('checked', true);
            hiddenBox.append(`<input type="hidden" name="recipe[instructions_attributes][][position]" value="0"><input type="hidden" name="recipe[instructions_attributes][][text]" value="delete">`)
            hiddenBox.insertBefore('.instructions:first');
            $(this).parent().parent().remove();

            var positionForm = $('.instruction-number__form');
            var i = 1;
            positionForm.each(function() {
                $(this).val(i);
                i++;
            });
        } else {
            return false
        }
    })
})