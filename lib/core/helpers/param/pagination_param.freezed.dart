// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationParam {
  int get page;
  int get limit;

  /// Create a copy of PaginationParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationParamCopyWith<PaginationParam> get copyWith =>
      _$PaginationParamCopyWithImpl<PaginationParam>(
          this as PaginationParam, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationParam &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @override
  String toString() {
    return 'PaginationParam(page: $page, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $PaginationParamCopyWith<$Res> {
  factory $PaginationParamCopyWith(
          PaginationParam value, $Res Function(PaginationParam) _then) =
      _$PaginationParamCopyWithImpl;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class _$PaginationParamCopyWithImpl<$Res>
    implements $PaginationParamCopyWith<$Res> {
  _$PaginationParamCopyWithImpl(this._self, this._then);

  final PaginationParam _self;
  final $Res Function(PaginationParam) _then;

  /// Create a copy of PaginationParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_self.copyWith(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginationParam].
extension PaginationParamPatterns on PaginationParam {
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
    TResult Function(_PaginationParam value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginationParam() when $default != null:
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
    TResult Function(_PaginationParam value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationParam():
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
    TResult? Function(_PaginationParam value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationParam() when $default != null:
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
    TResult Function(int page, int limit)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginationParam() when $default != null:
        return $default(_that.page, _that.limit);
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
    TResult Function(int page, int limit) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationParam():
        return $default(_that.page, _that.limit);
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
    TResult? Function(int page, int limit)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationParam() when $default != null:
        return $default(_that.page, _that.limit);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PaginationParam implements PaginationParam {
  const _PaginationParam({this.page = 1, this.limit = 50});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  /// Create a copy of PaginationParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationParamCopyWith<_PaginationParam> get copyWith =>
      __$PaginationParamCopyWithImpl<_PaginationParam>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationParam &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @override
  String toString() {
    return 'PaginationParam(page: $page, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class _$PaginationParamCopyWith<$Res>
    implements $PaginationParamCopyWith<$Res> {
  factory _$PaginationParamCopyWith(
          _PaginationParam value, $Res Function(_PaginationParam) _then) =
      __$PaginationParamCopyWithImpl;
  @override
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$PaginationParamCopyWithImpl<$Res>
    implements _$PaginationParamCopyWith<$Res> {
  __$PaginationParamCopyWithImpl(this._self, this._then);

  final _PaginationParam _self;
  final $Res Function(_PaginationParam) _then;

  /// Create a copy of PaginationParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_PaginationParam(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
