import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';

@Injectable()
class CheckJoinedToPlan {
  final UserRepository _userRepository;

  CheckJoinedToPlan(this._userRepository);

  Future<Either<AppError, bool>> call({
    required Plan plan,
  }) async {
    final currentUser = await _userRepository.getCurrentLoggedUser();
    if (currentUser.isLeft) return Left(UninitializedSharedPreferencesError());

    return plan.joinedUsers.contains(currentUser.right.id)
        ? const Right(true)
        : const Right(false);
  }
}
