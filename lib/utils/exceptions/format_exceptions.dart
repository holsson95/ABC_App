/// Custom exception class to handle various format-related errors.
class CustomFormatExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const CustomFormatExceptions([this.message = 'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory CustomFormatExceptions.fromMessage(String message) {
    return CustomFormatExceptions(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory CustomFormatExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const CustomFormatExceptions('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const CustomFormatExceptions('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const CustomFormatExceptions('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const CustomFormatExceptions('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const CustomFormatExceptions('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const CustomFormatExceptions('The input should be a valid numeric format.');
    // Add more cases as needed...
      default:
        return const CustomFormatExceptions();
    }
  }
}