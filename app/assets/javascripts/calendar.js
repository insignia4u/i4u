$( document ).ready( function(){
  $('.wrapper-calendar').each(function(){
    var month = $(this).find('.hidden-dates').html().trim().split(" ");

    console.log("-----------------");
    console.log(month);
    var dates = [];
    for (var i = 0; i < month.length; i++ ){
      var json = { title: 'Clase ' + (i +1), start: month[i], allDay: false}
      dates.push(json);
    }
    console.log(dates)
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
    console.log("<<<<<<<<<<<<<<<<<<<")
      console.log(dates[0])
      $(this).fullCalendar('gotoDate', dates[0].start);
  });
});

// $('.calendar').each(function(){
//   var month = $(this).html().split(" ");
//   var array = []
//   for (var i = 0; i < month.length; i++) {
//     array.push(month[i]);
//     $('#result').append( month[i] + "<hr>");
//   }
//   $('#result').append("-------<hr>");
//   alert(array);
// });