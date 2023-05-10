import 'dart:convert';

import 'package:models/src/dto/abstracts/abs.dto.login.dart';

class DtoLogin extends AbsLogin {
  DtoLogin();

  DtoLogin._createEmptyItem({
    required String emailAddress,
    required String passwordValue,
  }) {
    email = emailAddress;
    password = passwordValue;
  }
  static Future<DtoLogin> createEmptyItem({
    required String emailAddress,
    required String password,
  }) async {
    final component = DtoLogin._createEmptyItem(
      emailAddress: emailAddress,
      passwordValue: password,
    );
    return component;
  }

  String toJson() {
    final jsonMap = {
      'Email': email,
      //! this should be encrypted with your logic. DO NOT SEND IN PLAIN TEXT
      'Password': password,
    };
    return json.encode(jsonMap);
  }
}
