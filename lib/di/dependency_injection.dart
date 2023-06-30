import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.config.dart';
import 'package:tfg_v2/env/environment.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({required String env}) =>
    getIt.init(environment: env);

const dev = Environment("dev");
const prod = Environment("prod");

@module
abstract class DiModule {
  @Singleton()
  TfgEnv get env => EnvConfig();

// @Singleton()
// Navegador get navigator => Navegador();
}
