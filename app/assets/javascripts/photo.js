$(function() {

    // 変数定義
    var count = 0;
    // ドラックドロップを保持
    var list = new DataTransfer();
    // 1つのドロップボックスを定期
    var dropBox = $(".restaurants-new__main__left");

    // var camera = $('.camera-image');
    // var innerText = $('.inner_text');
    // // ドラッグアンドドロップ枠を縮める関数
    // function deleteWidth1(num) {
    //     if (num > 4) {
    //         var num = num - 5
    //     }
    //     var del = 615 - num * 126
    //     dropBox.css('width', `${del}px`)
    // }
    // input[type=file]に、FileListを入力する関数
    function appendFile(list) {
        if (list.files && list.files[0]) {
            var myFileList = list.files;
            document.querySelector('input[type=file]').files = myFileList;
        }
    }

    // プレビューを表示する関数
    function readURL(input, list, edit_num) {
        if (input.files && input.files[0]) {
            $.each(input.files, function(index, file) {
                count += 1;
                // 画像10枚以上は投稿させない
                if (count > 10) {
                    count -= 1
                    return false;
                }
                list.items.add(file);
                var reader = new FileReader();
                reader.onload = function(e) {
                    var loadedImageUri = e.target.result;
                    var html = `<div class="upload-photo">
                              <a class="upload-photo__delete" href="#" data-pict="${file.name}" id="pict-delete">×</a>
                              <img alt="" src="${loadedImageUri}" class="upload-photo__image">
                              </div>`;
                    $(".restaurants-new__main__left__box").append(html);
                    // if (count < 10) {
                    //     var num = input.files.length
                    //     num += edit_num
                    //     deleteWidth1(num)
                    //     dropBox.before(html);
                    //     if (count == 9) {
                    //         camera.css('display', `block`)
                    //         innerText.css('display', `none`)
                    //     }

                    // } else if (count > 10) {
                    //     return false
                    // }


                }
                reader.readAsDataURL(input.files[index])
            })
        }
    }

    // inputタグに変化があれば発火
    $(document).on("change", "#restaurant_url", function() {
        // count = $('.upload-item').length
        var edit_num = 0
            // if ($('.pict-delete-edit').length) {
            //     edit_num = $('.pict-delete-edit').length
            // }
        readURL(this, list, edit_num);
        appendFile(list);

    });

    // // new - 削除ボタンがクリックされたら発火
    // $(document).on("click", "#pict-delete", function(e) {
    //     e.preventDefault();
    //     var target = $(e.target);
    //     var pict_name = target.data('pict');
    //     target.parent().remove();
    //     if (document.querySelector('input[type=file]').files.length == 1) {
    //         $('input[type="file"]').val(null);
    //         list.clearData();
    //     } else {
    //         $.each(list.files, function(index, file) {
    //             if (file.name == pict_name) {
    //                 list.items.remove(index);
    //                 return false
    //             }
    //         })
    //         appendFile(list)
    //     }

    //     count -= 1
    //     maxspace = 4
    //     deleteWidth1(count)
    //     if (count == maxspace) {
    //         camera.css('display', `block`)
    //         innerText.css('display', `none`)
    //     } else if (count == 9) {
    //         camera.css('display', `block`)
    //         innerText.css('display', `none`)
    //         dropBox.css('display', `inline-block`)
    //     } else {
    //         camera.css('display', `none`)
    //         innerText.css('display', `block`)
    //     }
    // })

    // // edit - 削除ボタンがクリックされたら発火
    // $(document).on("click", "#pict-delete-edit", function(e) {
    //     e.preventDefault();
    //     var target = $(e.target);
    //     var id = target.data('img');
    //     var url = target.data('url');
    //     var html = `<div class="edit_hidden_box">
    //                   <input name="recipe[images_attributes][][_destroy]" value=1 checked="checked">
    //                   <input name="recipe[images_attributes][][id]" value="${id}">
    //                   <input name="recipe[images_attributes][][url]" value="${url}">
    //               </div>`
    //     $('#item-append-target').prepend(html);
    //     count = $('.upload-item').length
    //     target.parent().remove();

    //     count -= 1
    //     maxspace = 4
    //     deleteWidth1(count)
    //     if (count == maxspace) {
    //         camera.css('display', `block`)
    //         innerText.css('display', `none`)
    //     } else if (count == 9) {
    //         camera.css('display', `block`)
    //         innerText.css('display', `none`)
    //         dropBox.css('display', `inline-block`)
    //     } else {
    //         camera.css('display', `none`)
    //         innerText.css('display', `block`)
    //     }
    // })
});