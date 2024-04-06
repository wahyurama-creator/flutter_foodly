String getTimeOfTheDay() {
  var hour = DateTime.now().hour;
  if (hour >= 0 && hour < 12) {
    return ' ☀️ ';
  } else if (hour >= 12 && hour < 16) {
    return ' 🌤️ ';
  } else {
    return ' 🌙 ';
  }
}
