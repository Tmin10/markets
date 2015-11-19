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
  
  $('#post-review').on ('submit', function() {
    var formdata = $('#post-review').serialize();
    $.post('ajax.php?act=post', formdata, function(data){
      
    }, 'json');
    return false;
  });
  
  $('#add-language').on('click', function (){
    $('.review-text').last().after('<div class="form-group" class="language-select"><label>Язык отзыва</label><select class="form-control" name="language[]"><option value="1">Русский</option><option value="2">English</option></select></div><div class="form-group review-text"><label>Текст отзыва</label><textarea class="form-control" name="review[]" rows="3"></textarea></div>');
    return false;
  });
  
  $('.answer-link').on('click', function (){
    $(this).parent('div.answer-box').children('.answer-form').toggle();
    return false;
  });
  
  $('.answer-form').on ('submit', function() {
    console.log('sent comment');
    var formdata = $(this).serialize();
    $.post('ajax.php?act=post', formdata, function(data){
      if (data.success)
      {
        var date = new Date();
        var dateText = ('0'+date.getDate()).slice(-2)+'-'+('0'+(date.getMonth()+1)).slice(-2)+'-'+date.getFullYear()+' '+('0'+date.getHours()).slice(-2)+':'+('0'+date.getMinutes()).slice(-2);
        $('.comments-box').append('<div class="comment">Юзер '+' ('+dateText+'):<br />'+$('.answer-form textarea[name="comment"]').val()+'</div>');
        $('.review-comments').html('Комментарии ('+data.comments_count+')');
        $('.answer-form').hide();
        $('.answer-form textarea[name="comment"]').val('');
      }
      else
      {
        alert(data.errors);
      }
    }, 'json');
    return false;
  });
  
  $('.review-comments').on ('click', function(){
    if ($('.comments-box').is(':visible'))
    {
      $('.comments-box').hide();
      $('.comments-box').empty();
    }
    else
    {
      $('.comments-box').html('Loading...');
      $('.comments-box').show();
      var review_id = $(this).data('id');
      $.post('ajax.php?act=get', {'type': 'get_comments', 'id': review_id}, function (data) {
          if (data.success)
          {
            $('.comments-box').empty();
            $.each(data.comments, function (index, value) {
              var date = new Date(value[2]*1000);
              var dateText = ('0'+date.getDate()).slice(-2)+'-'+('0'+(date.getMonth()+1)).slice(-2)+'-'+date.getFullYear()+' '+('0'+date.getHours()).slice(-2)+':'+('0'+date.getMinutes()).slice(-2);
              $('.comments-box').append('<div class="comment">Юзер '+value[0]+' ('+dateText+'):<br />'+value[1]+'</div>');
            });
          }
      }, 'json');
    }
    return false;
  });
  
});