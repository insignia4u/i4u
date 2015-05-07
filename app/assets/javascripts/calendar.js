
$( document ).ready( function(){
  var cont = $('#js-content-article').html();

  var fechas = /\{\{calendar(.*?)\}\}/.exec(cont)[1].split(" ");
  console.log("<<<<<<<<<<<<<<<<<<<<<<------------------->>>>>>>>>>>>>>>>>>>>>>>>>><<<");
  console.log(fechas);

  var m = 0
  var c = 0
  for(i=1; i < fechas.length; i++){
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
  console.log(c);

  for(i=c-1; i >= 0; i--){
    if (typeof string === 'undefined'){
      var string = "<div id='calendar"+ i +"-dates' class='wrapper-calendar'><div class='out-of-print'><span>CUPOS AGOTADOS</span></div></div>"
    }else{
      string = string + "<div id='calendar"+ i +"-dates' class='wrapper-calendar'><div class='out-of-print'><span>CUPOS AGOTADOS</span></div></div>"
    }
  }

  cont = cont.replace(/\{{2}calendar(.*?)\}{2}/g, string);
  $('#js-content-article').html(cont);

  var cont_agotado = $('#js-content-article').html();
  if(cont_agotado.match(/\{\{agotado\}\}/)){
    cont_agotado = cont_agotado.replace(/\{\{agotado\}\}/, '');
    $('#js-content-article').html(cont_agotado);
    $('.out-of-print').show();
  }

  var a = 1;
  for(e=c; e > 0; e--){
    var array = [];
    var fIndex = m - (e -1);
    for(i=0; i < eval("fecha_"+fIndex+".length"); i++){
      var json = { title: 'Clase' + a, start: (eval("fecha_"+fIndex+"[i]")), allDay: false}
      console.log("++++++++++++++++++++++++++++++++++++++++++");
      console.log(eval("fecha_"+fIndex+"[i]"));
      console.log("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      array.push(json);
      a++;
    }

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
});
