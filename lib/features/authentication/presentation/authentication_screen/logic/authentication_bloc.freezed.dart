// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent()';
}


}

/// @nodoc
class $AuthenticationEventCopyWith<$Res>  {
$AuthenticationEventCopyWith(AuthenticationEvent _, $Res Function(AuthenticationEvent) __);
}


/// Adds pattern-matching-related methods to [AuthenticationEvent].
extension AuthenticationEventPatterns on AuthenticationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoginRequest value)?  loginRequest,TResult Function( _RegisterRequest value)?  registerRequest,TResult Function( _LogoutRequest value)?  logoutRequest,TResult Function( _CancelRequest value)?  cancelRequest,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequest() when loginRequest != null:
return loginRequest(_that);case _RegisterRequest() when registerRequest != null:
return registerRequest(_that);case _LogoutRequest() when logoutRequest != null:
return logoutRequest(_that);case _CancelRequest() when cancelRequest != null:
return cancelRequest(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoginRequest value)  loginRequest,required TResult Function( _RegisterRequest value)  registerRequest,required TResult Function( _LogoutRequest value)  logoutRequest,required TResult Function( _CancelRequest value)  cancelRequest,}){
final _that = this;
switch (_that) {
case _LoginRequest():
return loginRequest(_that);case _RegisterRequest():
return registerRequest(_that);case _LogoutRequest():
return logoutRequest(_that);case _CancelRequest():
return cancelRequest(_that);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoginRequest value)?  loginRequest,TResult? Function( _RegisterRequest value)?  registerRequest,TResult? Function( _LogoutRequest value)?  logoutRequest,TResult? Function( _CancelRequest value)?  cancelRequest,}){
final _that = this;
switch (_that) {
case _LoginRequest() when loginRequest != null:
return loginRequest(_that);case _RegisterRequest() when registerRequest != null:
return registerRequest(_that);case _LogoutRequest() when logoutRequest != null:
return logoutRequest(_that);case _CancelRequest() when cancelRequest != null:
return cancelRequest(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LoginParam param)?  loginRequest,TResult Function( RegisterParam param)?  registerRequest,TResult Function()?  logoutRequest,TResult Function()?  cancelRequest,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequest() when loginRequest != null:
return loginRequest(_that.param);case _RegisterRequest() when registerRequest != null:
return registerRequest(_that.param);case _LogoutRequest() when logoutRequest != null:
return logoutRequest();case _CancelRequest() when cancelRequest != null:
return cancelRequest();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LoginParam param)  loginRequest,required TResult Function( RegisterParam param)  registerRequest,required TResult Function()  logoutRequest,required TResult Function()  cancelRequest,}) {final _that = this;
switch (_that) {
case _LoginRequest():
return loginRequest(_that.param);case _RegisterRequest():
return registerRequest(_that.param);case _LogoutRequest():
return logoutRequest();case _CancelRequest():
return cancelRequest();case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LoginParam param)?  loginRequest,TResult? Function( RegisterParam param)?  registerRequest,TResult? Function()?  logoutRequest,TResult? Function()?  cancelRequest,}) {final _that = this;
switch (_that) {
case _LoginRequest() when loginRequest != null:
return loginRequest(_that.param);case _RegisterRequest() when registerRequest != null:
return registerRequest(_that.param);case _LogoutRequest() when logoutRequest != null:
return logoutRequest();case _CancelRequest() when cancelRequest != null:
return cancelRequest();case _:
  return null;

}
}

}

/// @nodoc


class _LoginRequest implements AuthenticationEvent {
  const _LoginRequest(this.param);
  

 final  LoginParam param;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestCopyWith<_LoginRequest> get copyWith => __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequest&&(identical(other.param, param) || other.param == param));
}


@override
int get hashCode => Object.hash(runtimeType,param);

@override
String toString() {
  return 'AuthenticationEvent.loginRequest(param: $param)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory _$LoginRequestCopyWith(_LoginRequest value, $Res Function(_LoginRequest) _then) = __$LoginRequestCopyWithImpl;
@useResult
$Res call({
 LoginParam param
});




}
/// @nodoc
class __$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(this._self, this._then);

  final _LoginRequest _self;
  final $Res Function(_LoginRequest) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? param = null,}) {
  return _then(_LoginRequest(
null == param ? _self.param : param // ignore: cast_nullable_to_non_nullable
as LoginParam,
  ));
}


}

/// @nodoc


class _RegisterRequest implements AuthenticationEvent {
  const _RegisterRequest(this.param);
  

 final  RegisterParam param;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterRequestCopyWith<_RegisterRequest> get copyWith => __$RegisterRequestCopyWithImpl<_RegisterRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterRequest&&(identical(other.param, param) || other.param == param));
}


@override
int get hashCode => Object.hash(runtimeType,param);

@override
String toString() {
  return 'AuthenticationEvent.registerRequest(param: $param)';
}


}

/// @nodoc
abstract mixin class _$RegisterRequestCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory _$RegisterRequestCopyWith(_RegisterRequest value, $Res Function(_RegisterRequest) _then) = __$RegisterRequestCopyWithImpl;
@useResult
$Res call({
 RegisterParam param
});




}
/// @nodoc
class __$RegisterRequestCopyWithImpl<$Res>
    implements _$RegisterRequestCopyWith<$Res> {
  __$RegisterRequestCopyWithImpl(this._self, this._then);

  final _RegisterRequest _self;
  final $Res Function(_RegisterRequest) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? param = null,}) {
  return _then(_RegisterRequest(
null == param ? _self.param : param // ignore: cast_nullable_to_non_nullable
as RegisterParam,
  ));
}


}

/// @nodoc


class _LogoutRequest implements AuthenticationEvent {
  const _LogoutRequest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent.logoutRequest()';
}


}




/// @nodoc


class _CancelRequest implements AuthenticationEvent {
  const _CancelRequest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent.cancelRequest()';
}


}




/// @nodoc
mixin _$AuthenticationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState()';
}


}

/// @nodoc
class $AuthenticationStateCopyWith<$Res>  {
$AuthenticationStateCopyWith(AuthenticationState _, $Res Function(AuthenticationState) __);
}


/// Adds pattern-matching-related methods to [AuthenticationState].
extension AuthenticationStatePatterns on AuthenticationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Authenticating value)?  authenticating,TResult Function( _Authenticated value)?  authenticated,TResult Function( _Unauthenticated value)?  unauthenticated,TResult Function( _AuthFailure value)?  authFailure,TResult Function( _LoggingOut value)?  loggingOut,TResult Function( _LogoutFailure value)?  logoutFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Authenticating() when authenticating != null:
return authenticating(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _AuthFailure() when authFailure != null:
return authFailure(_that);case _LoggingOut() when loggingOut != null:
return loggingOut(_that);case _LogoutFailure() when logoutFailure != null:
return logoutFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Authenticating value)  authenticating,required TResult Function( _Authenticated value)  authenticated,required TResult Function( _Unauthenticated value)  unauthenticated,required TResult Function( _AuthFailure value)  authFailure,required TResult Function( _LoggingOut value)  loggingOut,required TResult Function( _LogoutFailure value)  logoutFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Authenticating():
return authenticating(_that);case _Authenticated():
return authenticated(_that);case _Unauthenticated():
return unauthenticated(_that);case _AuthFailure():
return authFailure(_that);case _LoggingOut():
return loggingOut(_that);case _LogoutFailure():
return logoutFailure(_that);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Authenticating value)?  authenticating,TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _Unauthenticated value)?  unauthenticated,TResult? Function( _AuthFailure value)?  authFailure,TResult? Function( _LoggingOut value)?  loggingOut,TResult? Function( _LogoutFailure value)?  logoutFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Authenticating() when authenticating != null:
return authenticating(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _AuthFailure() when authFailure != null:
return authFailure(_that);case _LoggingOut() when loggingOut != null:
return loggingOut(_that);case _LogoutFailure() when logoutFailure != null:
return logoutFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  authenticating,TResult Function()?  authenticated,TResult Function()?  unauthenticated,TResult Function( String message)?  authFailure,TResult Function()?  loggingOut,TResult Function( String message)?  logoutFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Authenticating() when authenticating != null:
return authenticating();case _Authenticated() when authenticated != null:
return authenticated();case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _AuthFailure() when authFailure != null:
return authFailure(_that.message);case _LoggingOut() when loggingOut != null:
return loggingOut();case _LogoutFailure() when logoutFailure != null:
return logoutFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  authenticating,required TResult Function()  authenticated,required TResult Function()  unauthenticated,required TResult Function( String message)  authFailure,required TResult Function()  loggingOut,required TResult Function( String message)  logoutFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Authenticating():
return authenticating();case _Authenticated():
return authenticated();case _Unauthenticated():
return unauthenticated();case _AuthFailure():
return authFailure(_that.message);case _LoggingOut():
return loggingOut();case _LogoutFailure():
return logoutFailure(_that.message);case _:
  throw StateError('Unexpected subclass');

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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  authenticating,TResult? Function()?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( String message)?  authFailure,TResult? Function()?  loggingOut,TResult? Function( String message)?  logoutFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Authenticating() when authenticating != null:
return authenticating();case _Authenticated() when authenticated != null:
return authenticated();case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _AuthFailure() when authFailure != null:
return authFailure(_that.message);case _LoggingOut() when loggingOut != null:
return loggingOut();case _LogoutFailure() when logoutFailure != null:
return logoutFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthenticationState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.initial()';
}


}




/// @nodoc


class _Authenticating implements AuthenticationState {
  const _Authenticating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.authenticating()';
}


}




/// @nodoc


class _Authenticated implements AuthenticationState {
  const _Authenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.authenticated()';
}


}




/// @nodoc


class _Unauthenticated implements AuthenticationState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.unauthenticated()';
}


}




/// @nodoc


class _AuthFailure implements AuthenticationState {
  const _AuthFailure(this.message);
  

 final  String message;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthFailureCopyWith<_AuthFailure> get copyWith => __$AuthFailureCopyWithImpl<_AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthenticationState.authFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AuthFailureCopyWith<$Res> implements $AuthenticationStateCopyWith<$Res> {
  factory _$AuthFailureCopyWith(_AuthFailure value, $Res Function(_AuthFailure) _then) = __$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AuthFailureCopyWithImpl<$Res>
    implements _$AuthFailureCopyWith<$Res> {
  __$AuthFailureCopyWithImpl(this._self, this._then);

  final _AuthFailure _self;
  final $Res Function(_AuthFailure) _then;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AuthFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoggingOut implements AuthenticationState {
  const _LoggingOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoggingOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.loggingOut()';
}


}




/// @nodoc


class _LogoutFailure implements AuthenticationState {
  const _LogoutFailure(this.message);
  

 final  String message;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutFailureCopyWith<_LogoutFailure> get copyWith => __$LogoutFailureCopyWithImpl<_LogoutFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthenticationState.logoutFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LogoutFailureCopyWith<$Res> implements $AuthenticationStateCopyWith<$Res> {
  factory _$LogoutFailureCopyWith(_LogoutFailure value, $Res Function(_LogoutFailure) _then) = __$LogoutFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$LogoutFailureCopyWithImpl<$Res>
    implements _$LogoutFailureCopyWith<$Res> {
  __$LogoutFailureCopyWithImpl(this._self, this._then);

  final _LogoutFailure _self;
  final $Res Function(_LogoutFailure) _then;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LogoutFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
