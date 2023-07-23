import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart';
import 'package:tfg_v2/data/dto/user_dto.dart';
import 'package:tfg_v2/data/services/api_service.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/env/environment.dart';

@Injectable(as: RemoteDatasource)
class DefaultRemoteDatasource implements RemoteDatasource {
  final ApiService _apiService;
  final _baseUrl = getIt<TfgEnv>().baseRestUrl;

  DefaultRemoteDatasource(this._apiService);

  @override
  Future<Either<AppError, User>> getUser(String username) async {
    final uri = Uri.parse('$_baseUrl/user/$username');

    final result = _apiService.get(uri);

    return result.either<AppError, User>(
      (left) => left,
      (right) => UserDto.fromJson(right).toModel(),
    );
  }

  @override
  Future<Either<AppError, User>> getPlans() {
    // TODO: implement getPlans
    throw UnimplementedError();
  }
}
