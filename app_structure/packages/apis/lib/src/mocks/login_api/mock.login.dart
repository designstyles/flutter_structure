import 'package:apis/src/apis/api.base.dart';
import 'package:apis/src/mocks/mock_responses/mocks.responses.dart';
import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:services/services.dart';

class MockLoginApiEndpoints {
  const MockLoginApiEndpoints();

  Future<ApiAuthentication> login({required String loginJson}) async {
    try {
      final response = await MockResponses().getLoginResponse();
      AppLogger.logInfo(response);
      return ApiAuthentication.fromMap(
        response.result.first as Map<String, dynamic>,
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
