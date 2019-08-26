$(document).on('turbolinks:load', function () {
    var $textarea = $('.textareaHeight1');
    var lineHeight = parseInt($textarea.css('lineHeight'));
    $textarea.on('input', function(e) {
      var lines = ($(this).val() + '\n').match(/\n/g).length;
      $(this).height(lineHeight * lines);
    });
  });

$(document).on('turbolinks:load', function () {
var $textarea = $('.textareaHeight2');
var lineHeight = parseInt($textarea.css('lineHeight'));
$textarea.on('input', function(e) {
    var lines = ($(this).val() + '\n').match(/\n/g).length;
    $(this).height(lineHeight * lines);
});
});