$(document).on 'ready', ->
  $.cookie('antispam', true, { expires: 1, path: '/' });