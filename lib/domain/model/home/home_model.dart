class HomeModel {
  bool status;

  Data? data;

  HomeModel(this.status, this.data);

}

class Data {
  List<Banners>? banners;
  List<Products>? products;
  String ad;

  Data(this.banners, this.products, this.ad);




}

class Banners {
  int id;
  String image;
  Banners(this.id, this.image);

}

class Products {
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

  Products(
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
