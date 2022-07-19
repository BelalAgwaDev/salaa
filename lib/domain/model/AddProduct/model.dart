class AddProductModel {
  bool status;
  String message;
  DataAddProductModel? data;

  AddProductModel(this.status, this.message, this.data);


}

class DataAddProductModel {
  int id;
  int quantity;
  ProductAddProductModel? product;

  DataAddProductModel(this.id, this.quantity, this.product);


}

class ProductAddProductModel {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;

  ProductAddProductModel(
      this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description);

}
