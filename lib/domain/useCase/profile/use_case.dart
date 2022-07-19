
import 'package:dartz/dartz.dart';
import 'package:salaa/data/network/request/profile/request.dart';
import 'package:salaa/domain/repositry/repositry.dart';

import '../../../data/network/failure/failure.dart';

import '../../model/login/login_model.dart';
import '../base/base_use_case.dart';


class ProfileUseCase implements BaseUseCase<ProfileUseCaseInput,LoginModel>{
  final Repository _repositry;
  ProfileUseCase(this._repositry);
  @override
  Future<Either<Failure, LoginModel>> execute(ProfileUseCaseInput input)async {
    return await _repositry.profile(ProfileRequest(input.name, input.phone,input.email));
  }
}

class ProfileUseCaseInput{
  String name;
  String phone;
  String email;
  ProfileUseCaseInput(this.name,this.phone,this.email);
}