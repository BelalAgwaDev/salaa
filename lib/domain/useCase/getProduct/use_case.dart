


import 'package:dartz/dartz.dart';

import '../../../data/network/failure/failure.dart';
import '../../model/getProduct/model.dart';
import '../../repositry/repositry.dart';
import '../base/base_use_case.dart';

class GetProductUseCase implements BaseUseCase<void,GetProductDaTaModel>{
  final Repository _repositry;
  GetProductUseCase(this._repositry);
  @override
  Future<Either<Failure, GetProductDaTaModel>> execute(void input)async {
    return await _repositry.getProducts();
  }
}