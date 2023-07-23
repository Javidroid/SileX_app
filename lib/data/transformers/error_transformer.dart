import 'package:dio/dio.dart';
import 'package:tfg_v2/domain/model/errors.dart';

AppError errorsHandler(DioException error) {
  switch (error.response?.statusCode) {
    case 400:
      return BadRequestError();
    case 401:
      return UnauthError();
    case 403:
      return ForbiddenError();
    case 404:
      return NotFoundError();
    case 500:
    case 510:
      return ServerError();
    case 511:
      return ExpiredSessionError();
    default:
      return UnknownError();
  }
}
