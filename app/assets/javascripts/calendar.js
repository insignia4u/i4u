$( document ).ready( function(){
  var cont = $('#content-calendar').html();

  var fechas = /\{\{calendar(.*?)\}/.exec(cont)[1].split(" ");

  cont = cont.replace(/\{{2}calendar(.*?)\}{2}/g, "<div id='calendar-dates' class= 'content-calendar'></div>");
  $('#content-calendar').html(cont);

  var cont_agotado = $('#content-calendar').html();
  if(cont_agotado.match(/\{\{agotado\}\}/)){
      console.log("se emcontro");
      cont_agotado = cont_agotado.replace(/\{\{agotado\}\}/, '');
      $('#content-calendar').html(cont_agotado);
      $('.out-of-print').show();
  }
  var array = [];
  for(i=1; i < fechas.length; i++){
    var json = { title: 'Clase ' + i, start: (fechas[i]), allDay: false}
      array.push(json);
  }

  $("#calendar-dates").fullCalendar({
      header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month',
      },
      slotEventOverlap: false,
      events: array,
      timeFormat: 'H:mm'
  });
})