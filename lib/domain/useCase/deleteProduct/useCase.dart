
import 'package:dartz/dartz.dart';

import '../../../data/network/failure/failure.dart';
import '../../../data/network/request/addProduct/request.dart';
import '../../model/deleteProduct/model.dart';
import '../../repositry/repositry.dart';
import '../base/base_use_case.dart';

class DeleteProductUseCase implements BaseUseCase<DeleteProductUseCaseInput,DeleteProductDaTaModel>{
  final Repository _repositry;
  DeleteProductUseCase(this._repositry);
  @override
  Future<Either<Failure, DeleteProductDaTaModel>> execute(DeleteProductUseCaseInput input)async {
    return await _repositry.deleteProduct(ProductRequest(input.id));
  }
}

class DeleteProductUseCaseInput{
  int id;
  DeleteProductUseCaseInput(this.id);
}