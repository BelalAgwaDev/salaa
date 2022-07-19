class AboutAsResponse {
  bool? status;

  DataAboutAsResponse? data;

  AboutAsResponse({this.status, this.data});

  AboutAsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? DataAboutAsResponse.fromJson(json['data']) : null;
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

class DataAboutAsResponse {
  String? about;
  String? terms;

  DataAboutAsResponse({this.about, this.terms});

  DataAboutAsResponse.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['about'] = about;
    data['terms'] = terms;
    return data;
  }
}

