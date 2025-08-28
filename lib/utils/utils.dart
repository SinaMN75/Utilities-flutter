import "package:u/utilities.dart";

String uuidV4() => const Uuid().v4();

String uuidV1() => const Uuid().v1();

Future<void> delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );

void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
  if (key.currentState!.validate()) action();
}

// Combine multiple validators into one
FormFieldValidator<T> combineValidators<T>(
  List<FormFieldValidator<T>> validators,
) =>
    (T? value) {
      for (final FormFieldValidator<T> validator in validators) {
        final String? result = validator(value);
        if (result != null) return result;
      }
      return null;
    };

// Validate required field
FormFieldValidator<T> validateRequired<T>({
  required String message,
}) =>
    (T? value) {
      if (value == null) return message;
      if (value is String && value.isEmpty) return message;
      if (value is List && value.isEmpty) return message;
      if (value is Map && value.isEmpty) return message;
      return null;
    };

// Validate minimum length
FormFieldValidator<String> validateMinLength({
  required int minLength,
  required String message,
}) =>
    (String? value) {
      if (value == null || value.length < minLength) {
        return message;
      }
      return null;
    };

// Validate maximum length
FormFieldValidator<String> validateMaxLength({
  required int maxLength,
  required String message,
}) =>
    (String? value) {
      if (value != null && value.length > maxLength) {
        return message;
      }
      return null;
    };

// Validate exact length
FormFieldValidator<String> validateExactLength({
  required int length,
  required String message,
}) =>
    (String? value) {
      if (value == null || value.length != length) {
        return message;
      }
      return null;
    };

// Validate email
FormFieldValidator<String> validateEmail({
  required String requiredMessage,
  required String invalidMessage,
  bool isRequired = true,
}) =>
    (String? value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return requiredMessage;
      }
      if (value != null && value.isNotEmpty && !value.isValidEmail) {
        return invalidMessage;
      }
      return null;
    };

// Validate phone number
FormFieldValidator<String> validatePhone({
  required String requiredMessage,
  required String invalidMessage,
  bool isRequired = true,
}) =>
    (String? value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return requiredMessage;
      }
      if (value != null && value.isNotEmpty && !value.isValidPhone) {
        return invalidMessage;
      }
      return null;
    };

// Validate number
FormFieldValidator<String> validateNumber({
  required String requiredMessage,
  required String invalidMessage,
  bool isRequired = true,
}) =>
    (String? value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return requiredMessage;
      }
      if (value != null && value.isNotEmpty && !GetUtils.isNumericOnly(value.englishNumber())) {
        return invalidMessage;
      }
      return null;
    };

// Validate range for numbers
FormFieldValidator<String> validateNumberRange({
  required double min,
  required double max,
  required String rangeMessage,
  required String invalidNumberMessage,
  bool isRequired = true,
}) =>
    (String? value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return invalidNumberMessage;
      }
      if (value != null && value.isNotEmpty) {
        final double? numValue = double.tryParse(value.englishNumber());
        if (numValue == null) return invalidNumberMessage;
        if (numValue < min || numValue > max) return rangeMessage;
      }
      return null;
    };

// Validate URL
FormFieldValidator<String> validateUrl({
  required String requiredMessage,
  required String invalidMessage,
  bool isRequired = true,
}) =>
    (String? value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return requiredMessage;
      }
      if (value != null && value.isNotEmpty && !value.isValidUrl) {
        return invalidMessage;
      }
      return null;
    };

// Validate password strength
FormFieldValidator<String> validatePassword({
  required String requiredMessage,
  required String weakMessage,
  bool isRequired = true,
}) =>
    (String? value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return requiredMessage;
      }
      if (value != null && value.isNotEmpty && !value.isStrongPassword) {
        return weakMessage;
      }
      return null;
    };

// Validate alphanumeric
FormFieldValidator<String> validateAlphanumeric({
  required String requiredMessage,
  required String invalidMessage,
  bool isRequired = true,
}) =>
    (String? value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return requiredMessage;
      }
      if (value != null && value.isNotEmpty && !value.isAlphanumeric) {
        return invalidMessage;
      }
      return null;
    };

// Validate pattern (custom regex)
FormFieldValidator<String> validatePattern({
  required RegExp pattern,
  required String message,
  bool isRequired = true,
}) =>
    (String? value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return message;
      }
      if (value != null && value.isNotEmpty && !pattern.hasMatch(value)) {
        return message;
      }
      return null;
    };

// Validate match between two fields (e.g., password confirmation)
FormFieldValidator<String> validateMatch({
  required String otherValue,
  required String mismatchMessage,
}) =>
    (String? value) {
      if (value != otherValue) {
        return mismatchMessage;
      }
      return null;
    };

// Example usage of combining validators
FormFieldValidator<String> validateComplexPassword() => combineValidators(<FormFieldValidator<String>>[
      validateRequired(message: "Password is required"),
      validateMinLength(minLength: 8, message: "Password must be at least 8 characters"),
      validatePassword(
        requiredMessage: "Password is required",
        weakMessage: "Password must contain uppercase, lowercase, number, and special character",
      ),
    ]);