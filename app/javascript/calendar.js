window.addEventListener('turbo:load', function() {
  // 各日にクリックイベントを追加
  const calendarDays = document.querySelectorAll('.calendar-day');
  calendarDays.forEach(function(day) {
    day.addEventListener('click', function() {
      this.setAttribute("style", "background-color: yellow;")
    });
  });
});
