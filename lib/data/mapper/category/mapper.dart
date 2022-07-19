

import 'package:salaa/app/extantion.dart';
import 'package:salaa/data/response/catogery/category_data_response.dart';
import 'package:salaa/domain/model/category/category_model.dart';

import '../../../app/constant.dart';







extension FavorResponsesMapper on CategoryDaTADetailsResponse? {
  CategoryDaTADetailsModel toDomain() {
    return CategoryDaTADetailsModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.data.toDomain()

    );
  }
}



extension DataFavorResponsesMapper on DataCategoryDaTADetailsResponse? {
  DataCategoryDaTADetailsModel toDomain() {
    List<DataProductCategoryDaTADetailsModel>? dataResponse = (this?.data?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataProductCategoryDaTADetailsModel>()
        .toList();
    return DataCategoryDaTADetailsModel(
        this?.currentPage.orZero() ?? Constant.zero,
        dataResponse,
      this?.firstPageUrl.orEmpty() ?? Constant.empty,
      this?.from.orZero() ?? Constant.zero,
      this?.lastPage.orZero() ?? Constant.zero,
      this?.lastPageUrl.orEmpty() ?? Constant.empty,
      this?.path.orEmpty() ?? Constant.empty,
      this?.perPage.orZero() ?? Constant.zero,
      this?.to.orZero() ?? Constant.zero,
      this?.total.orZero() ?? Constant.zero,

    );
  }
}



extension ProductFavoResponsesMapper on DataProductCategoryDaTADetailsResponse? {
  DataProductCategoryDaTADetailsModel toDomain() {
    return DataProductCategoryDaTADetailsModel(
      this?.id.orZero()??Constant.zero,
      this?.price.orDoubleZero()??Constant.zeroDouble,
      this?.oldPrice.orDoubleZero()??Constant.zeroDouble,
      this?.discount.orZero()??Constant.zero,
      this?.image.orEmpty()??Constant.empty,
      this?.name.orEmpty()??Constant.empty,
      this?.description.orEmpty()??Constant.empty,
      this!.images.orList(),
      this?.inFavorites.orFalse()??Constant.dataFalse,
      this?.inCart.orFalse()??Constant.dataFalse,
    );
  }
}






