import 'package:salaa/app/extantion.dart';
import 'package:salaa/data/response/home/category_response.dart';
import 'package:salaa/domain/model/home/category.dart';

import '../../../app/constant.dart';

extension CategoryResponsesMapper on CategoryResponse? {
  CategoryModel toDomain() {
    return CategoryModel(
        this?.status.orFalse() ?? Constant.dataFalse, this?.data.toDomain());
  }
}

extension DataHomeResponsesMapper on DataCategoryResponse? {
  DataCategoryModel toDomain() {
    List<DataCategory>? dataResponse =
        (this?.data?.map((dataResponse) => dataResponse.toDomain()) ??
                const Iterable.empty())
            .cast<DataCategory>()
            .toList();

    return DataCategoryModel(
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


extension ProudictResponsesMapper on Data? {
  DataCategory toDomain() {
    return DataCategory(
      this?.id.orZero() ?? Constant.zero,
      this?.name.orEmpty() ?? Constant.empty,
      this?.image.orEmpty() ?? Constant.empty,

    );
  }
}
