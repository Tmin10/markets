$(document).ready(function(){
  // initialize with defaults
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
    clearCaption: "Не выбрано"
  });
  
  $('#post-review').submit(function() {
    
    return false;
  });
  
  $('#add-language').click(function(){
    $('.review-text').last().after('<div class="form-group" class="language-select"><label for="language">Язык отзыва</label><select id="language" class="form-control"><option value="1">Русский</option><option value="2">English</option></select></div><div class="form-group" class="review-text"><label for="exampleInputEmail1">Текст отзыва</label><textarea class="form-control" rows="3"></textarea></div>');
    return false;
  });
  
});