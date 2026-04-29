import 'package:intl/intl.dart';

class TFormatter {
  //date format
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  //currency formatter
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  //phone number formatter
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  //month date year format
  static String getFormattedDateInMonthDateyear(DateTime date, {String format = 'MMMM dd, yyyy'}) {
    return DateFormat(format).format(date);
  }

  //day name, month and date format
  static String getFormattedDate(DateTime date, {String format = 'dd MM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // International Phone Formatter
  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && digitsOnly.length == 11) {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }

  // Percentage Formatting
  static String formatPercentage(double value, {int decimalDigits = 1}) {
    return NumberFormat.decimalPercentPattern(decimalDigits: decimalDigits).format(value);
  }

  // File Size Formatter (Bytes ko KB/MB mein badalne ke liye)
  static String formatFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    var i = (bytes.toString().length - 1) ~/ 3;
    double num = bytes / (1024 * i); // Simple logic
    return "${num.toStringAsFixed(1)} ${suffixes[i]}";
  }
}