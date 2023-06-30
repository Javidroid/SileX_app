abstract class TfgEnv {
  final String urlRestService;

  const TfgEnv({
    required this.urlRestService,
  });
}

class EnvConfig implements TfgEnv {
  @override
  String get urlRestService => const String.fromEnvironment("URL_REST_SERVICE");
}
