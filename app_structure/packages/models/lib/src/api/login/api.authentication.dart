import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:models/src/api/serializers.dart';

part 'api.authentication.g.dart';

abstract class ApiAuthentication
    implements Built<ApiAuthentication, ApiAuthenticationBuilder> {
  factory ApiAuthentication([
    void Function(ApiAuthenticationBuilder) updates,
  ]) = _$ApiAuthentication;
  ApiAuthentication._();

  static Serializer<ApiAuthentication> get serializer =>
      _$apiAuthenticationSerializer;

  @BuiltValueField(wireName: 'DisplayName')
  String? get displayName;
  @BuiltValueField(wireName: 'Token')
  String? get token;

  static ApiAuthentication? fromJson(String jsonString) {
    return serializers.deserializeWith<ApiAuthentication>(
      ApiAuthentication.serializer,
      json.decode(jsonString),
    );
  }

  static ApiAuthentication? fromMap(Map<String, dynamic> data) {
    return serializers.deserializeWith(
      ApiAuthentication.serializer,
      data,
    );
  }
}
