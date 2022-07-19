class GetFavoriteDataResponse {
  bool? status;

  DataGetFavoriteDataResponse? data;

  GetFavoriteDataResponse({this.status, this.data});

  GetFavoriteDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? DataGetFavoriteDataResponse.fromJson(json['data']) : null;
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

class DataGetFavoriteDataResponse {
  int? currentPage;
  List<DataGetFavoriteResponse>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;

  String? path;
  int? perPage;

  int? to;
  int? total;

  DataGetFavoriteDataResponse(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,

        this.path,
        this.perPage,

        this.to,
        this.total});

  DataGetFavoriteDataResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataGetFavoriteResponse>[];
      json['data'].forEach((v) {
        data!.add(DataGetFavoriteResponse.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];

    path = json['path'];
    perPage = json['per_page'];

    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;

    data['path'] = path;
    data['per_page'] = perPage;

    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class DataGetFavoriteResponse {
  int? id;
  ProductGetFavoriteDataResponse? product;

  DataGetFavoriteResponse({this.id, this.product});

  DataGetFavoriteResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? ProductGetFavoriteDataResponse.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class ProductGetFavoriteDataResponse {
  int? id;
  num? price;
  num? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  ProductGetFavoriteDataResponse(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description});

  ProductGetFavoriteDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
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
    return data;
  }
}
