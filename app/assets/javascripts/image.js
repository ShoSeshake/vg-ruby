$(function() {

    // 変数定義
    var count = 0;
    // ドラックドロップを保持
    var list = new DataTransfer();
    // 1つのドロップボックスを定期
    var dropBox = $("#dropbox");

    var camera = $('.camera-image');
    var innerText = $('.inner_text');
    // ドラッグアンドドロップ枠を縮める関数
    function deleteWidth1(num) {
        if (num > 4) {
            var num = num - 5
        }
        var del = 615 - num * 126
        dropBox.css('width', `${del}px`)
    }
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
                    var html = `<li class="upload-item">
                                <a class="upload-item__delete" href="#" data-pict="${file.name}" id="pict-delete">×</a>
                              <img alt="test" src="${loadedImageUri}" class="upload-item__image">
                              </li>`;
                    if (count < 5) {
                        var num = input.files.length
                        num += edit_num
                        deleteWidth1(num)
                        dropBox.before(html);
                        if (count == 4) {
                            camera.css('display', `block`)
                            innerText.css('display', `none`)
                        }
                    } else if (count == 5) {
                        var num = input.files.length
                        num += edit_num
                        camera.css('display', `none`)
                        innerText.css('display', `block`)
                        dropBox.before(html);
                        deleteWidth1(num)
                    } else if (count == 10) {
                        dropBox.before(html);
                        dropBox.css('display', `none`)
                    } else if (count < 10) {
                        var num = input.files.length
                        num += edit_num
                        deleteWidth1(num)
                        dropBox.before(html);
                        if (count == 9) {
                            camera.css('display', `block`)
                            innerText.css('display', `none`)
                        }

                    } else if (count > 10) {
                        return false
                    }


                }
                reader.readAsDataURL(input.files[index])
            })
        }
    }

    // inputタグに変化があれば発火
    $(document).on("change", "#item-drop-zone", function() {
        count = $('.upload-item').length
        var edit_num = 0
        if ($('.pict-delete-edit').length) {
            edit_num = $('.pict-delete-edit').length
        }
        readURL(this, list, edit_num);
        appendFile(list);

    });

    // new - 削除ボタンがクリックされたら発火
    $(document).on("click", "#pict-delete", function(e) {
        e.preventDefault();
        var target = $(e.target);
        var pict_name = target.data('pict');
        target.parent().remove();
        if (document.querySelector('input[type=file]').files.length == 1) {
            $('input[type="file"]').val(null);
            list.clearData();
        } else {
            $.each(list.files, function(index, file) {
                if (file.name == pict_name) {
                    list.items.remove(index);
                    return false
                }
            })
            appendFile(list)
        }

        count -= 1
        maxspace = 4
        deleteWidth1(count)
        if (count == maxspace) {
            camera.css('display', `block`)
            innerText.css('display', `none`)
        } else if (count == 9) {
            camera.css('display', `block`)
            innerText.css('display', `none`)
            dropBox.css('display', `inline-block`)
        } else {
            camera.css('display', `none`)
            innerText.css('display', `block`)
        }
    })

    // edit - 削除ボタンがクリックされたら発火
    $(document).on("click", "#pict-delete-edit", function(e) {
        e.preventDefault();
        var target = $(e.target);
        var pict_id = target.data('delete');
        count = $('.upload-item').length
        target.parent().remove();

        count -= 1
        maxspace = 4
        deleteWidth1(count)
        if (count == maxspace) {
            camera.css('display', `block`)
            innerText.css('display', `none`)
        } else if (count == 9) {
            camera.css('display', `block`)
            innerText.css('display', `none`)
            dropBox.css('display', `inline-block`)
        } else {
            camera.css('display', `none`)
            innerText.css('display', `block`)
        }


        hidden_form = `<input type="hidden", name="[delete_ids][]", value="${pict_id}">`
        $('.target-box').append(hidden_form)

    })

});