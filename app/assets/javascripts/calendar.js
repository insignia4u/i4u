// $( document ).ready( function(){
//   calendarCreator();
// });

//   function calendarCreator(){
//     var cont = $('#js-content-article').html();
//     var regex = /\{\{calendar_(.*?)\}\}/g;
//     var calendar = cont.match(regex);
//     var iterator = calendar.length
//     var fechas = []

//     for(i=1; i <= iterator;i++){
//       fechas.push(getDates(i, cont));
//       cont = replaceForDivs(i, cont);
//     };

//     $('#js-content-article').html(cont);
//     attachSoldOut(fechas);

//     for(i=0; i < fechas.length ; i++){
//       showCalendar(i+1, fechas);
//     }
//   };

//   function getDates(n, string){
//     var dates_regex = new RegExp("\{\{calendar_"+ n +" (.*?)\}\}");
//     var dates = string.match(dates_regex).pop();
//     return dates;
//   };

//   function replaceForDivs(n, string){
//     var dates_regex = new RegExp("\{\{calendar_"+ n +" (.*?)\}\}");
//     var dates_array = string.match(dates_regex).pop().trim().split(" ");
//     var replaced_cont = string.replace(dates_regex, "<div id='calendar_"+ n + "' class='wrapper-calendar'></div>");
//     return replaced_cont;
//   }

//   function attachSoldOut(fechas){
//     for(i=1; i <= fechas.length ; i++){
//       last_element = fechas[i-1].split(" ").pop();
//       if (new Date(last_element) == 'Invalid Date'){
//         $('#calendar_'+i).append("<div class='out-of-print'><span>CUPOS AGOTADOS</span></div>");
//         $('.out-of-print').show();
//       }
//     }
//   }

//   function getEvents(string_fechas){
//     ary_fechas = string_fechas.trim().split(" ");
//     var month = 0;
//     var month_counter = -1;
//     var month_array = [];
//     x = 1;
//     for(e = 0; e < ary_fechas.length; e++){
//       var date = parseInt(ary_fechas[e].split("-")[1]);
//       if( month != date ){
//         month = date;
//         month_counter++;
//         month_array[month_counter] = [{title: 'Clase '+ x, start: ary_fechas[e], allDay: false}];
//       }else{
//         if (ary_fechas[e] != 'agotado'){
//           month_array[month_counter].push({title: 'Clase '+ x, start: ary_fechas[e], allDay: false});
//         }
//       }
//     x++;
//     }
//     return month_array;
//   }

//   function showCalendar(n, fechas){
//     dates_array = getEvents(fechas[n-1]);
//     for(m=0; m < dates_array.length; m++){
//       var events = dates_array[m];
//       if(events[0].start != 'agotado'){
//         $("#calendar_"+n).fullCalendar({
//             header: {
//                 left: 'prev,next today',
//                 center: 'title',
//                 right: 'month',
//             },
//             slotEventOverlap: false,
//             events: events,
//             timeFormat: '(H:mm)'
//         });

//         $("#calendar_"+n).fullCalendar('gotoDate', events[0].start);
//       }
//     }
//   }