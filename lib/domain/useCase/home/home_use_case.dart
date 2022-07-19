
import 'package:dartz/dartz.dart';
import 'package:salaa/domain/model/home/home_model.dart';
import 'package:salaa/domain/repositry/repositry.dart';

import '../../../data/network/failure/failure.dart';
import '../base/base_use_case.dart';


class HomeUseCase implements BaseUseCase<void,HomeModel>{
  final Repository _repositry;
  HomeUseCase(this._repositry);
  @override
  Future<Either<Failure, HomeModel>> execute(void input)async {
    return await _repositry.home();
  }
}

