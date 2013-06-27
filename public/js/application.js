$(document).ready(function() {
  $('.failed_login').hide();
  $('.login_area').on('submit', function(e){
    e.preventDefault();
    var input_data = $(this).serialize();
    console.log(input_data);
    $.post('/login',input_data).done(function(responseData){
      console.log(responseData);
      if (input_data === '')
      {
        $('.failed_login').show();
      }
    });   
  });
});
