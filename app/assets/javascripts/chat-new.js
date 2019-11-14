$(function() {
    var searchField = $("#friend-search");
    var searchResult = $("#friend_result");
    var appendField = $("#append_field");


    function appendUser(user) {
        var html = `<div class='search_result_name' data-id="${ user.id }" data-name="${ user.name }">
                      ${user.name}
                  </div>`
        searchResult.append(html);
    }

    function appendErrMsgToHTML(msg) {
        var html = `<div class="error-message-chat">${ msg }
              </div>`
        searchResult.append(html);
    }

    function appendMember(member) {
        var html = `<div class='member-box existing_user' id="chat-user-${ member.id }" data-user="${member.id}">
                      <div class="member-box__delete">×</div>
                    <input type="hidden" value=${ member.id } name="chat[chat_members_attributes][][user_id]" id="user_ids_${member.id}">
                    ${member.name}
                    </div>`
        appendField.append(html);
    }

    searchField.on("keyup", function() {
        var keyword = searchField.val()
        var user_id = $('#current_user_id').val();
        var users = $('.existing_user');
        var userids = []
        users.each(function() {
            id = $(this).data('user');
            userids.push(id);
        });
        if (keyword.length) {
            $.ajax({
                    type: 'GET',
                    url: '/chats/new',
                    data: {
                        keyword: keyword,
                        id: user_id,
                        user_ids: userids
                    },
                    dataType: 'json'
                })
                .done(function(users) {
                    searchResult.show();
                    searchResult.empty();
                    if (users.length !== 0) {
                        users.forEach(function(user) {
                            appendUser(user);
                        });
                    } else {
                        appendErrMsgToHTML("No users found");
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
    $(document).on("click", ".search_result_name", function() {
        searchResult.hide();
        searchField.val('');
        var user = {};
        user.id = $(this).data("id");
        user.name = $(this).data("name");
        appendMember(user);
    })
    $(document).on("click", ".member-box__delete", function() {
        $(this).parent().remove();
    });
});