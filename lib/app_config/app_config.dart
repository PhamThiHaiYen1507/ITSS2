// ignore_for_file: constant_identifier_names

enum ENV { DEV, PROD }

class AppConfig {
  final ENV env;
  final int fetchCount;
  String baseUrl;
  String baseUrlMap;
  bool secure;

  static AppConfig? _info;

  static AppConfig get info => _info!;

  factory AppConfig({
    required ENV env,
    required String baseUrl,
    required String baseUrlMap,
    required bool secure,
    required int fetchCount,
  }) {
    _info ??= AppConfig._internal(
      env: env,
      baseUrl: baseUrl,
      baseUrlMap: baseUrlMap,
      secure: secure,
      fetchCount: fetchCount,
    );
    return _info!;
  }

  AppConfig._internal({
    required this.env,
    required this.baseUrl,
    required this.baseUrlMap,
    required this.secure,
    required this.fetchCount,
  });

  Map<String, dynamic> getConfig() {
    return {
      'baseUrl': baseUrl,
      'secure': secure,
    };
  }
}
