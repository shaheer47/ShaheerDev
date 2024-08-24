int calculateYears(DateTime fromDate) {
  DateTime currentDate = DateTime.now();
  int years = currentDate.year - fromDate.year;

  // Check if the current date is before the birthday in the current year
  if (currentDate.month < fromDate.month ||
      (currentDate.month == fromDate.month && currentDate.day < fromDate.day)) {
    years--;
  }
  return years;
}