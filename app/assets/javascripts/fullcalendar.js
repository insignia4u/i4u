$("#calendar").fullCalendar({
  header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month',
  },
  slotEventOverlap: false,
  timeFormat: '(H:mm)'
});
