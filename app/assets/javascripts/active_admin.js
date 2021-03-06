//= require jquery
//= require jquery-ui
//= require active_admin/base


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

  if ($('#js_toggle_presale').length) {

    var presaleCheck = $('#js_toggle_presale');
    var presaleTitle = $('.js_toggle_presale_title');
    var presalePrice = $('.js_toggle_presale_price');
    var presalePayment = $('.js_toggle_presale_payment');
    var presaleExpiration = $('.js_toggle_presale_expiration');
    var presaleDiscount = $('.js_toggle_presale_discount');

    var disablePresaleFields = function () {
      presaleTitle.prop('disabled', true);
      presalePrice.prop('disabled', true);
      presalePayment.prop('disabled', true);
      presaleExpiration.prop('disabled', true);
      presaleDiscount.prop('disabled', true);
    }

    var enablePresaleFields = function () {
      presaleTitle.prop('disabled', false);
      presalePrice.prop('disabled', false);
      presalePayment.prop('disabled', false);
      presaleExpiration.prop('disabled', false);
      presaleDiscount.prop('disabled', false);
    }

    if (presaleCheck.prop('checked')) {
      enablePresaleFields();
    }

    presaleCheck.on('click', function () {
      if (presaleCheck.prop('checked')) {
        enablePresaleFields();
      } else {
        disablePresaleFields();
      }
    });
  }
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