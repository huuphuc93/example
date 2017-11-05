// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require static_pages
//= require bootstrap-tagsinput

// $(document).ready(function(){
document.addEventListener("turbolinks:load", function() {
  $("input[data-role=tagsinput]").tagsinput();

  $('form#new_micropost').on('ajax:success', function(data, textStatus, jqXHR) {
    debugger;
    $('.microposts').prepend(data.detail[0].content);
  });

  // $('body').on('submit', 'form#new_micropost', function(event){
  //    event.preventDefault();
  //    var params = $('form#new_micropost').serialize();
  //    // alert(params);
  //    $.ajax({
  //       method: 'POST',
  //       url: '/microposts',
  //       dataType: 'json',
  //       data: params,
  //       success: function(data){
  //         debugger;
  //         $('.microposts').prepend(data.content);
  //         // location.reload();
  //         // console.log(data)
  //         // $('#result').append(data.content);
  //         $('#micropost_content').val('');
  //         // location.reload();
  //           // alert(data);
  //       },
  //       error: function(data) {
  //         $('.container').prepend('<div class="alert alert-danger">' + 'CREATE FAILURE' + '</div>');
  //       }
  //    });
  // });
});

$(document).ready(function(){
  $('.micropost-delete').on('click', function(){
    var postId = this.id;
    if(confirm("Are you sure?")){
      $.ajax({
        method: 'DELETE',
        url: '/microposts/' + postId,
        dataType: 'html',
        success: function(r){
          $('#micropost-'+ postId).remove();
        }
      });
    }
  });
});




// $(document).ready(function(){
//   $(".micropost-delete").click(function(){
//     alert("abc");
//   });
// })
