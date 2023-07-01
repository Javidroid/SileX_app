abstract class TfgEnv {
  final String urlRestService;
  final String environment;

  const TfgEnv({
    required this.urlRestService,
    required this.environment,
  });
}

class EnvConfig implements TfgEnv {
  @override
  String get urlRestService => const String.fromEnvironment("URL_REST_SERVICE");

  @override
  String get environment => const String.fromEnvironment("ENVIRONMENT");
}
