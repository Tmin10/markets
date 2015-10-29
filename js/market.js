$(document).ready(function(){
  //initialize with defaults
  //$("#rating").rating();

  // with plugin options
  $(".rating-stars").rating({
    starCaptions: {
      1: "Очень плохо", 
      2: "Плохо", 
      3: "Нормально", 
      4: "Хорошо",
      5: "Отлично"
    },
    showClear: false
  });
  
  $('#post-review').submit(function() {
    var formdata = $('#post-review').serialize();
    $.post('ajax.php?act=ajax', formdata, function(data){
      
    });
    return false;
  });
  
  $('#add-language').click(function(){
    $('.review-text').last().after('<div class="form-group" class="language-select"><label>Язык отзыва</label><select class="form-control" name="language[]"><option value="1">Русский</option><option value="2">English</option></select></div><div class="form-group review-text"><label>Текст отзыва</label><textarea class="form-control" name="review[]" rows="3"></textarea></div>');
    return false;
  });
  
});