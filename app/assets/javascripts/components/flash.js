$(document).ready(function() {
  $('.flash__message').each(function(index, item) {
    var flashType = $(item).find('.flash__message__type').text();
    var flashMessage = $(item).find('.flash__message__text').text();

    switch (flashType) {
      case 'success':
        toastr.success(flashMessage, 'Success');
        break;
      case 'error':
        toastr.error(flashMessage, 'Error');
        break;
      default:
        break;
    }
  });
});
