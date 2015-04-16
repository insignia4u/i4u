$( document ).ready( function(){
  var cont = $('#content-article').html();

  var fechas = /\{\{calendar(.*?)\}/.exec(cont)[1].split(" ");

  cont = cont.replace(/\{{2}(.*?)\}{2}/g, "<div id='calendar-dates' class= 'content-calendar'></div>");
  $('#content-article').html(cont);

  var array = [];
  for(i=1; i < fechas.length; i++){
    var json = { title: 'hs clase ' + i, start: (fechas[i]), allDay: false}
      array.push(json);
  }

  $("#calendar-dates").fullCalendar({
      header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month',
      },
      editable: true,
      allDaySlot: false,
      slotEventOverlap: false,
      events: array,
      timeFormat: 'H(:mm)'
  });
})