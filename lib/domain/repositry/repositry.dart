import 'package:salaa/data/network/request/category/category_request.dart';
import 'package:salaa/data/network/request/favo/favor_request.dart';
import 'package:salaa/data/network/request/login/login_request.dart';
import 'package:salaa/data/network/request/profile/request.dart';
import 'package:salaa/data/network/request/search/search_request.dart';
import 'package:salaa/domain/model/aboutAs/about_as_model.dart';
import 'package:salaa/domain/model/category/category_model.dart';
import 'package:salaa/domain/model/contactUs/contact_us_model.dart';
import 'package:salaa/domain/model/favor/favor_model.dart';
import 'package:salaa/domain/model/home/category.dart';
import 'package:salaa/domain/model/home/home_model.dart';
import 'package:salaa/domain/model/login/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:salaa/domain/model/register/register_model.dart';
import '../../data/network/failure/failure.dart';
import '../../data/network/request/addProduct/request.dart';
import '../../data/network/request/register/register_request.dart';
import '../../data/network/request/updateProduct/product.dart';
import '../model/AddProduct/model.dart';
import '../model/deleteProduct/model.dart';
import '../model/getFvor/get_favor_model.dart';
import '../model/getProduct/model.dart';
import '../model/updateProduct/model.dart';

abstract class Repository{
 Future<Either<Failure,LoginModel>> login(LoginRequest loginRequest);
 Future<Either<Failure,RegisterModel>> register(RegisterRequest registerRequest);
 Future<Either<Failure,FavoriteModel>> favor(FavorRequest favorRequest);
 Future<Either<Failure,CategoryDaTADetailsModel>> categoryData(CategoryRequest categoryRequest);
 Future<Either<Failure,CategoryDaTADetailsModel>> search(SearchRequest request);
 Future<Either<Failure,HomeModel>> home();
 Future<Either<Failure,CategoryModel>> category();
 Future<Either<Failure,GetFavoriteDataModel>> getFavor();
 Future<Either<Failure,LoginModel>> profile(ProfileRequest profileRequest);
  Future<Either<Failure,AboutAsModel>> getSettings();
 Future<Either<Failure,ContactUsModel>> getContacts();
 Future<Either<Failure,GetProductDaTaModel>> getProducts();
 Future<Either<Failure,AddProductModel>> addProducts(ProductRequest productRequest);
 Future<Either<Failure,DeleteProductDaTaModel>> deleteProduct(ProductRequest productRequest);
 Future<Either<Failure,UpdateProductDaTaModel>> updateProduct(UpdateProductRequest updateProductRequest);

}