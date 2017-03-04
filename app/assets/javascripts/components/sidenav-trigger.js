$(document).ready(function() {
  $('.sidenav-trigger__button').click(function() {
    $('.sidenav').removeClass('sidenav--hidden');
  });

  $('.wrapper').click(function() {
    $('.sidenav').addClass('sidenav--hidden');
  });
});
