$(function(){

  $('.new_pledge').on('submit',function(e){
    e.preventDefault();
    console.log('click');
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize(),
      dataType: 'json',
    }).done(function(data){
      console.log(data);
      $('#total_amount').text(data);
    }).fail(function(){
      console.log('not so awesome');
    }).always(function(){
      console.log('we are awesome');
    });
  });



});
