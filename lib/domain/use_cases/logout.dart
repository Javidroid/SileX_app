import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';

@Injectable()
class LogoutUseCase {
  LogoutUseCase();

  TfgNavigator get navigator => getIt<TfgNavigator>();

  Future<void> call() async {
    // todo connect with Auth0 and logout
    // todo determine return type

    navigator.toLogin();
  }
}
