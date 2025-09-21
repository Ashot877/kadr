class TPlatformException implements Exception {
  final String code;
  final String? details;

  TPlatformException(this.code, {this.details});

  /// Создание на основе кода ошибки
  factory TPlatformException.fromCode(String code, {String? details}) {
    switch (code) {
      case 'network_error':
        return TPlatformException('Network error. Please check your internet connection.', details: details);
      case 'permission_denied':
        return TPlatformException('Permission denied. Please allow the required permissions.', details: details);
      case 'service_unavailable':
        return TPlatformException('The service is currently unavailable. Please try again later.', details: details);
      case 'invalid_argument':
        return TPlatformException('Invalid argument provided. Please check your input.', details: details);
      default:
        return TPlatformException('An unknown platform error occurred.', details: details);
    }
  }

  /// Сообщение для отображения пользователю
  String get message => code;

  @override
  String toString() {
    if (details != null) {
      return '$message Details: $details';
    }
    return message;
  }
}
