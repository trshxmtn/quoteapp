$(document).on('turbolinks:load', function() {
  var $container = $('#masonry-container');
  $container.imagesLoaded(function(){
    if (window.matchMedia( '(max-width: 767px)' ).matches) {
      $('#masonry-container').masonry({
        itemSelector: '.masonry-item',
        transitionDuration: 0,
        gutterWidth: 40,
        "fitWidth": true
      });
    } else {
      $('#masonry-container').masonry({
        itemSelector: '.masonry-item',
        columnWidth: 400,
        transitionDuration: 0,
        gutterWidth: 40,
        "fitWidth": true
      });
    };
  });
});