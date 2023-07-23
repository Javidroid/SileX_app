import 'package:either_dart/either.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';

abstract interface class RemoteDatasource {
  Future<Either<AppError, User>> getUser(String username);

  Future<Either<AppError, User>> getPlans();
}
