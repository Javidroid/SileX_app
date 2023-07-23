import 'package:either_dart/either.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/user.dart';

abstract interface class RemoteDatasource {
  Future<Either<AppError, User>> getUser(String username);

  Future<Either<AppError, bool>> createUser(User username);

  Future<Either<AppError, bool>> updateUser(User username, String preUsername);

  Future<Either<AppError, bool>> deleteUser(String username);

  Future<Either<AppError, bool>> followUser(String username, String targetUser);

  Future<Either<AppError, bool>> unfollowUser(
    String username,
    String targetUser,
  );

  Future<Either<AppError, Set<Plan>>> getPlans();

  Future<Either<AppError, Plan>> getPlan(String idPlan);

  Future<Either<AppError, bool>> createPlan(Plan plan);

  Future<Either<AppError, bool>> updatePlan(Plan plan, String idPlan);

  Future<Either<AppError, bool>> deletePlan(String idPlan);

  Future<Either<AppError, bool>> signUpToPlan(String idPlan, String username);

  Future<Either<AppError, bool>> quitFromPlan(String idPlan, String username);
}
