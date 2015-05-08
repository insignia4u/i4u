
$( document ).ready( function(){

  var cont = $('#js-content-article').html();
  var regex = /\{\{calendar(.*?)\}\}/g;
  var calendar = cont.match(regex);

  for (a = 0; a < calendar.length; a++){

    var regex_i = /\{\{calendar\s(.*?)\}\}/;

    var regex_agotado = /\{\{agotado\}\}/;

    fechas = calendar[a].match(regex_i)[1].trim().split(" ");

    var m = 0
    var c = 0
    for(i = 0; i < fechas.length; i++){
      var d = new Date(fechas[i].split("T")[0]);

      if (m != d.getMonth()){
        m = d.getMonth();
        c++;
        eval("var fecha_"+m+"= [fechas[i]];");

      }
      else{
        eval("fecha_"+m+".push(fechas[i]);");
      }
    }

    for(i = c ; i >= 0; i--){
      if (typeof string === 'undefined'){
        var string = "<div id='calendar"+ i + "-dates' class='wrapper-calendar'><div class='out-of-print'><span>CUPOS AGOTADOS</span></div></div>"
      }else{
        string = string + "<div id='calendar"+ i + "-dates' class='wrapper-calendar'><div class='out-of-print'><span>CUPOS AGOTADOS</span></div></div>"
        console.log("calendar"+ i +"-dates")
      }
    }

    cont = cont.replace((calendar[a]), string + "asdasdasdasdasd" + a);
    $('#js-content-article').html(cont);

    var cont_agotado = $('#js-content-article').html();
    if(cont_agotado.match(regex_agotado)){
      cont_agotado = cont_agotado.replace(regex_agotado, '');
      $('#js-content-article').html(cont_agotado);
      $('.out-of-print').show();
    }

    var x = 1;
    for(e=c; e > 0; e--){
      var array = [];
      var fIndex = m - (e -1);
      for(i=0; i < eval("fecha_"+fIndex+".length"); i++){
        var json = { title: 'Clase' + x, start: (eval("fecha_"+fIndex+"[i]")), allDay: false}
        console.log("++++++++++++++++++++++++++++++++++++++++++");
        console.log(eval("fecha_"+fIndex+"[i]"));
        array.push(json);
        x++;
      }

      console.log(e);

      $("#calendar"+(e-1)+"-dates").fullCalendar({
          header: {
              left: 'prev,next today',
              center: 'title',
              right: 'month',
          },
          slotEventOverlap: false,
          events: array,
          timeFormat: '(H:mm)'
      });
      $("#calendar"+(e-1)+"-dates").fullCalendar('gotoDate', array[0].start);
    }
  console.log(">>>>>>>>>>>>>>><< CONTADOR GENERAL AQUI >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  console.log(a);
  }

});
