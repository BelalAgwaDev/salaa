


import 'package:dartz/dartz.dart';

import '../../../data/network/failure/failure.dart';
import '../../model/getFvor/get_favor_model.dart';
import '../../repositry/repositry.dart';
import '../base/base_use_case.dart';

class GetFavorUseCase implements BaseUseCase<void,GetFavoriteDataModel>{
  final Repository _repositry;
  GetFavorUseCase(this._repositry);
  @override
  Future<Either<Failure, GetFavoriteDataModel>> execute(void input)async {
    return await _repositry.getFavor();
  }
}