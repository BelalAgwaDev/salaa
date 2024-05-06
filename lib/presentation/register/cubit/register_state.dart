part of 'register_cubit.dart';

@freezed
class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading(FlowState flowState) = Loading;
  const factory RegisterState.success(RegisterModel data) = Success<T>;
  const factory RegisterState.error(FlowState flowState) = Error;
}
