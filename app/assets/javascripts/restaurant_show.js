$(function() {
    var vfModal = $('#vf-level-modal');
    var vfBtn = $('.restaurant-show__box__level');
    vfBtn.on('click', function() {
        vfModal.fadeToggle();
    })
    var detailBtn = $('#detail-btn');
    var commentBtn = $('#comment-btn');
    var detailBox = $('.restaurant-show__detail');
    var commentBox = $('.restaurant-show__comment');
    detailBtn.on('click', function() {
        detailBox.fadeIn(500);
        commentBox.hide();
    })
    commentBtn.on('click', function() {
        commentBox.fadeIn(500);
        detailBox.hide();
    })

    var commentForm = $('.restaurant-show__form');
    var formBtn = $('.restaurant-show__comment__form-btn');
    formBtn.on('click', function() {
        commentForm.fadeIn(500);
        formBtn.parent().hide();
    })
    $(document).on('click', '.detail-modal__container__close', function() {
        $('.detail-modal').remove();
    })
})
$(function() {
    var subs = $('.rest-sub-photo');
    subs.on('click', function() {
        var src = $(this).data('photo')
        $('.restaurant-photo').attr('src', src)
    });
})