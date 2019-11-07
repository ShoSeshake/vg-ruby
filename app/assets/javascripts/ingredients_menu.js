$(function() {
    var parents = $('.ingredient__all__parent');
    var childField = $('.ingredient__child');

    function appendChild(ing) {
        var html = `<a class = "ingredient__child__list"href = "/ingredients/${ing.id}" >
          ${ing.name} </a>`
        childField.append(html);
    }

    function appendErrMsgToHTML(msg) {
        var html = `<div class="ingredient-list">${ msg }
              </div>`
        childField.append(html);
    }

    parents.on('click', function() {
        var child = $(this).data('id');
        $.ajax({
                type: 'GET',
                url: '/api/recipes',
                data: { child: child },
                dataType: 'json'
            })
            .done(function(ings) {
                childField.empty('');
                childField.show();
                if (ings.length !== 0) {
                    ings.forEach(function(ing) {
                        appendChild(ing);
                    });
                } else {
                    appendErrMsgToHTML("No ingredients found");
                }
            })
            .fail(function() {
                alert('something went wrong');
            })
    })
})