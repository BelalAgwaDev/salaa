class UpdateProductDaTaModel {
  bool status;
  String message;
  DataUpdateProductDaTaModel? data;

  UpdateProductDaTaModel(this.status, this.message, this.data);


}

class DataUpdateProductDaTaModel {
  CartUpdateProductDaTaModel? cart;
  int subTotal;
  int total;

  DataUpdateProductDaTaModel(this.cart, this.subTotal, this.total);


}

class CartUpdateProductDaTaModel {
  int id;
  int quantity;
  ProductUpdateProductDaTaModel? product;

  CartUpdateProductDaTaModel(this.id, this.quantity, this.product);


}

class ProductUpdateProductDaTaModel {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;

  ProductUpdateProductDaTaModel(this.id, this.price, this.oldPrice, this.discount, this.image);

}
