$(document).ready(function() {
  $('.comment-form__header__collapse-toggle').click(function(e) {
    e.preventDefault();

    $(this).toggleClass('comment-form__header__collapse-toggle--collapsed');
    $('.comment-form__body').toggleClass('comment-form__body--collapsed');
  });
});
