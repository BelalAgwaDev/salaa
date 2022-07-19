class RegisterModel {
  bool status;
  String message;
  DataRegisterModel? data;

  RegisterModel(this.status, this.message, this.data);




}

class DataRegisterModel {
  String name;
  String phone;
  String email;
  int id;
  String image;
  String token;

  DataRegisterModel(this.name, this.phone, this.email, this.id, this.image, this.token);


}