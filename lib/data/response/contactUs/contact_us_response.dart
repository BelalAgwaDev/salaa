class ContactUsResponse {
  bool? status;

  DataContactUsResponse? data;

  ContactUsResponse({this.status, this.data});

  ContactUsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? DataContactUsResponse.fromJson(json['data']) : null;
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

class DataContactUsResponse {
  int? currentPage;
  List<DataContactUsDataResponse>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;

  String? path;
  int? perPage;

  int? to;
  int? total;

  DataContactUsResponse(
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

  DataContactUsResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataContactUsDataResponse>[];
      json['data'].forEach((v) {
        data!.add(DataContactUsDataResponse.fromJson(v));
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

class DataContactUsDataResponse {
  int? id;
  int? type;
  String? value;
  String? image;

  DataContactUsDataResponse({this.id, this.type, this.value, this.image});

  DataContactUsDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    value = json['value'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['value'] = value;
    data['image'] = image;
    return data;
  }
}