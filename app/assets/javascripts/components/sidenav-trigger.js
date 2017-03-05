$(document).ready(function() {
  $('.sidenav-trigger__button').click(function() {
    $('.sidenav').removeClass('sidenav--hidden');
  });

  $('.main-container').click(function() {
    $('.sidenav').addClass('sidenav--hidden');
  });
});
