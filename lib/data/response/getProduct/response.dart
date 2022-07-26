class GetProductDaTaResponse {
  bool? status;

  DataGetProductDaTaResponse? data;

  GetProductDaTaResponse({this.status, this.data});

  GetProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? DataGetProductDaTaResponse.fromJson(json['data']) : null;
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

class DataGetProductDaTaResponse {
  List<CartItemsGetProductDaTaResponse>? cartItems;
  num? subTotal;
  num? total;

  DataGetProductDaTaResponse({this.cartItems, this.subTotal, this.total});

  DataGetProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItemsGetProductDaTaResponse>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItemsGetProductDaTaResponse.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['sub_total'] = subTotal;
    data['total'] = total;
    return data;
  }
}

class CartItemsGetProductDaTaResponse {
  int? id;
  int? quantity;
  ProductGetProductDaTaResponse? product;

  CartItemsGetProductDaTaResponse({this.id, this.quantity, this.product});

  CartItemsGetProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? ProductGetProductDaTaResponse.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class ProductGetProductDaTaResponse {
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  ProductGetProductDaTaResponse(
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

  ProductGetProductDaTaResponse.fromJson(Map<String, dynamic> json) {
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