import 'package:dio/dio.dart';
import 'package:tfg_v2/data/services/connectivity_service.dart';

class ConnectivityInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return await ConnectivityService.isConnected()
        ? handler.next(options)
        : handler.reject(
            DioException.connectionError(
              requestOptions: options,
              reason: 'No connectivity',
            ),
          );
  }
}
