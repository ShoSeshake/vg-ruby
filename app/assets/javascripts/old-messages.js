$(function() {
    $(document).on('click', '#pre-messages', function() {
        chat_id = $('#message_chat_id').val();
        first_message_id = $('.chat__main__body__message:first').data('id');
        debugger
        $.ajax({
            url: 'api/messages/previous',
            type: 'get',
            dataType: 'script',
            data: {
                message_id: first_message_id,
                chat_id: chat_id
            }
        })
    })
});