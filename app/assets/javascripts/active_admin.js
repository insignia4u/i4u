//= require jquery
//= require jquery-ui
//= require active_admin/base
//= require tinymce


$(document).ready(function(){
  makeTableSortable("#button-reorder-technologies", '#technologies');
  makeTableSortable("#button-reorder-tools",        '#tools');
  makeTableSortable("#button-reorder-people",       '#people');

  makeResourceImagePreviewed('project', ['image', 'featured image']);
  makeResourceImagePreviewed('featured_content', ['image']);

  $('head').append("<link href='../assets/insignia_logo_small.ico' rel='shortcut icon' />");
  $('head').append("<link href='../assets/iconos/insignia_ico_57.ico' rel='apple-touch-icon-precomposed' sizes='57x57' />");
  $('head').append("<link href='../assets/iconos/insignia_ico_114.ico' rel='apple-touch-icon-precomposed' sizes='114x114' />");
  $('head').append("<link href='../assets/iconos/insignia_ico_72.ico' rel='apple-touch-icon-precomposed' sizes='72x72' />");
  $('head').append("<link href='../assets/iconos/insignia_ico_144.ico' rel='apple-touch-icon-precomposed' sizes='144x144' />");

  return tinyMCE.init({
    selector: "textarea#training_topics",
    theme: "modern",
    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | emoticons",
    plugins: ["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker", "visualblocks visualchars fullscreen insertdatetime media nonbreaking", "save table contextmenu directionality emoticons template paste textcolor"]
  });
});

function makeTableSortable(dataSortUrlElementId, tableId ){
  if ( '#' + $('table').attr('id') !== tableId) {
    return;
  }

  var $reorder = $(dataSortUrlElementId);
  $reorder.css('display', 'none');

  var $table = $(tableId + ' tbody');

  var nroOfHeader = $(tableId + 'th').length;

  //Selecciona todos los td, excepto los de la última columna.
  var $handle = $table.find('tr td').not(':nth-child(' + nroOfHeader + ')');

  $handle.css('cursor', 'move');

  $table.sortable({
    items:  'tr',
    axis:   'y',
    cursor: 'move',
    handle: $handle,
    helper: function(e, ui) {
      //Mantiene el ancho de la fila completa.
      ui.children().each(function() {
        $(this).width($(this).width());
      });
      return ui;
    },

    stop:  function(event, ui) {
      $.ajax({
        url:     $reorder.attr('data-sort-url'), type: 'post',
        data:    $(this).sortable('serialize'),
        success: function(){
          $table.find('tr:odd').removeClass().addClass('even');
          $table.find('tr:even').removeClass().addClass('odd');
        }
      });
    }
  }).disableSelection();
}

function makeResourceImagePreviewed(resource, fields){
  var formsId = $("form[id]").attr("id");
  var mode    = '';

  if (formsId === 'new_' + resource) mode = 'new';
  if (formsId === 'edit_'+ resource) mode = 'edit';
  if (mode === '') return;

  fields.forEach(function(field){
    associatePreview(resource, field, mode);
  });
}

function associatePreview(resource, field, mode){
  field              = field.replace(/\s+/g, ' ');

  var fieldId        = field.replace(/\s/g,  '-');  // my-field
  var fieldName      = field.replace(/\s/g,  '_'); // my_field
  var previewAddedId = "preview-" + fieldId + "-added";

  var $fileInput  = $('li[id=' + resource +'_' + fieldName + "_input] :file").first();
  var $fileParent = $fileInput.parents('ol');

  var existingUrl = $fileInput.attr('url-data');
  var size        = $fileInput.attr('size-data').split('x');

  if(mode === 'edit' && existingUrl !== ''){
    //Load preview existing image.
    $fileParent.append(getLIToAppend(existingUrl, size[0], size[1], previewAddedId));
  }

  $fileInput.change(function(){
    var upload = $fileInput[0];

    $('#' + previewAddedId).remove();

    if (upload.files && upload.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e){
        $fileParent.append(getLIToAppend(e.target.result, size[0], size[1], previewAddedId));
      }
      reader.readAsDataURL(upload.files[0]);
    }
  });
}

function getLIToAppend(url, width, heigh, id){
  var size = "style = 'width: " + width + "px; height: " + heigh + "px'";
  return "<li id='" + id + "'> \
    <label class=' label'> Preview Image</label> \
    <img src='" + url + "'" + size +" /> \
  </li>";
}