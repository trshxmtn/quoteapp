$(document).on('turbolinks:load', function() {

  if (window.matchMedia( '(min-width: 767px)' ).matches) {
    $('#masonry-container').masonry({
      itemSelector: '.mas-box',
      columnWidth: 400,
      transitionDuration: 0,
      gutterWidth: 40,
      "fitWidth": true
    });
  } else {
    $('#masonry-container').masonry({
      itemSelector: '.mas-box',
      columnWidth: 100%,
      transitionDuration: 0,
      gutterWidth: 40,
      "fitWidth": true
    });
  };

});
