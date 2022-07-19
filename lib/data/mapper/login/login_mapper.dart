import 'package:salaa/app/extantion.dart';
import 'package:salaa/data/response/login/login_response.dart';
import 'package:salaa/domain/model/login/login_model.dart';

import '../../../app/constant.dart';

extension LoginResponsesMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(this?.status.orFalse() ?? Constant.dataFalse,
        this?.message.orEmpty() ?? Constant.empty, this?.data.toDomain());
  }
}

extension DataLoginResponsesMapper on DataLoginResponse? {
  DataLoginModel toDomain() {
    return DataLoginModel(
      this?.id.orZero() ?? Constant.zero,
      this?.name.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.image.orEmpty() ?? Constant.empty,
      this?.points.orZero() ?? Constant.zero,
      this?.credit.orZero() ?? Constant.zero,
      this?.token.orEmpty() ?? Constant.empty,
    );
  }
}
