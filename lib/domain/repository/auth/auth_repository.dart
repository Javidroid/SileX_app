import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart';
import 'package:tfg_v2/domain/model/errors.dart';

abstract interface class AuthRepository {
  Future<Either<AppError, bool>> login({
    required String username,
    required String password,
  });

  Future<Either<AppError, void>> logout();

  Future<Either<AppError, bool>> signUp({
    required String username,
    required String email,
    required String password,
  });
}

@Injectable(as: AuthRepository)
class PlanRepositoryImpl implements AuthRepository {
  final RemoteDatasource _remote;

  PlanRepositoryImpl(this._remote);

  @override
  Future<Either<AppError, bool>> login({
    required String username,
    required String password,
  }) {
    return _remote.login(username: username, password: password);
  }

  @override
  Future<Either<AppError, void>> logout() {
    return _remote.logout();
  }

  @override
  Future<Either<AppError, bool>> signUp({
    required String username,
    required String email,
    required String password,
  }) {
    return _remote.signUp(username: username, email: email, password: password);
  }
}
