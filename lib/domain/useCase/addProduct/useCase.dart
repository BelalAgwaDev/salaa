
import 'package:dartz/dartz.dart';

import '../../../data/network/failure/failure.dart';
import '../../../data/network/request/addProduct/request.dart';
import '../../model/AddProduct/model.dart';

import '../../repositry/repositry.dart';
import '../base/base_use_case.dart';

class AddProductUseCase implements BaseUseCase<AddProductUseCaseInput,AddProductModel>{
  final Repository _repositry;
  AddProductUseCase(this._repositry);
  @override
  Future<Either<Failure, AddProductModel>> execute(AddProductUseCaseInput input)async {
    return await _repositry.addProducts(ProductRequest(input.id));
  }
}

class AddProductUseCaseInput{
  int id;
  AddProductUseCaseInput(this.id);
}