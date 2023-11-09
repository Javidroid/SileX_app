import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';

@Injectable()
class LogoutUseCase {
  final UserRepository _userRepository;

  LogoutUseCase(this._userRepository);

  TfgNavigator get navigator => getIt<TfgNavigator>();

  Future<void> call() async {
    // await _authRepository.logout();

    // delete user from local storage
    await _userRepository.clearCurrentLoggedUser();

    navigator.toLogin();
  }
}
