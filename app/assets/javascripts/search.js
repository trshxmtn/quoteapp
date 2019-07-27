$(document).on('turbolinks:load', function (){
    var preFunc = null;
    var preInput = '';
    var input = '';
    var timeoutValue = 10;

    ajaxPost = function () {
        $('#rhetoric_search').ajaxSubmit({
            url: '/rhetorics/',
            type: 'get'
        });
    }

    $('#q_meigen_or_tags_name_cont').on('keyup', function () {
        input = $.trim($(this).val());

        if(preInput !== input){
            clearTimeout(preFunc);
            preFunc = setTimeout("ajaxPost()", timeoutValue);
        }
        preInput = input;
    })
});