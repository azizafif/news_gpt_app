extension StringFormat on String {
  String customFormatDateTime() {
    // Parse the input string as an ISO 8601 datetime
    DateTime dateTime = DateTime.parse(this);

    // Format the datetime as desired
    String formattedDateTime =
        '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

    return formattedDateTime;
  }
}
