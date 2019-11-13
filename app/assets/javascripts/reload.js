$(function() {
    if (window.location.href.match(/\/messages/)) {
        var reloadMessages = function() {
            if ($('#message_chat_id').length !== 0) {

                // var buildHTML = function(message) {
                //     var content = message.content ? `${ message.content }` : "";
                //     var img = message.url ? `<img class="chat__main__body__message__box__text__image" src="${message.url}">` : "";
                //     var html = `<div class="chat__main__body__message clearfix" data-id="${message.id}">
                //                   <div class="chat__main__body__message__box other-box">
                //                     <div class="chat__main__body__message__box__detail other-detail">
                //                       <span class="message-user-name">
                //                         ${message.user_name}
                //                       </span>
                //                       <span class="message-time">
                //                         ${message.created_at}
                //                       </span>
                //                     </div>
                //                     <div class="chat__main__body__message__box__text other-text">
                //                       ${content}
                //                       ${img}
                //                     </div>
                //                   </div>
                //                 </div>`
                //     return html;
                // };
                // var lastMessage = function(chat) {
                //     var html = `${chat.chat_message}`
                //     return html;
                // }

                // function  scroll()  {
                //     $('.chat__main__body').animate({ scrollTop:  $('.chat__main__body')[0].scrollHeight });
                // }


                chatId = $('#message_chat_id').val();
                last_message_id = $('.chat__main__body__message:last').data('id');
                $.ajax({
                        url: 'api/messages/reload',
                        type: 'get',
                        dataType: 'script',
                        data: {
                            message_id: last_message_id,
                            chat_id: chatId
                        }
                    })
                    // .done(function(messages) {
                    //     var insertHTML = '';
                    //     var inserMessage = '';
                    //     if (messages.length !== 0) {
                    //         messages.forEach(function(message) {
                    //             insertHTML = buildHTML(message);
                    //             inserMessage = lastMessage(message);
                    //             $('.chat__main__body').append(insertHTML);
                    //             $(`.message-` + chatId).html(inserMessage);
                    //             scroll();
                    //         });
                    //     }
                    // })
                    // .fail(function() {
                    //     alert('メッセージが自動更新されませんでした');
                    // });

            }
        };
        setInterval(reloadMessages, 5000);
    }
});