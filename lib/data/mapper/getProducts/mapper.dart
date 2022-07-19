

import 'package:salaa/app/extantion.dart';

import '../../../app/constant.dart';
import '../../../domain/model/getProduct/model.dart';
import '../../response/getProduct/response.dart';



extension GetProductDaTaResponseResponsesMapper on GetProductDaTaResponse? {
  GetProductDaTaModel toDomain() {
    return GetProductDaTaModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.data.toDomain()

    );
  }
}



extension DataGetProductDaTaResponseResponsesMapper on DataGetProductDaTaResponse? {

  DataGetProductDaTaModel toDomain() {
    List<CartItemsGetProductDaTaModel>? dataResponse = (this?.cartItems?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<CartItemsGetProductDaTaModel>()
        .toList();
    return DataGetProductDaTaModel(
      dataResponse,
      this?.subTotal.orDoubleZero() ?? Constant.zero,
      this?.total.orDoubleZero() ?? Constant.zero,

    );
  }
}



extension CartItemsGetProductDaTaResponseResponsesMapper on CartItemsGetProductDaTaResponse? {
  CartItemsGetProductDaTaModel toDomain() {
    return CartItemsGetProductDaTaModel(
        this?.id.orZero()??Constant.zero,
        this?.quantity.orZero()??Constant.zero,
        this?.product.toDomain()
    );
  }
}


extension ProductGetProductDaTaResponsesMapper on ProductGetProductDaTaResponse? {
  ProductGetProductDaTaModel toDomain() {
    return ProductGetProductDaTaModel(
      this?.id.orZero()??Constant.zero,
      this?.price.orDoubleZero()??Constant.zero,
      this?.oldPrice.orDoubleZero()??Constant.zero,
      this?.discount.orDoubleZero()??Constant.zero,
      this?.image.orEmpty()??Constant.empty,
      this?.name.orEmpty()??Constant.empty,
      this?.description.orEmpty()??Constant.empty,
      this?.images.orList(),
      this?.inFavorites.orFalse()??Constant.dataFalse,
      this?.inCart.orFalse()??Constant.dataFalse,


    );
  }
}





