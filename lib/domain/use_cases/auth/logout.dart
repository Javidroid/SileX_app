import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/repository/auth/auth_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';

@Injectable()
class LogoutUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  LogoutUseCase(this._authRepository, this._userRepository);

  TfgNavigator get navigator => getIt<TfgNavigator>();

  Future<void> call() async {
    // todo connect with Auth0 and logout, clear credentials manager
    // todo determine return type

    // delete user from local storage
    await _userRepository.clearCurrentLoggedUser();

    navigator.toLogin();
  }
}
