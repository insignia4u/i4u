$(document).ready ->
    return if !$('.start').length
    oneDay = 24*60*60*1000;
    d = new Date()
    start = $('.start').data("start").split("-")
    date = new Date(start[0], start[1]-1, start[2])

    diffDays = Math.round((date.getTime()-d.getTime())/(oneDay));

    soon = $('.days-left')

    if diffDays == 0
        if !soon.hasClass('comming-soon')
            soon.addClass('comming-soon')
        soon.html "Inicia HOY"
    else
        if diffDays < 0
            if soon.hasClass('comming-soon')
                soon.removeClass('comming-soon')
        else
            if !soon.hasClass('comming-soon')
                soon.addClass('comming-soon')
            soon.html "Faltan " + diffDays + " días"

    if $('#noty_top_layout_container')
        $('#noty_top_layout_container').delay(4000).fadeOut('slow');