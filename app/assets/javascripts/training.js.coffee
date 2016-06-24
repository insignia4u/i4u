$(document).ready ->
    oneDay = 24*60*60*1000;
    d = new Date()
    start = $('.start').data("start").split("-")
    date = new Date(start[0], start[1]-1, start[2])

    diffDays = Math.round(Math.abs((d.getTime() - date.getTime())/(oneDay)));

    soon = $('.comming-soon')
    soon.html "Faltan " + diffDays + " días"