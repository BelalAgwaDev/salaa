class CategoryModel {
  bool status;
  DataCategoryModel? data;

  CategoryModel(this.status, this.data);

}

class DataCategoryModel{
  int currentPage;
  List<DataCategory>? data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String path;
  int perPage;
  int to;
  int total;

  DataCategoryModel(
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

class DataCategory {
  int id;
  String name;
  String image;

  DataCategory(this.id, this.name, this.image);

}