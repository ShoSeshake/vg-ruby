$(function() {
    if (window.location.href.match(/\/messages/)) {
        var reloadMessages = function() {
            if ($('#message_chat_id').length !== 0) {
                chatId = $('#message_chat_id').val();
                last_message_id = $('.chat__main__body__message:last').data('id');
                $.ajax({
                    url: 'messages/reload',
                    type: 'get',
                    dataType: 'script',
                    data: {
                        message_id: last_message_id,
                        chat_id: chatId
                    }
                })
            }
        };
        setInterval(reloadMessages, 5000);
    }
});