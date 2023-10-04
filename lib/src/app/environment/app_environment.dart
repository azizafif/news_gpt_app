import '../design/constants/app_contants.dart';

class AppEnvironment {
  AppEnvironment._();

  static Environment current = Environment.dev;

  static bool get mockingEnabled => current == Environment.mock;
  static bool get testingEnabled => current == Environment.test;

  static const String newsApiKey = 'd0031688756fba6ddd52f963a8788fc3';
  static const String chatGPTApiKey = '';

  //? Per environment assertions
  static void performEnvironmentAssertions() {
    switch (current) {
      case Environment.mock:
        break;
      default:
        //* Base Url
        assert(
          current.baseUrl.isNotEmpty,
          '\n[AppEnvironment] Base Url should be provided when running a non mocking mode',
        );

        assert(
          current.baseUrl.startsWith('https') || current != Environment.prod,
          '\n[AppEnvironment] <Base Url> must start with "https" in PROD mode as its mandatory to stores publishing',
        );

        break;
    }
  }
}

enum Environment {
  test(
    baseUrl: '',
    connectTimeout: 0,
    sendTimeout: 0,
    receiveTimeout: 0,
  ),

  mock(
    baseUrl: '',
    connectTimeout: 0,
    sendTimeout: 0,
    receiveTimeout: 0,
  ),
  dev(baseUrl: AppConstants.chatGPTBaseUrl),
  preprod(baseUrl: AppConstants.chatGPTBaseUrl),
  prod(
    baseUrl: AppConstants.chatGPTBaseUrl,
    connectTimeout: 10000,
    sendTimeout: 20000,
    receiveTimeout: 15000,
  );

  final String baseUrl;

  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;

  const Environment({
    required this.baseUrl,
    this.connectTimeout = 20000,
    this.sendTimeout = 20000,
    this.receiveTimeout = 20000,
  });
}
