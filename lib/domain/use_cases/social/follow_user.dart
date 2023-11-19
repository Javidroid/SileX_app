import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/social/user.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';

@Injectable()
class FollowUserUseCase {
  final UserRepository _userRepository;

  FollowUserUseCase(this._userRepository);

  /// Makes current logged user follow/unfollow [targetUser]
  ///
  /// If [isFollow] == true, the action is follow. Otherwise is unfollow.
  Future<Either<AppError, bool>> call({
    required User targetUser,
    bool isFollow = true,
  }) async {
    final currentUser = await _userRepository.getCurrentLoggedUser();
    if (currentUser.isLeft) return Left(UserNotFoundInLocalError());

    final operation =
        isFollow ? _userRepository.followUser : _userRepository.unfollowUser;

    return operation(
      username: currentUser.right.username,
      targetUser: targetUser.username,
    );
  }
}
