$( document ).ready( function(){
  x = 1;
  $('.wrapper-calendar').each(function(){
    var month = $(this).find('.hidden-dates').html().trim().split(" ");

    var dates = [];
    for (var i = 0; i < month.length; i++ ){
      var json = { title: 'Clase ' + x , start: month[i], allDay: false}
      dates.push(json);
      x++;
    }

    $(this).fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month',
        },
        slotEventOverlap: false,
        events: dates,
        timeFormat: '(H:mm)'
      });

      $(this).fullCalendar('gotoDate', dates[0].start);
  });
});
