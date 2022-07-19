


import 'package:salaa/app/extantion.dart';

import '../../../app/constant.dart';
import '../../../domain/model/AddProduct/model.dart';
import '../../response/AddProduct/response.dart';




extension AddProductResponsesMapper on AddProduct? {
  AddProductModel toDomain() {
    return AddProductModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.message.orEmpty() ?? Constant.empty,
        this?.data.toDomain()

    );
  }
}



extension DataAddProductResponsesMapper on DataAddProduct? {
  DataAddProductModel toDomain() {

    return DataAddProductModel(
        this?.id.orZero() ?? Constant.zero,
        this?.quantity.orZero() ?? Constant.zero,
        this?.product.toDomain()

    );
  }
}



extension ProductAddProductResponsesMapper on ProductAddProduct? {
  ProductAddProductModel toDomain() {
    return ProductAddProductModel(
      this?.id.orZero()??Constant.zero,
      this?.price.orZero()??Constant.zero,
      this?.oldPrice.orZero()??Constant.zero,
      this?.discount.orZero()??Constant.zero,
      this?.image.orEmpty()??Constant.empty,
      this?.name.orEmpty()??Constant.empty,
      this?.description.orEmpty()??Constant.empty,
    );
  }
}




