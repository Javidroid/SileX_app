import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart';
import 'package:tfg_v2/data/dto/category_dto.dart';
import 'package:tfg_v2/data/dto/plan_dto.dart';
import 'package:tfg_v2/data/dto/user_dto.dart';
import 'package:tfg_v2/data/services/api_service.dart';
import 'package:tfg_v2/data/services/auth/auth0_services.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/plan_category.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/env/environment.dart';

@Injectable(as: RemoteDatasource)
class DefaultRemoteDatasource implements RemoteDatasource {
  final ApiService _apiService;
  final _baseUrl = getIt<TfgEnv>().baseRestUrl;
  final AuthService _authService;

  DefaultRemoteDatasource(this._apiService, this._authService);

  @override
  Future<Either<AppError, bool>> createPlan({
    required Plan plan,
    required String creatorUsername,
  }) async {
    final uri = Uri.parse('$_baseUrl/plan?username=$creatorUsername');

    final result = await _apiService.post(
      uri,
      headers: PlanDto.fromModel(plan).toCreatePlanJson(),
    );

    return result.either<AppError, bool>(
      (left) => left,
      (right) => true,
    );
  }

  @override
  Future<Either<AppError, bool>> createUser(User username) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, bool>> deletePlan(String idPlan) async {
    final uri = Uri.parse('$_baseUrl/plan');

    final result = await _apiService.delete(
      uri,
      headers: {"id_plan": idPlan},
    );

    return result.either<AppError, bool>(
      (left) => left,
      (right) => true,
    );
  }

  @override
  Future<Either<AppError, bool>> deleteUser(String username) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, bool>> followUser(
    String username,
    String targetUser,
  ) async {
    final uri = Uri.parse('$_baseUrl/$username/follow/$targetUser');

    final result = await _apiService.put(uri);

    return result.either<AppError, bool>(
      (left) => left,
      (right) => true,
    );
  }

  @override
  Future<Either<AppError, Plan>> getPlan(String idPlan) async {
    final uri = Uri.parse('$_baseUrl/plan?id_plan=$idPlan');

    final result = await _apiService.get(uri);

    return result.either<AppError, Plan>(
      (left) => left,
      (right) => PlanDto.fromJson(right).toModel(),
    );
  }

  @override
  Future<Either<AppError, List<Plan>>> getPlans() async {
    final uri = Uri.parse('$_baseUrl/getPlans');

    final result = await _apiService.get(uri);

    return result.either<AppError, List<Plan>>(
      (left) => left,
      (right) =>
          List.of(right).map((e) => PlanDto.fromJson(e).toModel()).toList(),
    );
  }

  @override
  Future<Either<AppError, User>> getUser(String username) async {
    final uri = Uri.parse('$_baseUrl/user/$username');

    final result = await _apiService.get(uri);

    return result.either<AppError, User>(
      (left) => left,
      (right) => UserDto.fromJson(right).toModel(),
    );
  }

  @override
  Future<Either<AppError, User>> getUserById(String userId) async {
    final uri = Uri.parse('$_baseUrl/userById/$userId');

    final result = await _apiService.get(uri);

    return result.either<AppError, User>(
      (left) => left,
      (right) => UserDto.fromJson(right).toModel(),
    );
  }

  @override
  Future<Either<AppError, bool>> quitFromPlan(
    String idPlan,
    String username,
  ) async {
    final uri = Uri.parse('$_baseUrl/plan/$idPlan/signUp/$username');

    final result = await _apiService.delete(uri);

    return result.either<AppError, bool>(
      (left) => left,
      (right) => true,
    );
  }

  @override
  Future<Either<AppError, bool>> signUpToPlan(
    String idPlan,
    String username,
  ) async {
    final uri = Uri.parse('$_baseUrl/plan/$idPlan/signUp/$username');

    final result = await _apiService.put(uri);

    return result.either<AppError, bool>(
      (left) => left,
      (right) => true,
    );
  }

  @override
  Future<Either<AppError, bool>> unfollowUser(
    String username,
    String targetUser,
  ) async {
    final uri = Uri.parse('$_baseUrl/$username/follow/$targetUser');

    final result = await _apiService.delete(uri);

    return result.either<AppError, bool>(
      (left) => left,
      (right) => true,
    );
  }

  @override
  Future<Either<AppError, bool>> updatePlan(Plan plan, String idPlan) {
    // TODO: implement updatePlan
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, bool>> updateUser(User username, String preUsername) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, List<User>>> getUserListById(
    List<String> ids,
  ) async {
    final List<User> userList = [];

    for (String id in ids) {
      final resp = await getUserById(id);
      if (resp.isRight) {
        userList.add(resp.right);
      } else {
        return Left(resp.left);
      }
    }

    return Right(userList);
  }

  @override
  Future<Either<AppError, String>> getUserProfilePic(String userId) async {
    final uri = Uri.parse('$_baseUrl/user/$userId/profilePicture');

    final result = await _apiService.get(uri);

    return result.either<AppError, String>((left) => left, (right) => right);
  }

  @override
  Future<Either<AppError, List<PlanCategory>>> getCategories() async {
    final uri = Uri.parse('$_baseUrl/categories');

    final result = await _apiService.get(uri);

    return result.either<AppError, List<PlanCategory>>(
      (left) => left,
      (right) => List.of(right)
          .map((e) => PlanCategoryDto.fromJson(e).toModel())
          .toList(),
    );
  }

  @override
  Future<Either<AppError, List<Plan>>> getUserPlans(String username) async {
    final uri = Uri.parse('$_baseUrl/user/$username/plans');

    final result = await _apiService.get(uri);

    return result.either<AppError, List<Plan>>(
      (left) => left,
      (right) =>
          List.of(right).map((e) => PlanDto.fromJson(e).toModel()).toList(),
    );
  }

  @override
  Future<Either<AppError, bool>> login({
    required String username,
    required String password,
  }) async {
    // TODO: implement login
    // todo: store credentials, renew, clear etc
    try {
      final creds = _authService.login(
        username: username,
        password: password,
      );
      return const Right(true);
    } catch (e) {
      print(e);
      return Left(UnauthError());
    }
  }

  @override
  Future<Either<AppError, bool>> logout() async {
    // TODO: implement logout
    // todo: store credentials, renew, clear etc

    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, bool>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    // TODO: implement signUp
    // todo: store credentials, renew, clear etc

    throw UnimplementedError();
  }
}
