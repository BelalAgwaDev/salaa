class LoginModel {
  bool status;
  String message;
  DataLoginModel? data;

  LoginModel(this.status, this.message, this.data);


}

class DataLoginModel {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  DataLoginModel(
      this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.points,
        this.credit,
        this.token);


}
