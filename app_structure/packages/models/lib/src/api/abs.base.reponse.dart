abstract class AbsResponse {
  AbsResponse();

  int statusCode = 200;
  String error = '';
  DateTime date = DateTime.now();
  List<dynamic> result = <dynamic>[];
}

class AppResponse extends AbsResponse {
  factory AppResponse.fromMap(Map<String, dynamic> json) =>
      AppResponse._createEmptyItem(
        resultValue:
            json['Result'] != null ? json['Result'] as List<dynamic> : [],
      );
  AppResponse._createEmptyItem({
    required List<dynamic> resultValue,
  }) {
    result = resultValue;
  }
}
