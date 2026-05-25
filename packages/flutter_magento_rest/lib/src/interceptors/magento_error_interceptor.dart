import 'package:dio/dio.dart';

import '../rest_error_mapper.dart';

/// Dio interceptor that converts [DioException] to [MagentoException].
///
/// Uses [RestErrorMapper] to transform HTTP errors into typed
/// Magento SDK exceptions for consistent error handling.
class MagentoErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final magentoException = RestErrorMapper.map(err);

    // Wrap the MagentoException in a new DioException
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: magentoException,
        stackTrace: err.stackTrace,
        message: magentoException.message,
      ),
    );
  }
}
