import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';

part 'register_screen_state.freezed.dart';

@freezed
class RegisterScreenState with _$RegisterScreenState {
  const factory RegisterScreenState({
    required Map<String, List<Master>> selectedMastersByType,
    @Default(false) bool isMasterModalOpen,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _RegisterScreenState;
}
