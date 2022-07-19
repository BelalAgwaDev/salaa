

import 'package:dartz/dartz.dart';
import 'package:salaa/domain/model/home/category.dart';

import '../../../data/network/failure/failure.dart';
import '../../repositry/repositry.dart';
import '../base/base_use_case.dart';

class CategoryUseCase implements BaseUseCase<void,CategoryModel>{
  final Repository _repositry;
  CategoryUseCase(this._repositry);
  @override
  Future<Either<Failure, CategoryModel>> execute(void input)async {
    return await _repositry.category();
  }
}
