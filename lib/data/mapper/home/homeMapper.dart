
import 'package:salaa/app/extantion.dart';

import '../../../app/constant.dart';
import '../../../domain/model/home/home_model.dart';
import '../../response/home/home_response.dart';





extension HomeResponsesMapper on HomeResponse? {
  HomeModel toDomain() {
    return HomeModel(
        this?.status.orFalse() ?? Constant.dataFalse,
        this?.data.toDomain()

    );
  }
}



extension DataHomeResponsesMapper on DataHomeResponse? {
  Data toDomain() {
    List<Banners> bannerResponse =
    (this?.banners?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<Banners>()
        .toList();

    List<Products> productResponse =
    (this?.products?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<Products>()
        .toList();

    return Data(
      bannerResponse,
        productResponse,
      this?.ad.orEmpty()??Constant.empty
      
    
    );
    
  }
}



extension BannersHomeResponsesMapper on BannersHomeResponse? {
  Banners toDomain() {
    return Banners(
      this?.id.orZero()??Constant.zero,
        this?.image.orEmpty()??Constant.empty,
    );
  }
}







extension ProudictResponsesMapper on ProductsHomeResponse? {
  Products toDomain() {
    return Products(
      this?.id.orZero()??Constant.zero,
      this?.price.orDoubleZero() ?? Constant.zeroDouble,
      this?.oldPrice .orDoubleZero() ?? Constant.zeroDouble,
      this?.discount.orZero()??Constant.zero,
      this?.image.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.description.orEmpty() ?? Constant.empty,
      this!.images.orList(),
      this?.inFavorites.orFalse() ?? Constant.dataFalse,
      this?.inCart.orFalse()??Constant.dataFalse,
    );
  }
}