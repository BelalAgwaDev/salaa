
class UpdateProductDaTaResponse {
  bool? status;
  String? message;
  DataUpdateProductDaTaResponse? data;

  UpdateProductDaTaResponse({this.status, this.message, this.data});

  UpdateProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataUpdateProductDaTaResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataUpdateProductDaTaResponse {
  CartUpdateProductDaTaResponse? cart;
  int? subTotal;
  int? total;

  DataUpdateProductDaTaResponse({this.cart, this.subTotal, this.total});

  DataUpdateProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? CartUpdateProductDaTaResponse.fromJson(json['cart']) : null;
    subTotal = json['sub_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cart != null) {
      data['cart'] = cart!.toJson();
    }
    data['sub_total'] = subTotal;
    data['total'] = total;
    return data;
  }
}

class CartUpdateProductDaTaResponse {
  int? id;
  int? quantity;
  ProductUpdateProductDaTaResponse? product;

  CartUpdateProductDaTaResponse({this.id, this.quantity, this.product});

  CartUpdateProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? ProductUpdateProductDaTaResponse.fromJson(json['product']) : null;
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

class ProductUpdateProductDaTaResponse {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;

  ProductUpdateProductDaTaResponse({this.id, this.price, this.oldPrice, this.discount, this.image});

  ProductUpdateProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    return data;
  }
}
