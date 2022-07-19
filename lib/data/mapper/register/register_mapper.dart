import 'package:salaa/app/extantion.dart';

import 'package:salaa/data/response/register/register_response.dart';

import 'package:salaa/domain/model/register/register_model.dart';

import '../../../app/constant.dart';

extension RegisterResponsesMapper on RegisterResponse? {
  RegisterModel toDomain() {
    return RegisterModel(this?.status.orFalse() ?? Constant.dataFalse,
        this?.message.orEmpty() ?? Constant.empty, this?.data.toDomain());
  }
}

extension RegisterDataResponsesMapper on DataRegisterResponse? {
  DataRegisterModel toDomain() {
    return DataRegisterModel(
      this?.name.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.id.orZero() ?? Constant.zero,
      this?.image.orEmpty() ?? Constant.empty,
      this?.token.orEmpty() ?? Constant.empty,
    );
  }
}
