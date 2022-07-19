


import 'package:salaa/app/extantion.dart';
import 'package:salaa/data/response/favResponse/favorites_response.dart';
import 'package:salaa/domain/model/favor/favor_model.dart';

import '../../../app/constant.dart';




extension FavorResponsesMapper on FavoriteResponse? {
  FavoriteModel toDomain() {
    return FavoriteModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.message.orEmpty() ?? Constant.empty,
        this?.data.toDomain()

    );
  }
}



extension DataFavorResponsesMapper on DataFavoriteResponse? {
  DataFavoriteModel toDomain() {
    return DataFavoriteModel(
        this?.id.orZero() ?? Constant.zero,
        this?.product.toDomain()

    );
  }
}



extension ProductFavoResponsesMapper on ProductFavoriteResponse? {
  ProductFavoriteModel toDomain() {
    return ProductFavoriteModel(
      this?.id.orZero()??Constant.zero,
      this?.price.orDoubleZero()??Constant.zeroDouble,
      this?.oldPrice.orDoubleZero()??Constant.zeroDouble,
      this?.discount.orZero()??Constant.zero,
      this?.image.orEmpty()??Constant.empty,
    );
  }
}









