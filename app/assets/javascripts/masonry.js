$(document).on('turbolinks:load', function() {
$(window).load(function(){

  $('#masonry-container').masonry({
    itemSelector: '.mas-box',
    columnWidth: 250,
    transitionDuration: 0,
    gutterWidth: 40,
    "fitWidth": true
  });

});
});