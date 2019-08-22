$(document).on('turbolinks:load', function () {
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#rhetoricImgPrev').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#post_img").change(function(){
        $('#rhetoricImgPrev').removeClass('hidden');
        $('.rhetoricPresentImg').remove();
        readURL(this);
    });
})