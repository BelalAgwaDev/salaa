



import 'package:dartz/dartz.dart';
import 'package:salaa/data/network/request/search/search_request.dart';

import '../../../data/network/failure/failure.dart';
import '../../model/category/category_model.dart';
import '../../repositry/repositry.dart';
import '../base/base_use_case.dart';

class SearchUseCase implements BaseUseCase<SearchUseCaseInput,CategoryDaTADetailsModel>{
  final Repository _repositry;
  SearchUseCase(this._repositry);
  @override
  Future<Either<Failure, CategoryDaTADetailsModel>> execute(SearchUseCaseInput input)async {
    return await _repositry.search(SearchRequest(input.text));
  }
}

class SearchUseCaseInput{
  String text;
  SearchUseCaseInput(this.text);
}