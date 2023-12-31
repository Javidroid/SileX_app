import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/social/user.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';

@Injectable()
class GetUpdatedLoggedUserUseCase {
  final UserRepository _userRepository;

  TfgNavigator get navigator => getIt<TfgNavigator>();

  GetUpdatedLoggedUserUseCase(this._userRepository);

  Future<Either<AppError, User>> call() async {
    final username = await _userRepository.getCurrentLoggedUsername();
    if (username.isLeft) {
      navigator.toLogin();
      return Left(NotLoggedInError());
    }

    final updatedUser = await _userRepository.getUser(username.right);
    if (updatedUser.isLeft) return Left(updatedUser.left);

    // save into shared pref
    _userRepository.saveCurrentLoggedUser(updatedUser.right);
    return Right(updatedUser.right);
  }
}
