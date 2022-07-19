
import 'package:dartz/dartz.dart';
import 'package:salaa/data/network/request/favo/favor_request.dart';
import 'package:salaa/domain/model/favor/favor_model.dart';
import 'package:salaa/domain/repositry/repositry.dart';

import '../../../data/network/failure/failure.dart';


import '../base/base_use_case.dart';


class FavorUseCase implements BaseUseCase<FavorUseCaseInput,FavoriteModel>{
  final Repository _repositry;
  FavorUseCase(this._repositry);
  @override
  Future<Either<Failure, FavoriteModel>> execute(FavorUseCaseInput input)async {
    return await _repositry.favor(FavorRequest(input.id));
  }
}

class FavorUseCaseInput{
  int id;
  FavorUseCaseInput(this.id);
}