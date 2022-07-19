import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String email, String password) = _LoginObject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
    String name,
    String email,
    String phone,
    String password,
  ) = _RegisterObject;
}



@freezed
class ProfileObject with _$ProfileObject {
  factory ProfileObject(
      String name,
      String phone,
      String email,
      ) = _ProfileObject;
}