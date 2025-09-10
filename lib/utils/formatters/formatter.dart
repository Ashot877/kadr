class TFormatter {
  TFormatter._();

  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')} '
        '${_monthString(date.month)} '
        '${date.year}';
  }

  static String _monthString(int month) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month];
  }

  static String formatArmenianPhone(String phone) {
    String digits = phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length == 8) return '+374 ${digits.substring(0,2)} ${digits.substring(2,4)} ${digits.substring(4,6)} ${digits.substring(6,8)}';
    if (digits.length == 10 && digits.startsWith('0')) return '+374 ${digits.substring(1,3)} ${digits.substring(3,5)} ${digits.substring(5,7)} ${digits.substring(7,9)}';
    return phone;
  }
}