import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';

abstract interface class UserRepository {
  Future<Either<AppError, User>> getUser(String username);

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
  final RemoteDatasource _remoteDatasource;

  UserRepositoryImpl(this._remoteDatasource);

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
    return _remoteDatasource.getUser(username);
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
    return _remoteDatasource.getUserListById(ids);
  }
}
