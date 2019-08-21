var startPos = 0,winScrollTop = 0;

$(document).on('turbolinks:load', function(){

    $(function () {
        var ua = navigator.userAgent;
        if ((ua.indexOf('iPhone') > 0 || ua.indexOf('Android') > 0) && ua.indexOf('Mobile') > 0) {
            // スマートフォン用処理
            $(window).on('scroll',function(){
                winScrollTop = $(this).scrollTop();
                if (winScrollTop >= startPos) {
                    $('.header').addClass('hideUp');
                    $('.footer').addClass('hideDown');
                    $('.rhetoric-new-btn').addClass('hideDown');
                } else {
                    $('.header').removeClass('hideUp');
                    $('.footer').removeClass('hideDown');
                    $('.rhetoric-new-btn').removeClass('hideDown');
                }
                startPos = winScrollTop;
            });
        
        } else {
            // PC用処理
        }
    })

});
