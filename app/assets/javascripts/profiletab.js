$(document).on('turbolinks:load', function() {
    $('.profile-contents > div').hide();

    $('.tab').click(function () {
        $('.profile-contents > div').hide().filter(this.hash).fadeIn();
 
        $('.tab').removeClass('active');
        $(this).addClass('active');
 
        return false;
    }).filter(':eq(0)').click();
});