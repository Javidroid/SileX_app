import 'package:either_dart/either.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/social/user.dart';
import 'package:tfg_v2/env/environment.dart';

abstract interface class LocalDatasource {
  Future<Either<AppError, TfgEnv>> getEnvironment();

  Future<Either<AppError, void>> saveCurrentLoggedUser(User user);

  Future<Either<AppError, void>> clearCurrentLoggedUser();

  Future<Either<AppError, User>> getCurrentLoggedUser();

  Future<Either<AppError, String>> getCurrentLoggedUsername();
}
