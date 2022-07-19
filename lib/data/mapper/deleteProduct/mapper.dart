

import 'package:salaa/app/extantion.dart';

import '../../../app/constant.dart';
import '../../../domain/model/deleteProduct/model.dart';
import '../../response/deleteProduct/response.dart';





extension DeleteProductDaTaResponseResponsesMapper on DeleteProductDaTaResponse? {
  DeleteProductDaTaModel toDomain() {
    return DeleteProductDaTaModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.message.orEmpty() ?? Constant.empty,
        this?.data.toDomain()

    );
  }
}



extension DataDeleteProductDaTaResponseResponsesMapper on DataDeleteProductDaTaResponse? {

  DataDeleteProductDaTaModel toDomain() {
    return DataDeleteProductDaTaModel(
      this?.cart.toDomain(),
      this?.subTotal.orZero() ?? Constant.zero,
      this?.total.orZero() ?? Constant.zero,

    );
  }
}



extension CartItemsGetProductDaTaResponseResponsesMapper on CartDeleteProductDaTaResponse? {
  CartDeleteProductDaTaModel toDomain() {
    return CartDeleteProductDaTaModel(
        this?.id.orZero()??Constant.zero,
        this?.quantity.orZero()??Constant.zero,
        this?.product.toDomain()
    );
  }
}


extension ProductDeleteProductDaTaResponseMapper on ProductDeleteProductDaTaResponse? {
  ProductDeleteProductDaTaModel toDomain() {
    return ProductDeleteProductDaTaModel(
      this?.id.orZero()??Constant.zero,
      this?.price.orZero()??Constant.zero,
      this?.oldPrice.orZero()??Constant.zero,
      this?.discount.orZero()??Constant.zero,
      this?.image.orEmpty()??Constant.empty,


    );
  }
}

