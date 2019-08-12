$(document).on('turbolinks:load', function() {

  if (window.matchMedia( '(max-width: 767px)' ).matches) {

    var $grid = $('#masonry-container').masonry({
      itemSelector: 'none',
      transitionDuration: 0,
      gutterWidth: 40,
      "fitWidth": true
    });
  } else {
    var $grid = $('#masonry-container').masonry({
      itemSelector: 'none',
      columnWidth: 400,
      transitionDuration: 0,
      gutterWidth: 40,
      "fitWidth": true
    });
  };

  var msnry = $grid.data('masonry');

  $grid.imagesLoaded( function() {
    $grid.removeClass('are-images-unloaded');
    $grid.masonry( 'option', { itemSelector: '.mas-box rheotorics-index-grid' });
    var $items = $grid.find('.mas-box rheotorics-index-grid');
    $grid.masonry( 'appended', $items );
  });


  $('#masonry-container').infiniteScroll({
    path: "nav.pagination a[rel=next]",
    append: '.mas-box rheotorics-index-grid',
    history: false,
  });


});
