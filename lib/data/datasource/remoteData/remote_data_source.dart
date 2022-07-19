import 'package:salaa/data/network/request/category/category_request.dart';
import 'package:salaa/data/network/request/favo/favor_request.dart';
import 'package:salaa/data/network/request/profile/request.dart';
import 'package:salaa/data/response/catogery/category_data_response.dart';
import 'package:salaa/data/response/favResponse/favorites_response.dart';
import 'package:salaa/data/response/home/category_response.dart';
import 'package:salaa/data/response/home/home_response.dart';
import 'package:salaa/data/response/login/login_response.dart';
import 'package:salaa/data/response/register/register_response.dart';

import '../../network/api/app_api.dart';
import '../../network/request/addProduct/request.dart';
import '../../network/request/login/login_request.dart';
import '../../network/request/register/register_request.dart';
import '../../network/request/search/search_request.dart';
import '../../network/request/updateProduct/product.dart';
import '../../response/AddProduct/response.dart';
import '../../response/aboutAs/about_as_response.dart';
import '../../response/contactUs/contact_us_response.dart';
import '../../response/deleteProduct/response.dart';
import '../../response/getFavor/get_favor_response.dart';
import '../../response/getProduct/response.dart';
import '../../response/updateProduct/response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<LoginResponse> profile(ProfileRequest profileRequest);
  Future<FavoriteResponse> favor(FavorRequest favorRequest);
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<HomeResponse> home();
  Future<CategoryResponse> category();
  Future<AboutAsResponse> getSettings();
  Future<ContactUsResponse> getContacts();
  Future<CategoryDaTADetailsResponse> categoryData(CategoryRequest request);
  Future<GetFavoriteDataResponse> getFavor();
  Future<CategoryDaTADetailsResponse> search(SearchRequest searchRequest);
  Future<GetProductDaTaResponse> getProduct();
  Future<AddProduct> addProducts(ProductRequest productRequest);
  Future<DeleteProductDaTaResponse> deleteProduct(ProductRequest productRequest);
  Future<UpdateProductDaTaResponse> updateProduct(UpdateProductRequest updateProductRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(registerRequest.name,
         registerRequest.email, registerRequest.phone,registerRequest.password);
  }

  @override
  Future<HomeResponse> home() async{
    return await _appServiceClient.home();
  }

  @override
  Future<CategoryResponse> category() async{
    return await _appServiceClient.category();
  }

  @override
  Future<FavoriteResponse> favor(FavorRequest favorRequest)async {
    return await  _appServiceClient.fav(favorRequest.id);
  }

  @override
  Future<CategoryDaTADetailsResponse> categoryData(CategoryRequest request) async{
    return await _appServiceClient.categoryData(request.id);
  }

  @override
  Future<GetFavoriteDataResponse> getFavor() async{
    return await _appServiceClient.getFavorites();
  }

  @override
  Future<CategoryDaTADetailsResponse> search(SearchRequest request) async{
    return await _appServiceClient.search(request.text);
  }

  @override
  Future<ContactUsResponse> getContacts() async{
    return await _appServiceClient.getContacts();
  }

  @override
  Future<AboutAsResponse> getSettings() async{
    return await _appServiceClient.getSettings();
  }

  @override
  Future<LoginResponse> profile(ProfileRequest profileRequest) async{
    return await _appServiceClient.profile(
        profileRequest.name, profileRequest.phone,profileRequest.email);
  }

  @override
  Future<AddProduct> addProducts(ProductRequest productRequest) async{
    return await _appServiceClient.addProducts(
        productRequest.productId);
  }

  @override
  Future<DeleteProductDaTaResponse> deleteProduct(ProductRequest productRequest) async{
    return await _appServiceClient.deleteProduct(
        productRequest.productId);
  }

  @override
  Future<GetProductDaTaResponse> getProduct() async{
    return await _appServiceClient.getProducts();
  }

  @override
  Future<UpdateProductDaTaResponse> updateProduct(UpdateProductRequest updateProductRequest)async {
    return await _appServiceClient.updateProduct(
        updateProductRequest.productId,updateProductRequest.id);
  }
}
