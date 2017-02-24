// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  var container = $('.update-container');
  var updater = $('.new-update-container');
    $('#show-updates').on('click', function(){
      var projectId = $('.container').attr('data-project-id');
      console.log(projectId)
      $.ajax({
        url: '/projects/' + projectId + '/updates',
        method: 'GET',
        dataType: 'json'
      }).done(function(responseData) {
        console.log(responseData);
        responseData = $.grep(responseData, function(x) {
          return x.project_id == projectId;
        });
        console.log(responseData);
        $.each(responseData, function(index, project){
        container.append(
          '<h3> Updates: ',
          'Project ID: ' + project.project_id + '</li><br>',
          'User ID: ' + project.user_id + '</li><br>',
          'Update Message: ' + project.body + '</li><br>');
      });
    });
    });
  });
  $('#create-update').on('click', function(e){
    var projectId = $('.container').attr('data-project-id');
    // console.log(projectId)
    $.ajax({
      url: '/projects/' + projectId + '/updates/new',
      method: 'GET',
      dataType: 'html'
    }).done(function(responseData) {
      console.log(responseData);
      // updater.append(
});
});



// - alternative method: look at URL, parse :project_id out with reg exp
// - window.location
