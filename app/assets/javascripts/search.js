$(document).on('turbolinks:load', function (){
    $(document).on('keyup', '#rhetoric_search', function(e){
        e.preventDefault();
        var input = $.trim($(this).val());
        $.ajax({
            url: '/',
            type: 'GET',
            date: ('keyward' +input),
            processData: false, //おまじない
            contentType: false, //おまじない
            dataType: 'json' //データ形式を指定
        })
            .done(function (date) {
                $('#result')
                
            })
    })
});