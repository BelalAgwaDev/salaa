


import 'package:dartz/dartz.dart';
import 'package:salaa/data/network/failure/api_error_model.dart';
import 'package:salaa/data/network/request/category/category_request.dart';
import 'package:salaa/domain/model/category/category_model.dart';


import '../../repositry/repositry.dart';
import '../base/base_use_case.dart';

class CategoryDataUseCase implements BaseUseCase<CategoryUseCaseInput,CategoryDaTADetailsModel>{
  final Repository _repositry;
  CategoryDataUseCase(this._repositry);
  @override
  Future<Either<ApiErrorModel, CategoryDaTADetailsModel>> execute(CategoryUseCaseInput input)async {
    return await _repositry.categoryData(CategoryRequest(input.id));
  }
}

class CategoryUseCaseInput{
  int id;
  CategoryUseCaseInput(this.id);
}