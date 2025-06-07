// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterScreenState {
  Map<String, List<Master>> get selectedMastersByType =>
      throw _privateConstructorUsedError;
  bool get isMasterModalOpen => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  /// Create a copy of RegisterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterScreenStateCopyWith<RegisterScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterScreenStateCopyWith<$Res> {
  factory $RegisterScreenStateCopyWith(
          RegisterScreenState value, $Res Function(RegisterScreenState) then) =
      _$RegisterScreenStateCopyWithImpl<$Res, RegisterScreenState>;
  @useResult
  $Res call(
      {Map<String, List<Master>> selectedMastersByType,
      bool isMasterModalOpen,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class _$RegisterScreenStateCopyWithImpl<$Res, $Val extends RegisterScreenState>
    implements $RegisterScreenStateCopyWith<$Res> {
  _$RegisterScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMastersByType = null,
    Object? isMasterModalOpen = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      selectedMastersByType: null == selectedMastersByType
          ? _value.selectedMastersByType
          : selectedMastersByType // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Master>>,
      isMasterModalOpen: null == isMasterModalOpen
          ? _value.isMasterModalOpen
          : isMasterModalOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterScreenStateImplCopyWith<$Res>
    implements $RegisterScreenStateCopyWith<$Res> {
  factory _$$RegisterScreenStateImplCopyWith(_$RegisterScreenStateImpl value,
          $Res Function(_$RegisterScreenStateImpl) then) =
      __$$RegisterScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<Master>> selectedMastersByType,
      bool isMasterModalOpen,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class __$$RegisterScreenStateImplCopyWithImpl<$Res>
    extends _$RegisterScreenStateCopyWithImpl<$Res, _$RegisterScreenStateImpl>
    implements _$$RegisterScreenStateImplCopyWith<$Res> {
  __$$RegisterScreenStateImplCopyWithImpl(_$RegisterScreenStateImpl _value,
      $Res Function(_$RegisterScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMastersByType = null,
    Object? isMasterModalOpen = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$RegisterScreenStateImpl(
      selectedMastersByType: null == selectedMastersByType
          ? _value._selectedMastersByType
          : selectedMastersByType // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Master>>,
      isMasterModalOpen: null == isMasterModalOpen
          ? _value.isMasterModalOpen
          : isMasterModalOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterScreenStateImpl implements _RegisterScreenState {
  const _$RegisterScreenStateImpl(
      {required final Map<String, List<Master>> selectedMastersByType,
      this.isMasterModalOpen = false,
      this.isLoading = false,
      this.hasError = false})
      : _selectedMastersByType = selectedMastersByType;

  final Map<String, List<Master>> _selectedMastersByType;
  @override
  Map<String, List<Master>> get selectedMastersByType {
    if (_selectedMastersByType is EqualUnmodifiableMapView)
      return _selectedMastersByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedMastersByType);
  }

  @override
  @JsonKey()
  final bool isMasterModalOpen;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;

  @override
  String toString() {
    return 'RegisterScreenState(selectedMastersByType: $selectedMastersByType, isMasterModalOpen: $isMasterModalOpen, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedMastersByType, _selectedMastersByType) &&
            (identical(other.isMasterModalOpen, isMasterModalOpen) ||
                other.isMasterModalOpen == isMasterModalOpen) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedMastersByType),
      isMasterModalOpen,
      isLoading,
      hasError);

  /// Create a copy of RegisterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterScreenStateImplCopyWith<_$RegisterScreenStateImpl> get copyWith =>
      __$$RegisterScreenStateImplCopyWithImpl<_$RegisterScreenStateImpl>(
          this, _$identity);
}

abstract class _RegisterScreenState implements RegisterScreenState {
  const factory _RegisterScreenState(
      {required final Map<String, List<Master>> selectedMastersByType,
      final bool isMasterModalOpen,
      final bool isLoading,
      final bool hasError}) = _$RegisterScreenStateImpl;

  @override
  Map<String, List<Master>> get selectedMastersByType;
  @override
  bool get isMasterModalOpen;
  @override
  bool get isLoading;
  @override
  bool get hasError;

  /// Create a copy of RegisterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterScreenStateImplCopyWith<_$RegisterScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
