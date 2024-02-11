const targetDayOfMonth = 1;

const currentDate = new Date();

const currentDateOfMonth = currentDate.getDate();

if (currentDateOfMonth === targetDayOfMonth) {
  alert('今日はおこずかいをもらう日です')
}