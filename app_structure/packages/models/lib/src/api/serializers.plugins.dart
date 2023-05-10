// ignore_for_file: avoid_dynamic_calls

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class EmptyObjectToNullSerializerPlugin implements SerializerPlugin {
  @override
  Object? beforeSerialize(Object? object, FullType specifiedType) {
    return object;
  }

  @override
  Object? afterSerialize(Object? object, FullType specifiedType) {
    return object;
  }

  @override
  Object? beforeDeserialize(Object? object, FullType specifiedType) {
    if (object is Map && object.isNotEmpty && !specifiedType.isUnspecified) {
      _filterNullValues(object, specifiedType);
    }

    return object;
  }

  @override
  Object? afterDeserialize(Object? object, FullType specifiedType) {
    return object;
  }

  Object? _filterNullValues(Map<dynamic, dynamic> map, FullType specifiedType) {
    final keysToRemove = <dynamic>[];

    map.forEach((key, value) {
      if (value is Map || value is Iterable) {
        if (value!.toString().isEmpty) {
          keysToRemove.add(key);
        }
      }
    });
    for (final key in keysToRemove) {
      map.remove(key);
    }

    return map;
  }
}

/// Alternative serializer for [DateTime].
///
/// Install this to use ISO8601 format instead of the default (microseconds
/// since epoch). Use [SerializersBuilder.add] to install it.
///
/// An exception will be thrown on attempt to serialize local DateTime
/// instances; you must use UTC.
class Iso8601DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([DateTime]);
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(
    Serializers serializers,
    DateTime dateTime, {
    FullType specifiedType = FullType.unspecified,
  }) {
    if (!dateTime.isUtc) {
      throw ArgumentError.value(
        dateTime,
        'dateTime',
        'Must be in utc for serialization.',
      );
    }

    return dateTime.toIso8601String();
  }

  @override
  DateTime deserialize(
    Serializers serializers,
    Object? serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return DateTime.parse(serialized! as String).toLocal();
  }
}
