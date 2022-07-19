

import 'package:salaa/app/extantion.dart';
import 'package:salaa/data/response/contactUs/contact_us_response.dart';
import 'package:salaa/domain/model/contactUs/contact_us_model.dart';

import '../../../app/constant.dart';






extension ConatactUsResponsesMapper on ContactUsResponse? {
  ContactUsModel toDomain() {
    return ContactUsModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.data.toDomain()

    );
  }
}



extension DataConatactUsResponsesMapper on DataContactUsDataResponse? {
  DataContactUsDataModel toDomain() {
    return DataContactUsDataModel(
        this?.id.orZero() ?? Constant.zero,
      this?.type.orZero() ?? Constant.zero,
      this?.value.orEmpty() ?? Constant.empty,
      this?.image.orEmpty() ?? Constant.empty,

    );
  }
}



extension ProductConatactUsResponsesMapper on DataContactUsResponse? {
  DataContactUsModel toDomain() {
    List<DataContactUsDataModel> productResponse =
    (this?.data?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataContactUsDataModel>()
        .toList();
    return DataContactUsModel(
      this?.currentPage.orZero()??Constant.zero,
      productResponse,
      this?.firstPageUrl.orEmpty()??Constant.empty,
      this?.from.orZero()??Constant.zero,
      this?.lastPage.orZero()??Constant.zero,
      this?.lastPageUrl.orEmpty()??Constant.empty,
      this?.path.orEmpty()??Constant.empty,
      this?.perPage.orZero()??Constant.zero,
      this?.to.orZero()??Constant.zero,
      this?.total.orZero()??Constant.zero,
    );
  }
}


