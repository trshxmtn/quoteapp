// $(document).on('turbolinks:load', function (){
    $(window).on('scroll', function() {
        scrollHeight = $(document).height();
        scrollPosition = $(window).height() + $(window).scrollTop();
        if ( (scrollHeight - scrollPosition) / scrollHeight === 0) {
            $('.jscroll').jscroll({
                contentSelector: '.main-rhetorics-index',
                nextSelector: 'span.next:last a'
            });
        }
    });
// });