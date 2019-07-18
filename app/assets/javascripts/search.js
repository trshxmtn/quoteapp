$(document).on('turbolinks:load', function (){
    $(document).on('keyup', '#rhetoric_search', function(){
        $("#rhetoric_search").find("input[type='submit']").click()
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