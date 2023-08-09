import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';

@Injectable()
class UserJoinQuitPlanUseCase {
  final PlanRepository _planRepository;
  final UserRepository _userRepository;

  UserJoinQuitPlanUseCase(this._planRepository, this._userRepository);

  /// Joins or quits an [user] to/from a [plan] depending on [isJoin].
  ///
  /// If [isJoin] == true, the user is joined to the plan. Otherwise is quitted.
  Future<Either<AppError, void>> call({
    required String idPlan,
    bool isJoin = true,
  }) async {
    final username = await _userRepository.getCurrentLoggedUsername();
    if (username.isLeft) return Left(UninitializedSharedPreferencesError());

    // TODO: implement
    // TODO: handle user limit
    return Right(
      isJoin
          ? print('Joined $username to $idPlan')
          : print('Quitted $username from $idPlan'),
    );
  }
}
