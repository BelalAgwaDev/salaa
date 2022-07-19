

import 'package:salaa/app/extantion.dart';

import '../../../app/constant.dart';
import '../../../domain/model/updateProduct/model.dart';
import '../../response/updateProduct/response.dart';





extension UpdateProductDaTaResponseResponsesMapper on UpdateProductDaTaResponse? {
  UpdateProductDaTaModel toDomain() {
    return UpdateProductDaTaModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.message.orEmpty() ?? Constant.empty,
        this?.data.toDomain()

    );
  }
}



extension DataUpdateProductDaTaResponseResponsesMapper on DataUpdateProductDaTaResponse? {

  DataUpdateProductDaTaModel toDomain() {
    return DataUpdateProductDaTaModel(
        this?.cart.toDomain(),
        this?.subTotal.orZero() ?? Constant.zero,
      this?.total.orZero() ?? Constant.zero,

    );
  }
}



extension CartUpdateProductDaTaResponseResponsesMapper on CartUpdateProductDaTaResponse? {
  CartUpdateProductDaTaModel toDomain() {
    return CartUpdateProductDaTaModel(
        this?.id.orZero()??Constant.zero,
        this?.quantity.orZero()??Constant.zero,
        this?.product.toDomain()
    );
  }
}


extension ProductGetProductDaTaResponsesMapper on ProductUpdateProductDaTaResponse? {
  ProductUpdateProductDaTaModel toDomain() {
    return ProductUpdateProductDaTaModel(
      this?.id.orZero()??Constant.zero,
      this?.price.orZero()??Constant.zero,
      this?.oldPrice.orZero()??Constant.zero,
      this?.discount.orZero()??Constant.zero,
      this?.image.orEmpty()??Constant.empty,

    );
  }
}

