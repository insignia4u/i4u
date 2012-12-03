//= require jquery
//= require jquery-ui
//= require active_admin/base

$(document).ready(function(){
  makeTableSortable("#button-reorder-technologies", '#technologies');
  makeTableSortable("#button-reorder-tools",        '#tools');
  makeTableSortable("#button-reorder-people",       '#people');
})

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