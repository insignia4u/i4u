$( document ).ready( function(){
  var cont = $('#content-article').html();

  var fechas = /\{\{calendar(.*?)\}/.exec(cont)[1].split(" ");

  cont = cont.replace(/\{{2}(.*?)\}{2}/g, "<div id='calendar-dates'></div>");
  $('#content-article').html(cont);

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
})