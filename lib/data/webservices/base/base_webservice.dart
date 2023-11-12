import 'package:login_app/data/datasources/network/response/base_response.dart';

abstract class BaseWebservice {
  Future<T> request<R extends BaseResponse, T>(
    Future<R> sourceRequest,
    T Function(R source) mapFunction,
  ) async {
    try {
      var response = await sourceRequest;
      if (response.success == null || response.success != true) {
        throw Exception(response.error);
      }
      return mapFunction(response);
    } catch (e) {
       throw Exception(e);
  }
}
}




