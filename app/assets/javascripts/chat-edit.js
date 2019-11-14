$(function() {

    function appendUser(user) {
        var html = `<div class='search_result_name-edit' data-id="${ user.id }" data-name="${ user.name }">
                    ${user.name}
                </div>`
        $("#friend_result-edit").append(html);
    }

    function appendErrMsgToHTML(msg) {
        var html = `<div class="error-message-chat">${ msg }
            </div>`
        $("#friend_result-edit").append(html);
    }

    function appendMember(member) {
        var html = `<div class='member-box existing_user' id="chat-user-${ member.id }"  data-user="${member.id}">
                    <div class="member-box__delete">×</div>
                    <input type="hidden" value=${ member.id } name="chat[chat_members_attributes][][user_id]" id="user_ids_${member.id}" class="hidden-user-form">
                    ${member.name}
                    </div>`
        $("#append_field-edit").append(html);
    }

    $(document).on("keyup", "#friend-search-edit", function() {
        var keyword = $("#friend-search-edit").val()
        var user_id = $('#current_user_id').val();
        var users = $('.existing_user');
        var userids = [];
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
                    $("#friend_result-edit").show();
                    $("#friend_result-edit").empty();
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
            $("#friend_result-edit").empty();
            $("#friend_result-edit").hide();
        }
    });

    $(document).on("click", ".search_result_name-edit", function() {
        $("#friend_result-edit").hide();
        $("#friend-search-edit").val('');
        var user = {};
        user.id = $(this).data("id");
        user.name = $(this).data("name");
        appendMember(user);
    })

    $(document).on("click", ".member-box__delete-edit", function() {

        $(this).parent().remove();
    });

    $(document).on("click", ".member-box__delete-edit", function() {
        var hiddenBox = $(this).siblings('.edit_hidden_box');
        var checkbox = hiddenBox.find(".chat-member-checkbox");
        checkbox.prop('checked', true);
        $('#append_field-edit').prepend(hiddenBox);
        $(this).parent().remove();
    });

    $(document).on("click", "#background-edit", function() {
        $('#chat-edit-container').remove();
        $('#background-edit').remove();
    })

    $(document).on('click', '#chat-delete-btn', function() {
        $('#background-edit-delete').fadeIn(500);
        $('#chat-edit-container-delete').fadeIn(500);
    })

    $(document).on('click', '#background-edit-delete', function() {
        $('#background-edit-delete').fadeOut(500);
        $('#chat-edit-container-delete').fadeOut(500);
    })

    $(document).on('click', '.chat-delete__confirmation__cancel', function() {
        $('#background-edit-delete').fadeOut(500);
        $('#chat-edit-container-delete').fadeOut(500);
    })
});