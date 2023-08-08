import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';

@Injectable()
class FollowUserUseCase {
  final UserRepository _userRepository;

  FollowUserUseCase(this._userRepository);

  /// Makes [username] follow/unfollow [targetUser]
  ///
  /// If [isFollow] == true, the action is follow. Otherwise is unfollow.
  Future<Either<AppError, void>> call({
    required String username,
    required String targetUser,
    bool isFollow = true,
  }) async {
    final username = await _userRepository.getCurrentLoggedUsername();
    if (username.isLeft) return Left(UninitializedSharedPreferencesError());
    // TODO: implement

    return Right(
      isFollow
          ? print('$username followed $targetUser')
          : print('$username unfollowed $targetUser'),
    );
  }
}
