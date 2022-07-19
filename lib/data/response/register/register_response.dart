class RegisterResponse {
  bool? status;
  String? message;
  DataRegisterResponse? data;

  RegisterResponse({this.status, this.message, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataRegisterResponse.fromJson(json['data']) : null;
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

class DataRegisterResponse {
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  DataRegisterResponse({this.name, this.phone, this.email, this.id, this.image, this.token});

  DataRegisterResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['id'] = id;
    data['image'] = image;
    data['token'] = token;
    return data;
  }
}