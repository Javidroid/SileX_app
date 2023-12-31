import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/local/local_datasource.dart';
import 'package:tfg_v2/data/services/shared_preferences/session_preferences.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/social/user.dart';
import 'package:tfg_v2/env/environment.dart';

@Injectable(as: LocalDatasource)
class DefaultLocalDatasource implements LocalDatasource {
  final env = getIt<TfgEnv>();

  @override
  Future<Either<AppError, TfgEnv>> getEnvironment() {
    try {
      return Future.value(Right(env));
    } catch (e) {
      return Future.value(Left(UnknownError()));
    }
  }

  @override
  Future<Either<AppError, User>> getCurrentLoggedUser() async {
    try {
      final user = await SessionSharedPreferences.getCurrentUser();
      return user != null ? Right(user) : Left(UserNotFoundInLocalError());
    } catch (e) {
      return Left(UnknownError());
    }
  }

  @override
  Future<Either<AppError, String>> getCurrentLoggedUsername() async {
    try {
      final username = await SessionSharedPreferences.getCurrentUsername();
      return username != null
          ? Right(username)
          : Left(UserNotFoundInLocalError());
    } catch (e) {
      return Left(UnknownError());
    }
  }

  @override
  Future<Either<AppError, void>> saveCurrentLoggedUser(User user) async {
    try {
      return Right(SessionSharedPreferences.setCurrentUser(user: user));
    } catch (e) {
      return Future.value(Left(UnknownError()));
    }
  }

  @override
  Future<Either<AppError, void>> clearCurrentLoggedUser() async {
    try {
      return Right(SessionSharedPreferences.clear());
    } catch (e) {
      return Future.value(Left(UnknownError()));
    }
  }
}
