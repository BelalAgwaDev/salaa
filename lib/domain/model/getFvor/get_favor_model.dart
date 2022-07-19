class GetFavoriteDataModel {
  bool status;

  DataGetFavoriteDataModel? data;

  GetFavoriteDataModel(this.status,  this.data);

}

class DataGetFavoriteDataModel {

  int currentPage;
  List<DataGetFavoriteModel>? data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;

  String path;
  int perPage;

  int to;
  int total;

  DataGetFavoriteDataModel(
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

class DataGetFavoriteModel {
  int id;
  ProductGetFavoriteDataModel? product;

  DataGetFavoriteModel(this.id, this.product);


}

class ProductGetFavoriteDataModel {
  int id;
  num price;
  num oldPrice;
  int discount;
  String image;
  String name;
  String description;

  ProductGetFavoriteDataModel(
      this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description);


}
