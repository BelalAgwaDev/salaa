class GetProductDaTaModel {
  bool status;

  DataGetProductDaTaModel? data;

  GetProductDaTaModel(this.status, this.data);


}

class DataGetProductDaTaModel {
  List<CartItemsGetProductDaTaModel>? cartItems;
  num subTotal;
  num total;

  DataGetProductDaTaModel(this.cartItems, this.subTotal, this.total);


}

class CartItemsGetProductDaTaModel {
  int id;
  int quantity;
  ProductGetProductDaTaModel? product;

  CartItemsGetProductDaTaModel(this.id, this.quantity, this.product);


}

class ProductGetProductDaTaModel {
  int id;
  num price;
  num oldPrice;
  num discount;
  String image;
  String name;
  String description;
  List<String>? images;
  bool inFavorites;
  bool inCart;

  ProductGetProductDaTaModel(
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
