import 'package:either_dart/either.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/plan_category.dart';
import 'package:tfg_v2/domain/model/user.dart';

abstract interface class RemoteDatasource {
  Future<Either<AppError, User>> getUser(String username);

  Future<Either<AppError, User>> getUserById(String userId);

  Future<Either<AppError, bool>> checkUserExists(String username);

  Future<Either<AppError, List<User>>> getUserListById(List<String> ids);

  Future<Either<AppError, bool>> createUser({required UserCreate user});

  Future<Either<AppError, bool>> updateUser(User username, String preUsername);

  Future<Either<AppError, bool>> deleteUser(String username);

  Future<Either<AppError, bool>> followUser(String username, String targetUser);

  Future<Either<AppError, bool>> unfollowUser(
    String username,
    String targetUser,
  );

  Future<Either<AppError, String>> getUserProfilePic(String userId);

  Future<Either<AppError, List<Plan>>> getPlans();

  Future<Either<AppError, Plan>> getPlan(String idPlan);

  Future<Either<AppError, bool>> createPlan({
    required Plan plan,
    required String creatorUsername,
  });

  Future<Either<AppError, bool>> updatePlan(Plan plan, String idPlan);

  Future<Either<AppError, bool>> deletePlan(String idPlan);

  Future<Either<AppError, bool>> signUpToPlan(String idPlan, String username);

  Future<Either<AppError, bool>> quitFromPlan(String idPlan, String username);

  Future<Either<AppError, List<PlanCategory>>> getCategories();

  Future<Either<AppError, List<Plan>>> getUserPlans(String username);

  Future<Either<AppError, bool>> login({
    required String username,
    required String password,
  });

  Future<Either<AppError, bool>> logout();

  Future<Either<AppError, bool>> signUp({
    required String username,
    required String email,
    required String password,
  });
}
