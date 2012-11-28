//= require jquery
//= require jquery-ui
//= require active_admin/base

$(document).ready(function(){
  var $reorder = $("#button-reorder-technologies");
  $reorder.css('display', 'none');

  var $table = $('#technologies tbody');

  $table.find('tr').find('td:first').css('cursor', 'move');

  $table.sortable({
    items: 'tr',
    axis: "y",
    cursor: "move",
    handle: $table.find('tr').find('td:first'),
    helper: function(e, ui) {
      ui.children().each(function() {
        $(this).width($(this).width());
      });
      return ui;
    },

    stop: function(event, ui) {
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
})