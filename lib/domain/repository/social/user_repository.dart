import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/local/local_datasource.dart';
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';

abstract interface class UserRepository {
  Future<Either<AppError, User>> getUser(String username);

  Future<Either<AppError, User>> getUserById(String userId);

  Future<Either<AppError, User>> getCurrentLoggedUser();

  Future<Either<AppError, String>> getCurrentLoggedUsername();

  Future<Either<AppError, List<User>>> getUserListById(List<String> ids);

  Future<Either<AppError, bool>> createUser(User username);

  Future<Either<AppError, bool>> updateUser(User username, String preUsername);

  Future<Either<AppError, bool>> deleteUser(String username);

  Future<Either<AppError, bool>> followUser(String username, String targetUser);

  Future<Either<AppError, bool>> unfollowUser(
    String username,
    String targetUser,
  );
}

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final RemoteDatasource _remote;
  final LocalDatasource _local;

  UserRepositoryImpl(this._remote, this._local);

  @override
  Future<Either<AppError, bool>> createUser(User username) {
    // TODO: implement createUser
    throw UnimplementedError();
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
  ) {
    // TODO: implement followUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, User>> getUser(String username) {
    return _remote.getUser(username);
  }

  @override
  Future<Either<AppError, bool>> unfollowUser(
    String username,
    String targetUser,
  ) {
    // TODO: implement unfollowUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, bool>> updateUser(User username, String preUsername) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, List<User>>> getUserListById(List<String> ids) {
    return _remote.getUserListById(ids);
  }

  @override
  Future<Either<AppError, User>> getCurrentLoggedUser() {
    return _local.getCurrentLoggedUser();
  }

  @override
  Future<Either<AppError, String>> getCurrentLoggedUsername() {
    return _local.getCurrentLoggedUsername();
  }

  @override
  Future<Either<AppError, User>> getUserById(String userId) {
    return _remote.getUserById(userId);
  }
}
