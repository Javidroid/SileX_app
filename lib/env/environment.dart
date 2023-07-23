abstract class TfgEnv {
  final String baseRestUrl;
  final String environment;

  const TfgEnv({
    required this.baseRestUrl,
    required this.environment,
  });
}

class EnvConfig implements TfgEnv {
  @override
  String get baseRestUrl => const String.fromEnvironment("BASE_REST_URL");

  @override
  String get environment => const String.fromEnvironment("ENVIRONMENT");
}
