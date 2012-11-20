$(window).load(function(){
  $('#attach-new-file').click(function() {
      $('#attach-file').trigger('click');
  });

  $('#attach-file').change(function() {
      fileToUploadChanged($(this).val());
  });
})

function fileToUploadChanged(pathFile){
  if(!pathFile || 0 === pathFile.length){
   deleteFileToUploadClicked();
  } else {
    $('#attachment-files').append('<li><img src="assets/other/clip.png"/><p><b>'
      + pathFile.split(/\\|\//).slice(-1) +
      '</b><a class="more" id="deleteFileToDelete" href="#">Delete file</a></p>');

    $('#deleteFileToDelete').click(function(event){deleteFileToUploadClicked()});
    $('#attach-new-file').hide();
}
  }

function deleteFileToUploadClicked(event){
  $('#attachment-files li').remove();
  $('#attach-file').replaceWith($('#attach-file').clone(true)); //Reset file to upload
  $('#attach-new-file').show();
}