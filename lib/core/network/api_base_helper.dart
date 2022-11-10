import 'package:assessment/config/app_environments/app_env.dart';
import 'package:dio/dio.dart';

abstract class ApiBaseHelper {
  // Future<Response> getMethod({
  //   required String path,
  //   required bool getToken,
  // }) {}

  Future<Dio> getDio({
    bool getToken = true,
  }) async {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: AppEnv().getApiBaseURL(),
      headers: await getHeader(
        getToken: getToken,
      ),
    );
    Dio dio = Dio(
      baseOptions,
    );
    return dio;
  }

  Future<Map<String, dynamic>> getHeader({
    bool getToken = false,
  }) async {
    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
    };
    if (getToken) {
      // TODO: retrieve token here
    }
    return header;
  }
}
