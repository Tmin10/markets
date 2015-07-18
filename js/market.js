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
});