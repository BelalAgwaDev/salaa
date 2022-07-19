class CategoryDaTADetailsModel {
  bool status;

  DataCategoryDaTADetailsModel? data;

  CategoryDaTADetailsModel(this.status,  this.data);


}

class DataCategoryDaTADetailsModel {
  int currentPage;
  List<DataProductCategoryDaTADetailsModel>? data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;

  String path;
  int perPage;

  int to;
  int total;

  DataCategoryDaTADetailsModel(
      this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,

        this.path,
        this.perPage,

        this.to,
        this.total);


}

class DataProductCategoryDaTADetailsModel {
  int id;
  num price;
  num oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  DataProductCategoryDaTADetailsModel(
      this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.images,
        this.inFavorites,
        this.inCart);


}
