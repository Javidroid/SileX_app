import 'package:either_dart/either.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/env/environment.dart';

abstract interface class LocalDatasource {
  Future<Either<AppError, TfgEnv>> getEnvironment();
}
