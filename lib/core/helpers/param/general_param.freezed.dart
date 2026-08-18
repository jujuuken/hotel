// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneralParam {
  String? get id;
  String? get query;
  int? get page;
  int? get limit;
  CancelToken? get cancelToken;

  /// Create a copy of GeneralParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeneralParamCopyWith<GeneralParam> get copyWith =>
      _$GeneralParamCopyWithImpl<GeneralParam>(
          this as GeneralParam, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeneralParam &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.cancelToken, cancelToken) ||
                other.cancelToken == cancelToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, query, page, limit, cancelToken);

  @override
  String toString() {
    return 'GeneralParam(id: $id, query: $query, page: $page, limit: $limit, cancelToken: $cancelToken)';
  }
}

/// @nodoc
abstract mixin class $GeneralParamCopyWith<$Res> {
  factory $GeneralParamCopyWith(
          GeneralParam value, $Res Function(GeneralParam) _then) =
      _$GeneralParamCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? query,
      int? page,
      int? limit,
      CancelToken? cancelToken});
}

/// @nodoc
class _$GeneralParamCopyWithImpl<$Res> implements $GeneralParamCopyWith<$Res> {
  _$GeneralParamCopyWithImpl(this._self, this._then);

  final GeneralParam _self;
  final $Res Function(GeneralParam) _then;

  /// Create a copy of GeneralParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? query = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? cancelToken = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      cancelToken: freezed == cancelToken
          ? _self.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as CancelToken?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GeneralParam].
extension GeneralParamPatterns on GeneralParam {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GeneralParam value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeneralParam() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GeneralParam value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeneralParam():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GeneralParam value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeneralParam() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? id, String? query, int? page, int? limit,
            CancelToken? cancelToken)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeneralParam() when $default != null:
        return $default(
            _that.id, _that.query, _that.page, _that.limit, _that.cancelToken);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? id, String? query, int? page, int? limit,
            CancelToken? cancelToken)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeneralParam():
        return $default(
            _that.id, _that.query, _that.page, _that.limit, _that.cancelToken);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? id, String? query, int? page, int? limit,
            CancelToken? cancelToken)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeneralParam() when $default != null:
        return $default(
            _that.id, _that.query, _that.page, _that.limit, _that.cancelToken);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GeneralParam implements GeneralParam {
  const _GeneralParam(
      {this.id, this.query, this.page, this.limit, this.cancelToken});

  @override
  final String? id;
  @override
  final String? query;
  @override
  final int? page;
  @override
  final int? limit;
  @override
  final CancelToken? cancelToken;

  /// Create a copy of GeneralParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeneralParamCopyWith<_GeneralParam> get copyWith =>
      __$GeneralParamCopyWithImpl<_GeneralParam>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeneralParam &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.cancelToken, cancelToken) ||
                other.cancelToken == cancelToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, query, page, limit, cancelToken);

  @override
  String toString() {
    return 'GeneralParam(id: $id, query: $query, page: $page, limit: $limit, cancelToken: $cancelToken)';
  }
}

/// @nodoc
abstract mixin class _$GeneralParamCopyWith<$Res>
    implements $GeneralParamCopyWith<$Res> {
  factory _$GeneralParamCopyWith(
          _GeneralParam value, $Res Function(_GeneralParam) _then) =
      __$GeneralParamCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? query,
      int? page,
      int? limit,
      CancelToken? cancelToken});
}

/// @nodoc
class __$GeneralParamCopyWithImpl<$Res>
    implements _$GeneralParamCopyWith<$Res> {
  __$GeneralParamCopyWithImpl(this._self, this._then);

  final _GeneralParam _self;
  final $Res Function(_GeneralParam) _then;

  /// Create a copy of GeneralParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? query = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? cancelToken = freezed,
  }) {
    return _then(_GeneralParam(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      cancelToken: freezed == cancelToken
          ? _self.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as CancelToken?,
    ));
  }
}

// dart format on
