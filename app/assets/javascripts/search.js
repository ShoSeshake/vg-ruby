$(function() {
    var searchField = $("#search-ingredient-form");
    var searchResult = $("#search-ingredient-result");
    var recipeIngredient = $("#search-ingredient-append");

    function listIngredients(ing) {
        var html = `<div class='result-ingredient' data-id="${ing.id}" data-name="${ing.name}">
                      ${ing.name}
                  </div>`
        searchResult.append(html);
    }

    function appendErrMsgToHTML(msg) {
        var html = `<div class="error-message-search">${ msg }
              </div>`
        searchResult.append(html);
    }

    function appendIngredient(ing) {
        var html = `<div class='search-ingredient-box'>
                      <input type="hidden" name="q[ingredients_recipes_ingredient_id_in][]" value="${ ing.id }"/>
                      <div class='search-ingredient-box__delete'>
                        ×
                      </div>
                      <div class='search-ingredient-box__name'>
                        ${ing.name}
                      </div>
                    </div>`
        recipeIngredient.append(html);
    }

    searchField.on("keyup", function() {
        var inputIngredients = searchField.val();
        if (inputIngredients.length) {
            $.ajax({
                    type: 'GET',
                    url: '/api/recipes/new',
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
    $(document).on("click", ".result-ingredient", function() {
        searchResult.hide();
        searchField.val('');
        var ing = {};
        ing.id = $(this).data("id");
        ing.name = $(this).data("name");
        appendIngredient(ing);
    })
    $(document).on("click", ".search-ingredient-box__delete", function() {
        $(this).parent().remove();
    });
});