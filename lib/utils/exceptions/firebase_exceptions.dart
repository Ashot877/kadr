class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'cancelled':
        return 'The operation was cancelled. Please try again.';
      case 'unknown':
        return 'An unknown error occurred. Please try again.';
      case 'invalid-argument':
        return 'Invalid argument provided. Please check and try again.';
      case 'deadline-exceeded':
        return 'The operation took too long to complete. Please try again.';
      case 'not-found':
        return 'The requested resource was not found.';
      case 'already-exists':
        return 'The resource you are trying to create already exists.';
      case 'permission-denied':
        return 'You do not have permission to perform this operation.';
      case 'resource-exhausted':
        return 'Quota exceeded or resource exhausted. Please try later.';
      case 'failed-precondition':
        return 'Operation failed due to failed precondition. Please check.';
      case 'aborted':
        return 'The operation was aborted. Please try again.';
      case 'out-of-range':
        return 'Operation out of range. Please check your request.';
      case 'unimplemented':
        return 'This operation is not implemented on the server.';
      case 'internal':
        return 'Internal server error. Please try again.';
      case 'unavailable':
        return 'Service unavailable. Please check your connection.';
      case 'data-loss':
        return 'Data loss occurred during the operation.';
      case 'unauthenticated':
        return 'You are not authenticated. Please login and try again.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  @override
  String toString() => message;
}
