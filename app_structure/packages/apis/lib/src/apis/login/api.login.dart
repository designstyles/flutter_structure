import 'package:apis/src/apis/api.base.dart';
import 'package:dio/dio.dart';
import 'package:models/models.dart';

class LoginApiEndpoints {
  const LoginApiEndpoints();

  Future<ApiAuthentication> login({required String loginJson}) async {
    try {
      final response = await BaseApiProvider.getDioInstance.post<AbsResponse>(
        'v1/Auth/Authenticate/',
        data: loginJson,
      );
      return ApiAuthentication.fromMap(
        response.data!.result as Map<String, dynamic>,
      )!;
    } on DioError catch (e) {
      throw BaseApiProvider.handleError(e);
    } catch (e) {
      throw const InternalServerErrorException(
        statusCode: 500,
        message: 'Something went wrong, Please try again.',
      );
    }
  }
}
