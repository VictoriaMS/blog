$(document).on('turbolinks:load', function(){
  $('a.edit-link').click(function(e){
    e.preventDefault();
    let commentId = $(this).data('commentId')
    $(this).toggle()
    $('form#edit-comment-' + commentId ).toggle()
  })
})
