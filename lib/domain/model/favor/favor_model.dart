class FavoriteModel {
  bool status;
  String message;
  DataFavoriteModel? data;

  FavoriteModel(this.status, this.message, this.data);


}

class DataFavoriteModel {
  int id;
  ProductFavoriteModel? product;

  DataFavoriteModel(this.id, this.product);


}

class ProductFavoriteModel {
  int id;
  num price;
  num oldPrice;
  int discount;
  String image;

  ProductFavoriteModel(this.id, this.price, this.oldPrice, this.discount, this.image);


}