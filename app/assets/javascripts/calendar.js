$( document ).ready( function(){
  $('.reset-calendar-counter').each(function(){
    var x = 1;
    $(this).find('.wrapper-calendar').each(function(){
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
          timeFormat: '(H:mm)',
          monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
          monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
          dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
          dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb']
        });

        $(this).fullCalendar('gotoDate', dates[0].start);
    });
  });

});
