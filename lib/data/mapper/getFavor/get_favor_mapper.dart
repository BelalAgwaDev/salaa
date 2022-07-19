

import 'package:salaa/app/extantion.dart';
import 'package:salaa/data/response/getFavor/get_favor_response.dart';
import 'package:salaa/domain/model/getFvor/get_favor_model.dart';

import '../../../app/constant.dart';



extension FavorDataResponsesMapper on GetFavoriteDataResponse? {
  GetFavoriteDataModel toDomain() {
    return GetFavoriteDataModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.data.toDomain()

    );
  }
}



extension DataFavorResponsesMapper on DataGetFavoriteDataResponse? {

  DataGetFavoriteDataModel toDomain() {
    List<DataGetFavoriteModel>? dataResponse = (this?.data?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataGetFavoriteModel>()
        .toList();
    return DataGetFavoriteDataModel(
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



extension ProductFavoResponsesMapper on DataGetFavoriteResponse? {
  DataGetFavoriteModel toDomain() {
    return DataGetFavoriteModel(
      this?.id.orZero()??Constant.zero,
        this?.product.toDomain()
    );
  }
}


extension ProductDataFavoResponsesMapper on ProductGetFavoriteDataResponse? {
  ProductGetFavoriteDataModel toDomain() {
    return ProductGetFavoriteDataModel(
        this?.id.orZero()??Constant.zero,
      this?.price.orDoubleZero()??Constant.zero,
      this?.oldPrice.orDoubleZero()??Constant.zero,
      this?.discount.orZero()??Constant.zero,
      this?.image.orEmpty()??Constant.empty,
      this?.name.orEmpty()??Constant.empty,
      this?.description.orEmpty()??Constant.empty,

    );
  }
}





