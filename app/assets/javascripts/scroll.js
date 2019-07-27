$(document).on('turbolinks:load', function (){
    $(window).on('scroll', function() {
        scrollHeight = $(document).height();
        scrollPosition = $(window).height() + $(window).scrollTop();
        if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
            $('.jscroll').jscroll({
                contentSelector: '.rheotorics-index-grid',
                nextSelector: 'span.next:last a'
            });
        }
    });


    // $('.jscroll').jscroll({
    //     contentSelector: '.rheotorics-index-grid',
    //     nextSelector: 'span.next:last a'
    // });
});