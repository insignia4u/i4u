$( document ).ready( function(){
  calendarCreator();
});

  function calendarCreator(){
    var cont = $('#js-content-article').html();
    var regex = /\{\{calendar_(.*?)\}\}/g;
    var calendar = cont.match(regex);
    var iterator = calendar.length
    var fechas = []

    for(i=1; i <= iterator;i++){
      fechas.push(getDates(i, cont));
      cont = replaceForDivs(i, cont);
    };

    $('#js-content-article').html(cont);
    attachSoldOut(fechas);

    for(i=0; i < fechas.length ; i++){
      showCalendar(i+1, fechas);
    }
  };

  function getDates(n, string){
    var dates_regex = new RegExp("\{\{calendar_"+ n +" (.*?)\}\}");
    var dates = string.match(dates_regex).pop();
    return dates;
  };

  function replaceForDivs(n, string){
    var dates_regex = new RegExp("\{\{calendar_"+ n +" (.*?)\}\}");
    var dates_array = string.match(dates_regex).pop().trim().split(" ");
    var month = 0;
    calendar_counter = 0;
    for (ii=0; ii < dates_array.length; ii++){
      current_month = dates_array[ii].split("-")[1]
      if (dates_array[ii].split("-")[2] === 1){
        current_month = current_month + 1
      }
      if (month != current_month){
        month = current_month;
        calendar_counter++;
      }else{
        month = month;
      }
    }
    for(z = calendar_counter ; z > 0; z--){
      if (typeof div_id === 'undefined'){
        var div_id = "<div id='calendar_"+ n + "' class='wrapper-calendar'></div>"
      }else{
        div_id = div_id + "<div id='calendar_"+ n + "' class='wrapper-calendar'></div>"
      }
      console.log(div_id.count);
    }
    var replaced_cont = string.replace(dates_regex, div_id);
    return replaced_cont;
  }

  function attachSoldOut(fechas){
    for(i=1; i <= fechas.length ; i++){
      last_element = fechas[i-1].split(" ").pop();
      if (new Date(last_element) == 'Invalid Date'){
        $('#calendar_'+i).append("<div class='out-of-print'><span>CUPOS AGOTADOS</span></div>");
        $(".out-of-print").show();
      }
    }
  }

  function getEvents(string_fechas){
    array_fechas = string_fechas.trim().split(" ");
    console.log("............................");
    console.log(string_fechas);
    var month = 0;
    var month_counter = -1;
    var month_array = [];
    x = 1;
    for(e = 0; e < array_fechas.length; e++){
      var date = array_fechas[e].split("-")[1];
      if (array_fechas[e].split("-")[2] === 1){
        date = date + 1
      }

      if( month !== date){
        if (array_fechas[e] != 'agotado'){
          month = date;
          month_counter++;
          month_array[month_counter] = [{title: 'Clase '+ x , start: array_fechas[e]}];
          console.log("===============")
          console.log(month_array.length);
        }
      }else{
        if (array_fechas[e] != 'agotado'){
          month = month;
        }
        x++;
          month_array[month_counter].push({title: 'Clase '+ x , start: array_fechas[e]});
      }
    }
    return month_array;
    }


  //  var x = 1;
  //     for(e = c ; e > 0; e--){
  //       var array = [];
  //       var fIndex = m - (e -1);
  //       for(i = 0; i < eval("fecha_"+fIndex+".length"); i++){
  //         var json = { title: 'Clase'+ " " + x , start: (eval("fecha_"+fIndex+"[i]")), allDay: false}
  //         array.push(json);
  //         x++;
  //       }
   
  //       $("#calendar"+(e-1)+"-dates").fullCalendar({
  //           header: {
  //               left: 'prev,next today',
  //               center: 'title',
  //               right: 'month',
  //           },
  //           slotEventOverlap: false,
  //           events: array,
  //           timeFormat: '(H:mm)'
  //       });
  //       $("#calendar"+(e-1)+"-dates").fullCalendar('gotoDate', array[0].start);
  //     }
  //   }
   
  // });


  function showCalendar(n, fechas){
    dates_array = getEvents(fechas[n-1]);
    for(m=0; m < dates_array.length; m++){
      var events = dates_array[m];
      if(events[0].start !== 'agotado'){
        $("#calendar_"+n).fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month',
            },
            slotEventOverlap: false,
            events: events,
            timeFormat: '(H:mm)'
        });

        $("#calendar_"+n).fullCalendar('gotoDate', events[0].start);
      }
    }
  }
