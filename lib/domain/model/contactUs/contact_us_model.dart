class ContactUsModel {
  bool status;

  DataContactUsModel? data;

  ContactUsModel(this.status, this.data);


}

class DataContactUsModel {
  int currentPage;
  List<DataContactUsDataModel>? data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;

  String path;
  int perPage;

  int to;
  int total;

  DataContactUsModel(
      this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,

        this.path,
        this.perPage,

        this.to,
        this.total);

}

class DataContactUsDataModel {
  int id;
  int type;
  String value;
  String image;

  DataContactUsDataModel(this.id, this.type, this.value, this.image);


}