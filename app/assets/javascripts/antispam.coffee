$(document).on 'ready', ->
  if $.cookie('antispam')
    $.cookie('antispam', true, { expires: 1, path: '/' });