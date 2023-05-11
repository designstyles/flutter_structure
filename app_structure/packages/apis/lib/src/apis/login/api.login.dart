import 'package:apis/src/apis/api.base.dart';
import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:services/services.dart';

class LoginApiEndpoints {
  const LoginApiEndpoints();

  Future<ApiAuthentication> login({required String loginJson}) async {
    try {
      final response =
          await BaseApiProvider.getDioInstance.post<Map<String, dynamic>>(
        'v1/Auth/Authenticate/',
        data: loginJson,
        options: Options(
          followRedirects: true,
        ),
      );

      final decodedResponse = AppResponse.fromMap(response.data ?? {});
      return ApiAuthentication.fromMap(
        decodedResponse.result.first as Map<String, dynamic>,
      )!;
    } on DioError catch (e) {
      throw BaseApiProvider.handleError(e);
    } catch (e) {
      AppLogger.logError(e.toString());
      throw const InternalServerErrorException(
        statusCode: 500,
        message: 'Something went wrong, Please try again.',
      );
    }
  }
}
