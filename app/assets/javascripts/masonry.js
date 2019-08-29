$(document).on('turbolinks:load', function() {
  var $container = $('#masonry-container');
  $container.imagesLoaded(function(){
    if (window.matchMedia( '(max-width: 767px)' ).matches) {
      $('#masonry-container').masonry({
        itemSelector: '.mas-box',
        transitionDuration: 0,
        gutterWidth: 40,
        "fitWidth": true
      });
    } else {
      $('#masonry-container').masonry({
        itemSelector: '.mas-box',
        columnWidth: 400,
        transitionDuration: 0,
        gutterWidth: 40,
        "fitWidth": true
      });
    };
  });
});