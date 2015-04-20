$( document ).ready( function(){

  var cont = $('#content-article').html();

  var fechas = /\{\{calendar(.*?)\}\}/.exec(cont)[1].split(" ");

  cont = cont.replace(/\{{2}calendar(.*?)\}{2}/g, "<div id='calendar-dates'></div>");
  $('#content-calendar').html(cont);

  var cont_agotado = $('#content-calendar').html();
  if(cont_agotado.match(/\{\{agotado\}\}/)){
      console.log("se emcontro lñararara");
      cont_agotado = cont_agotado.replace(/\{\{agotado\}\}/, '');
      $('#content-calendar').html(cont_agotado);
      $('.out-of-print').show();
  }

  var array = [];
  for(i=1; i < fechas.length; i++){
    var json = { title: 'clase ' + i, start: (fechas[i]), allDay: false}
      array.push(json);
  }

  $("#calendar-dates").fullCalendar({
      header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month',
          color: 'red'
      },
      events: array,
      timeFormat: 'H(:mm)'
  });
  $('#calendar-dates').fullCalendar('gotoDate', array[1].start);

  //second_calendar

  var content = $('#content-second-calendar').html();

  var fechas2 = /\{\{calendar2(.*?)\}\}/.exec(content)[1].split(" ");

  content = content.replace(/\{{2}calendar2(.*?)\}{2}/g, "<div id='calendar-dates-second'></div>");
  $('#content-second-calendar').html(content);

  var content_agotado = $('#content-second-calendar').html();
  if(content_agotado.match(/\{\{agotado\}\}/)){
      console.log("se emcontro asdsadsdasd");
      content_agotado = content_agotado.replace(/\{\{agotado\}\}/, '');
      $('#content-second-calendar').html(content_agotado);
      $('.out-of-print-second').show();
  }

    var array2 = [];
  for(i=1; i < fechas2.length; i++){
    var json = { title: 'Clase ' + i, start: (fechas2[i]), allDay: false}
      array2.push(json);
  }

  $("#calendar-dates-second").fullCalendar({
      header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month',
      },
      slotEventOverlap: false,
      events: array2,
      timeFormat: 'H:mm'
  });
  $('#calendar-dates-second').fullCalendar('gotoDate', array2[1].start);
})
