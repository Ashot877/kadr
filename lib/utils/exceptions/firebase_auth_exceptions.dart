class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'This email address is already registered. Please use a different email.';
      case 'user-not-found':
        return 'No user found for this email. Please register first.';
      case 'wrong-password':
        return 'The password is incorrect. Please try again.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support.';
      case 'operation-not-allowed':
        return 'Email/password sign-in is not enabled. Please contact support.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger one.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      case 'invalid-credential':
        return 'Invalid or expired credentials. Please try again.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with this email using another sign-in method.';
      case 'invalid-verification-code':
        return 'The verification code is invalid. Please try again.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid. Please request a new code.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  @override
  String toString() => message;
}
