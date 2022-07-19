 class HomeResponse {
  bool? status;

  DataHomeResponse? data;

  HomeResponse({this.status,  this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? DataHomeResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataHomeResponse {
  List<BannersHomeResponse>? banners;
  List<ProductsHomeResponse>? products;
  String? ad;

  DataHomeResponse({this.banners, this.products, this.ad});

  DataHomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <BannersHomeResponse>[];
      json['banners'].forEach((v) {
        banners!.add(BannersHomeResponse.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <ProductsHomeResponse>[];
      json['products'].forEach((v) {
        products!.add(ProductsHomeResponse.fromJson(v));
      });
    }
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['ad'] = ad;
    return data;
  }
}

class BannersHomeResponse {
  int? id;
  String? image;


  BannersHomeResponse({this.id, this.image});

  BannersHomeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;

    return data;
  }
}

class ProductsHomeResponse {
  int? id;
  num? price;
  num? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  ProductsHomeResponse(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.images,
        this.inFavorites,
        this.inCart});

  ProductsHomeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['images'] = images;
    data['in_favorites'] = inFavorites;
    data['in_cart'] = inCart;
    return data;
  }
}
