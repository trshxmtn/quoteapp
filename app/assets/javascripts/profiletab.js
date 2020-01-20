$(document).on('turbolinks:load', function() {
    $('.profile-tab-contents > div').hide();

    $('.profile-tab').click(function () {
        
        $('.profile-tab-contents > div').hide().filter(this.hash).fadeIn();

        $('.profile-tab').removeClass('active');

        $(this).addClass('active');

        return false;
    }).filter(':eq(0)').click();
});