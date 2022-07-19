



import 'package:salaa/app/extantion.dart';
import 'package:salaa/data/response/aboutAs/about_as_response.dart';
import 'package:salaa/domain/model/aboutAs/about_as_model.dart';

import '../../../app/constant.dart';

extension AboutAsResponsesMapper on AboutAsResponse? {
  AboutAsModel toDomain() {
    return AboutAsModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.data.toDomain()

    );
  }
}


extension AboutAsDataResponsesMapper on DataAboutAsResponse? {
  DataAboutAsModel toDomain() {
    return DataAboutAsModel(
        this?.about.orEmpty() ?? Constant.empty,
        this?.terms.orEmpty()??Constant.empty

    );
  }
}