$(document).on 'ready', ->
  unless $.cookie('antispam')
    $.cookie('antispam', true, { expires: 1, path: '/' });