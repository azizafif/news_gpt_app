import 'debugging_printer.dart';

class FirebaseErrorRecorder {
  FirebaseErrorRecorder._();

  static void recordNonFatalError(
    Object error,
    StackTrace stackTrace, {
    required final String message,
  }) =>
      {
        Print.red(message),
        // FirebaseCrashlytics.instance.recordError(error, stackTrace, reason: message)
      };

  static void recordFatalError(
    Object error,
    StackTrace stackTrace, {
    required final String message,
  }) =>
      {
        Print.red(message),
        // FirebaseCrashlytics.instance.recordError(error, stackTrace, reason: message, fatal: true)
      };
}
