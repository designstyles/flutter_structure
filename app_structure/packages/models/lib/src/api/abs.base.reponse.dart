abstract class AbsResponse {
  AbsResponse();

  int statusCode = 200;
  String error = '';
  DateTime date = DateTime.now();
  Map<dynamic, dynamic> result = {};
}

class AppResponse extends AbsResponse {
  AppResponse._createEmptyItem({
    required Map<dynamic, dynamic> resultValue,
  }) {
    result = resultValue;
  }
  static Future<AppResponse> createEmptyItem({
    required Map<dynamic, dynamic> resultValue,
  }) async {
    final component = AppResponse._createEmptyItem(
      resultValue: resultValue,
    );
    return component;
  }
}
