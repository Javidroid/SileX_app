import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/repository/auth/auth_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';

@Injectable()
class LoginUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  LoginUseCase(
    this._authRepository,
    this._userRepository,
  );

  TfgNavigator get navigator => getIt<TfgNavigator>();

  Future<Either<AppError, bool>> call({
    required String username,
    required String password,
  }) async {
    final creds = await _authRepository.login(
      username: username,
      password: password,
    );

    // unexpected error on getting credentials
    if (creds.isLeft) return Left(creds.left);

    // unvalid credentials
    if (!creds.right) return const Right(false);

    // login OK so proceed to get user from db
    final user = await _userRepository.getUser(username);

    // error on getting user
    if (user.isLeft) return Left(user.left);

    // store user locally as a session
    _userRepository.saveCurrentLoggedUser(user.right);

    return const Right(true);
  }
}
