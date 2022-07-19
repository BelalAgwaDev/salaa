class DeleteProductDaTaResponse {
  bool? status;
  String? message;
  DataDeleteProductDaTaResponse? data;

  DeleteProductDaTaResponse({this.status, this.message, this.data});

  DeleteProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataDeleteProductDaTaResponse.fromJson(json['data']) : null;
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

class DataDeleteProductDaTaResponse {
  CartDeleteProductDaTaResponse? cart;
  int? subTotal;
  int? total;

  DataDeleteProductDaTaResponse({this.cart, this.subTotal, this.total});

  DataDeleteProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? CartDeleteProductDaTaResponse.fromJson(json['cart']) : null;
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

class CartDeleteProductDaTaResponse {
  int? id;
  int? quantity;
  ProductDeleteProductDaTaResponse? product;

  CartDeleteProductDaTaResponse({this.id, this.quantity, this.product});

  CartDeleteProductDaTaResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? ProductDeleteProductDaTaResponse.fromJson(json['product']) : null;
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

class ProductDeleteProductDaTaResponse {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;

  ProductDeleteProductDaTaResponse({this.id, this.price, this.oldPrice, this.discount, this.image});

  ProductDeleteProductDaTaResponse.fromJson(Map<String, dynamic> json) {
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
