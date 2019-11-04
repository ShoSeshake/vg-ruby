$(function() {
    var searchField = $("#ing-field");
    var searchResult = $("#search-result");
    var recipeIngredient = $("#recipe-ingredient");

    function listIngredients(ing) {
        var html = `<div class='ingredient-list' data-id="${ing.id}" data-name="${ing.name}">
                        ${ing.name}
                    </div>`
        searchResult.append(html);
    }

    function appendErrMsgToHTML(msg) {
        var html = `<div class="ingredient-list">${ msg }
                </div>`
        searchResult.append(html);
    }

    function appendIngredient(ing) {
        var html = `<div class='flex-box ing-form'>
                    <input type="hidden" name="recipe[ingredients_recipes_attributes][][ingredient_id]" id="recipe_ingredients_recipes_ingredient_id" value="${ ing.id }"/>
                    <div class='delete-btn'>
                    ×
                    </div>
                    <div class='ingredients-box'>
                    ${ing.name}
                    </div>
                    <input class="quantity-field" type="text" name="recipe[ingredients_recipes_attributes][][quantity]" id="recipe_ingredients_recipes_quantity" />
                    </div>`
        recipeIngredient.append(html);
    }

    searchField.on("keyup", function() {
        var inputIngredients = searchField.val();
        if (inputIngredients.length) {
            $.ajax({
                    type: 'GET',
                    url: '/api/recipes',
                    data: { keyword: inputIngredients },
                    dataType: 'json'
                })
                .done(function(ings) {
                    searchResult.show();
                    searchResult.empty();
                    if (ings.length !== 0) {

                        ings.forEach(function(ing) {
                            listIngredients(ing);
                        });
                    } else {
                        appendErrMsgToHTML("No ingredients found");
                    }
                })
                .fail(function() {
                    alert('something went wrong');
                })
        } else {
            searchResult.empty();
            searchResult.hide();
        }
    });
    $(document).on("click", ".ingredient-list", function() {
        $('#quantity-box').css({ 'opacity': '1' })
        searchResult.hide();
        searchField.val('');
        var ing = {};
        ing.id = $(this).data("id");
        ing.name = $(this).data("name");
        appendIngredient(ing);
    })
    $(document).on("click", ".delete-btn", function() {
        $(this).parent().remove();
        if ($('.ing-form').length == 0) {
            $('#quantity-box').css({ 'opacity': '0' })
        }
    });
});