import 'package:dartz/dartz.dart';

import 'package:salaa/domain/model/register/register_model.dart';
import 'package:salaa/domain/repositry/repositry.dart';
import '../../../data/network/failure/failure.dart';
import '../../../data/network/request/register/register_request.dart';
import '../base/base_use_case.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, RegisterModel> {
  final Repository _repositry;
  RegisterUseCase(this._repositry);
  @override
  Future<Either<Failure, RegisterModel>> execute(
      RegisterUseCaseInput input) async {
    return await _repositry.register(RegisterRequest(
      input.name,
      input.email,
      input.password,
      input.phone,
    ));
  }
}

class RegisterUseCaseInput {
  String name;
  String phone;
  String email;
  String password;

  RegisterUseCaseInput(
    this.name,
    this.email,
    this.password,
    this.phone,
  );
}
