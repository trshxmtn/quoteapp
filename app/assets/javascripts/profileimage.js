$(document).on('turbolinks:load', function () {
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#userImgPrev').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#post_img").change(function(){
        $('#userImgPrev').removeClass('hidden');
        $('.userPresentImg').remove();
        readURL(this);
    });
})
