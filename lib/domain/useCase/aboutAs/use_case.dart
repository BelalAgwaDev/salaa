


import 'package:dartz/dartz.dart';
import 'package:salaa/domain/model/aboutAs/about_as_model.dart';

import '../../../data/network/failure/failure.dart';
import '../../repositry/repositry.dart';
import '../base/base_use_case.dart';

class GetSettingsUseCase implements BaseUseCase<void,AboutAsModel>{
  final Repository _repositry;
  GetSettingsUseCase(this._repositry);
  @override
  Future<Either<Failure, AboutAsModel>> execute(void input)async {
    return await _repositry.getSettings();
  }
}