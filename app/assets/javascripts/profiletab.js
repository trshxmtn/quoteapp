$(document).on('turbolinks:load', function() {
    $('.profile-tab-contents > div').hide();

    $('.profile-tab').click(function () {
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

        $('.profile-tab-contents > div').hide().filter(this.hash).fadeIn();

        $('.profile-tab').removeClass('active');
        $(this).addClass('active');

        return false;
    }).filter(':eq(0)').click();
});