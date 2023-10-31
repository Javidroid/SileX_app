import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';

@Injectable()
class UserJoinQuitPlanUseCase {
  final PlanRepository _planRepository;
  final UserRepository _userRepository;

  UserJoinQuitPlanUseCase(this._planRepository, this._userRepository);

  /// Joins or quits an [user] to/from a [localPlan] depending on [isJoin].
  ///
  /// If [isJoin] == true, the user is joined to the plan. Otherwise is quitted.
  Future<Either<AppError, bool>> call({
    required Plan localPlan,
    bool isJoin = true,
  }) async {
    final user = await _userRepository.getCurrentLoggedUser();
    if (user.isLeft) return Left(UserNotFoundInLocalError());

    final operation =
        isJoin ? _planRepository.signUpToPlan : _planRepository.quitFromPlan;

    return operation(localPlan.idPlan, user.right.username).fold(
      (left) => Left(left),
      (right) {
        localPlan.joinOrQuitUserToPlan(userId: user.right.id, isJoin: isJoin);
        return Right(right);
      },
    );
  }
}
