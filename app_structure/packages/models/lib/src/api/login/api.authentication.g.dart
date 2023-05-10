// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.authentication.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiAuthentication> _$apiAuthenticationSerializer =
    new _$ApiAuthenticationSerializer();

class _$ApiAuthenticationSerializer
    implements StructuredSerializer<ApiAuthentication> {
  @override
  final Iterable<Type> types = const [ApiAuthentication, _$ApiAuthentication];
  @override
  final String wireName = 'ApiAuthentication';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiAuthentication object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('DisplayName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.token;
    if (value != null) {
      result
        ..add('Token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ApiAuthentication deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiAuthenticationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'DisplayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiAuthentication extends ApiAuthentication {
  @override
  final String? displayName;
  @override
  final String? token;

  factory _$ApiAuthentication(
          [void Function(ApiAuthenticationBuilder)? updates]) =>
      (new ApiAuthenticationBuilder()..update(updates))._build();

  _$ApiAuthentication._({this.displayName, this.token}) : super._();

  @override
  ApiAuthentication rebuild(void Function(ApiAuthenticationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiAuthenticationBuilder toBuilder() =>
      new ApiAuthenticationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiAuthentication &&
        displayName == other.displayName &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiAuthentication')
          ..add('displayName', displayName)
          ..add('token', token))
        .toString();
  }
}

class ApiAuthenticationBuilder
    implements Builder<ApiAuthentication, ApiAuthenticationBuilder> {
  _$ApiAuthentication? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  ApiAuthenticationBuilder();

  ApiAuthenticationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiAuthentication other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiAuthentication;
  }

  @override
  void update(void Function(ApiAuthenticationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiAuthentication build() => _build();

  _$ApiAuthentication _build() {
    final _$result = _$v ??
        new _$ApiAuthentication._(displayName: displayName, token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
