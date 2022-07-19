
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:salaa/app/constant.dart';
import 'package:salaa/data/response/favResponse/favorites_response.dart';
import 'package:salaa/data/response/home/category_response.dart';
import 'package:salaa/data/response/home/home_response.dart';
import 'package:salaa/data/response/login/login_response.dart';
import 'package:salaa/data/response/register/register_response.dart';

import '../../response/AddProduct/response.dart';
import '../../response/aboutAs/about_as_response.dart';
import '../../response/catogery/category_data_response.dart';
import '../../response/contactUs/contact_us_response.dart';
import '../../response/deleteProduct/response.dart';
import '../../response/getFavor/get_favor_response.dart';
import '../../response/getProduct/response.dart';
import '../../response/updateProduct/response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("login")
  Future<LoginResponse> login(
      @Field("email") String email, @Field("password") String password);

  @POST("register")
  Future<RegisterResponse> register(
      @Field("name") String name,
      @Field("email") String email,
      @Field("phone") String phone,
      @Field("password") String password);

  @GET("home")
  Future<HomeResponse> home();

  @GET("categories")
  Future<CategoryResponse> category();

  @POST("favorites")
  Future<FavoriteResponse> fav(@Field("product_id") int productId);

  @GET("categories")
  Future<CategoryDaTADetailsResponse> categoryData(int id);

  @GET("favorites")
  Future<GetFavoriteDataResponse> getFavorites();

  @GET("settings")
  Future<AboutAsResponse> getSettings();

  @GET("contacts")
  Future<ContactUsResponse> getContacts();

  @POST("products/search")
  Future<CategoryDaTADetailsResponse> search(@Field("text") String text);

  @PUT("update-profile")
  Future<LoginResponse> profile(
    @Field("name") String name,
    @Field("phone") String phone,
    @Field("email") String email,
  );

  @GET("carts")
  Future<GetProductDaTaResponse> getProducts();

  @POST("carts")
  Future<AddProduct> addProducts(@Field("product_id") int productId);

  @DELETE("carts/")
  Future<DeleteProductDaTaResponse> deleteProduct(int id);

  @PUT("carts/")
  Future<UpdateProductDaTaResponse> updateProduct(@Field("quantity") int quantity, int id);
}
