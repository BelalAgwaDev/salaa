class DeleteProductDaTaModel {
  bool status;
  String message;
  DataDeleteProductDaTaModel? data;

  DeleteProductDaTaModel(this.status, this.message, this.data);

}

class DataDeleteProductDaTaModel {
  CartDeleteProductDaTaModel? cart;
  int subTotal;
  int total;

  DataDeleteProductDaTaModel(this.cart, this.subTotal, this.total);


}

class CartDeleteProductDaTaModel {
  int id;
  int quantity;
  ProductDeleteProductDaTaModel? product;

  CartDeleteProductDaTaModel(this.id, this.quantity, this.product);


}

class ProductDeleteProductDaTaModel {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;

  ProductDeleteProductDaTaModel(this.id, this.price, this.oldPrice, this.discount, this.image);


}



