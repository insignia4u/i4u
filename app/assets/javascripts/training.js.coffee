$(document).ready ->
    return if !$('.start').length
    oneDay = 24*60*60*1000;
    d = new Date()
    start = $('.start').data("start").split("-")
    date = new Date(start[0], start[1]-1, start[2])

    diffDays = Math.ceil((date.getTime()-d.getTime())/(oneDay));

    soon = $('.days-left')

    if diffDays == 0
        if !soon.hasClass('comming-soon')
            soon.addClass('comming-soon')
        soon.html "Inicia HOY"
    else if diffDays < 0
        if !soon.hasClass('comming-soon')
            soon.addClass('comming-soon')
        soon.html "Curso iniciado"
    else if diffDays == 1
        if !soon.hasClass('comming-soon')
            soon.addClass('comming-soon')
        soon.html "Comienza mañana"
    else
        if !soon.hasClass('comming-soon')
            soon.addClass('comming-soon')
        soon.html "Faltan " + diffDays + " días"

    if $('#noty_top_layout_container')
        $('#noty_top_layout_container').delay(4000).fadeOut('slow');

    $('.js-buynow').on 'click', (e) ->
        e.preventDefault()
        payment_top = $('.payment-info').offset().top
        $('body, html').animate {scrollTop: payment_top}, 500