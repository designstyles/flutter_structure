// ignore_for_file: avoid_dynamic_calls

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:models/src/api/login/api.authentication.dart';
import 'package:models/src/api/serializers.plugins.dart';

part 'serializers.g.dart';

@SerializersFor([
  ApiAuthentication,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(EmptyObjectToNullSerializerPlugin())
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

List<T> deserializeListOf<T>(
  T Function(Map<String, dynamic>) fromMap,
  Iterable<dynamic> values,
) =>
    values
        .map((dynamic v) => fromMap(v as Map<String, dynamic>))
        .toList(growable: false);
