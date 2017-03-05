function initCommentButtons() {
  $('.comment').each(function(index, item) {
    var jqComment = $(item);
    var jqModal       = jqComment.find('.comment-form-wrapper').first();
    var jqOpenButton  = jqComment.find('.comment__footer__reply-button').first();
    var jqCloseButton = jqModal.find('.comment-form__header__close-button');

    jqCloseButton.click(function(e) {
      e.preventDefault();

      jqModal.toggleClass('comment-form-wrapper--hidden');
    });

    jqOpenButton.click(function(e) {
      e.preventDefault();

      jqModal.toggleClass('comment-form-wrapper--hidden');
    });
  });

  $('.post').each(function(index, item) {
    var jqPost  = $(item);
    var jqModal = $('.comment-form-wrapper').first();
    var jqOpenButton = jqPost.find('.post__footer__comment-button');
    var jqCloseButton = jqModal.find('.comment-form__header__close-button');

    jqCloseButton.click(function(e) {
      e.preventDefault();

      jqModal.toggleClass('comment-form-wrapper--hidden');
    });

    jqOpenButton.click(function(e) {
      e.preventDefault();

      jqModal.toggleClass('comment-form-wrapper--hidden');
    });
  });
}

$(document).ready(function() {
  initCommentButtons();
});
