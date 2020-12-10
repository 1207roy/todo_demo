// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ResultTearOff {
  const _$ResultTearOff();

  Data<T> call<T>(T value) {
    return Data<T>(
      value,
    );
  }

  None<T> none<T>({T value}) {
    return None<T>(
      value: value,
    );
  }

  Loading<T> loading<T>() {
    return Loading<T>();
  }

  ErrorDetails<T> error<T>({Error error, String message}) {
    return ErrorDetails<T>(
      error: error,
      message: message,
    );
  }
}

// ignore: unused_element
const $Result = _$ResultTearOff();

mixin _$Result<T> {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result none(T value),
    @required Result loading(),
    @required Result error(Error error, String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result none(T value),
    Result loading(),
    Result error(Error error, String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result none(None<T> value),
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result none(None<T> value),
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  });
}

abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res>;
}

class _$ResultCopyWithImpl<T, $Res> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T> _value;
  // ignore: unused_field
  final $Res Function(Result<T>) _then;
}

abstract class $DataCopyWith<T, $Res> {
  factory $DataCopyWith(Data<T> value, $Res Function(Data<T>) then) =
      _$DataCopyWithImpl<T, $Res>;
  $Res call({T value});
}

class _$DataCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $DataCopyWith<T, $Res> {
  _$DataCopyWithImpl(Data<T> _value, $Res Function(Data<T>) _then)
      : super(_value, (v) => _then(v as Data<T>));

  @override
  Data<T> get _value => super._value as Data<T>;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(Data<T>(
      value == freezed ? _value.value : value as T,
    ));
  }
}

class _$Data<T> with DiagnosticableTreeMixin implements Data<T> {
  const _$Data(this.value) : assert(value != null);

  @override
  final T value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $DataCopyWith<T, Data<T>> get copyWith =>
      _$DataCopyWithImpl<T, Data<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result none(T value),
    @required Result loading(),
    @required Result error(Error error, String message),
  }) {
    assert($default != null);
    assert(none != null);
    assert(loading != null);
    assert(error != null);
    return $default(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result none(T value),
    Result loading(),
    Result error(Error error, String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result none(None<T> value),
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert($default != null);
    assert(none != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result none(None<T> value),
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Data<T> implements Result<T> {
  const factory Data(T value) = _$Data<T>;

  T get value;
  $DataCopyWith<T, Data<T>> get copyWith;
}

abstract class $NoneCopyWith<T, $Res> {
  factory $NoneCopyWith(None<T> value, $Res Function(None<T>) then) =
      _$NoneCopyWithImpl<T, $Res>;
  $Res call({T value});
}

class _$NoneCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $NoneCopyWith<T, $Res> {
  _$NoneCopyWithImpl(None<T> _value, $Res Function(None<T>) _then)
      : super(_value, (v) => _then(v as None<T>));

  @override
  None<T> get _value => super._value as None<T>;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(None<T>(
      value: value == freezed ? _value.value : value as T,
    ));
  }
}

class _$None<T> with DiagnosticableTreeMixin implements None<T> {
  const _$None({this.value});

  @override
  final T value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.none(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>.none'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is None<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $NoneCopyWith<T, None<T>> get copyWith =>
      _$NoneCopyWithImpl<T, None<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result none(T value),
    @required Result loading(),
    @required Result error(Error error, String message),
  }) {
    assert($default != null);
    assert(none != null);
    assert(loading != null);
    assert(error != null);
    return none(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result none(T value),
    Result loading(),
    Result error(Error error, String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result none(None<T> value),
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert($default != null);
    assert(none != null);
    assert(loading != null);
    assert(error != null);
    return none(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result none(None<T> value),
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class None<T> implements Result<T> {
  const factory None({T value}) = _$None<T>;

  T get value;
  $NoneCopyWith<T, None<T>> get copyWith;
}

abstract class $LoadingCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) then) =
      _$LoadingCopyWithImpl<T, $Res>;
}

class _$LoadingCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(Loading<T> _value, $Res Function(Loading<T>) _then)
      : super(_value, (v) => _then(v as Loading<T>));

  @override
  Loading<T> get _value => super._value as Loading<T>;
}

class _$Loading<T> with DiagnosticableTreeMixin implements Loading<T> {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Result<$T>.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result none(T value),
    @required Result loading(),
    @required Result error(Error error, String message),
  }) {
    assert($default != null);
    assert(none != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result none(T value),
    Result loading(),
    Result error(Error error, String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result none(None<T> value),
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert($default != null);
    assert(none != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result none(None<T> value),
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements Result<T> {
  const factory Loading() = _$Loading<T>;
}

abstract class $ErrorDetailsCopyWith<T, $Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails<T> value, $Res Function(ErrorDetails<T>) then) =
      _$ErrorDetailsCopyWithImpl<T, $Res>;
  $Res call({Error error, String message});
}

class _$ErrorDetailsCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $ErrorDetailsCopyWith<T, $Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails<T> _value, $Res Function(ErrorDetails<T>) _then)
      : super(_value, (v) => _then(v as ErrorDetails<T>));

  @override
  ErrorDetails<T> get _value => super._value as ErrorDetails<T>;

  @override
  $Res call({
    Object error = freezed,
    Object message = freezed,
  }) {
    return _then(ErrorDetails<T>(
      error: error == freezed ? _value.error : error as Error,
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$ErrorDetails<T>
    with DiagnosticableTreeMixin
    implements ErrorDetails<T> {
  const _$ErrorDetails({this.error, this.message});

  @override
  final Error error;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.error(error: $error, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>.error'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(message);

  @override
  $ErrorDetailsCopyWith<T, ErrorDetails<T>> get copyWith =>
      _$ErrorDetailsCopyWithImpl<T, ErrorDetails<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(T value), {
    @required Result none(T value),
    @required Result loading(),
    @required Result error(Error error, String message),
  }) {
    assert($default != null);
    assert(none != null);
    assert(loading != null);
    assert(error != null);
    return error(this.error, message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(T value), {
    Result none(T value),
    Result loading(),
    Result error(Error error, String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(Data<T> value), {
    @required Result none(None<T> value),
    @required Result loading(Loading<T> value),
    @required Result error(ErrorDetails<T> value),
  }) {
    assert($default != null);
    assert(none != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(Data<T> value), {
    Result none(None<T> value),
    Result loading(Loading<T> value),
    Result error(ErrorDetails<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails<T> implements Result<T> {
  const factory ErrorDetails({Error error, String message}) = _$ErrorDetails<T>;

  Error get error;
  String get message;
  $ErrorDetailsCopyWith<T, ErrorDetails<T>> get copyWith;
}
