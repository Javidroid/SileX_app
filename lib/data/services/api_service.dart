import 'package:injectable/injectable.dart';
import 'package:tfg_v2/data/services/dio_service.dart';
import 'package:tfg_v2/data/transformers/error_transformer.dart';
import 'package:tfg_v2/domain/model/errors.dart';

class ApiService extends DioRestService<AppError> {
  ApiService()
      : super(
          validCodes: [200, 201, 204],
          catchErrors: errorsHandler,
        );
}

@module
abstract class ApiServiceModule {
  @lazySingleton
  ApiService get httpClient => ApiService();
}
