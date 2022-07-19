
import 'package:dartz/dartz.dart';

import 'package:salaa/data/datasource/localData/homeData/category_data.dart';
import 'package:salaa/data/datasource/localData/homeData/home_data.dart';
import 'package:salaa/data/mapper/aboutAs/mapper.dart';
import 'package:salaa/data/mapper/addProduct/mapper.dart';
import 'package:salaa/data/mapper/category/mapper.dart';
import 'package:salaa/data/mapper/contactUs/mapper.dart';
import 'package:salaa/data/mapper/deleteProduct/mapper.dart';
import 'package:salaa/data/mapper/favor/favor_mapper.dart';
import 'package:salaa/data/mapper/getFavor/get_favor_mapper.dart';
import 'package:salaa/data/mapper/getProducts/mapper.dart';
import 'package:salaa/data/mapper/home/category_mapper.dart';
import 'package:salaa/data/mapper/home/homeMapper.dart';
import 'package:salaa/data/mapper/login/login_mapper.dart';
import 'package:salaa/data/mapper/register/register_mapper.dart';
import 'package:salaa/data/mapper/updateProduct/mapper.dart';
import 'package:salaa/data/network/failure/failure.dart';
import 'package:salaa/data/network/request/addProduct/request.dart';
import 'package:salaa/data/network/request/category/category_request.dart';
import 'package:salaa/data/network/request/favo/favor_request.dart';
import 'package:salaa/data/network/request/login/login_request.dart';
import 'package:salaa/data/network/request/profile/request.dart';
import 'package:salaa/data/network/request/register/register_request.dart';
import 'package:salaa/data/network/request/search/search_request.dart';
import 'package:salaa/data/network/request/updateProduct/product.dart';
import 'package:salaa/domain/model/AddProduct/model.dart';
import 'package:salaa/domain/model/aboutAs/about_as_model.dart';
import 'package:salaa/domain/model/category/category_model.dart';
import 'package:salaa/domain/model/contactUs/contact_us_model.dart';
import 'package:salaa/domain/model/deleteProduct/model.dart';
import 'package:salaa/domain/model/favor/favor_model.dart';
import 'package:salaa/domain/model/getFvor/get_favor_model.dart';
import 'package:salaa/domain/model/getProduct/model.dart';
import 'package:salaa/domain/model/home/category.dart';
import 'package:salaa/domain/model/home/home_model.dart';
import 'package:salaa/domain/model/login/login_model.dart';
import 'package:salaa/domain/model/register/register_model.dart';
import 'package:salaa/domain/model/updateProduct/model.dart';
import 'package:salaa/domain/repositry/repositry.dart';

import '../datasource/remoteData/remote_data_source.dart';
import '../network/error_handler/error_handler.dart';
import '../network/network_info/network_info.dart';

class  RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;
  final CategoryLocalDataSource _categoryLocalDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo,this._remoteDataSource,this._localDataSource,this._categoryLocalDataSource);
  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(RegisterRequest registerRequest)async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeModel>> home() async{
    try {
      //get response from cache
      final response = await _localDataSource.getHomeData();
      return Right(response.toDomain());
    } catch (cacheError) {
      // cache is not existing or cache is not valid
      // its thw time to get from api side
      if (await _networkInfo.isConnected) {
        //its  connected to internet ,its safe to call api

        try {
          final response = await _remoteDataSource.home();
          if (response.data != null) {
            //save response in cache (local data source)
            _localDataSource.saveReportToCache(response);
            //success and return data
            return Right(response.toDomain());
          } else {
            //failure --return business error
            return left(
                Failure(ApiInternalStatus.failure, ResponseMessage.unKnown));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return  internet connection error
        return left(DataSource.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> category() async{
    try {
      //get response from cache
      final response = await _categoryLocalDataSource.getHomeData();
      return Right(response.toDomain());
    } catch (cacheError) {
      // cache is not existing or cache is not valid
      // its thw time to get from api side
      if (await _networkInfo.isConnected) {
        //its  connected to internet ,its safe to call api

        try {
          final response = await _remoteDataSource.category();
          if (response.data != null) {
            //save response in cache (local data source)
            _categoryLocalDataSource.saveReportToCache(response);
            //success and return data
            return Right(response.toDomain());
          } else {
            //failure --return business error
            return left(
                Failure(ApiInternalStatus.failure, ResponseMessage.unKnown));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return  internet connection error
        return left(DataSource.noInternetConnection.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> favor(FavorRequest favorRequest) async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.favor(favorRequest);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryDaTADetailsModel>> categoryData(CategoryRequest categoryRequest) async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.categoryData(categoryRequest);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
               ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, GetFavoriteDataModel>> getFavor() async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.getFavor();
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryDaTADetailsModel>> search(SearchRequest request)async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.search(request);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ContactUsModel>> getContacts() async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.getContacts();
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, AboutAsModel>> getSettings() async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.getSettings();
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, LoginModel>> profile(ProfileRequest profileRequest) async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.profile(profileRequest);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddProductModel>> addProducts(ProductRequest productRequest)async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.addProducts(productRequest);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, DeleteProductDaTaModel>> deleteProduct(ProductRequest productRequest) async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.deleteProduct(productRequest);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, GetProductDaTaModel>> getProducts() async{
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.getProduct();
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
                ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, UpdateProductDaTaModel>> updateProduct(UpdateProductRequest updateProductRequest)async {
    if (await _networkInfo.isConnected) {
      //its  connected to internet ,its safe to call api
      try {
        final response = await _remoteDataSource.updateProduct(updateProductRequest);
        if (response.status == ApiInternalStatus.success) {
          //success and return data
          return Right(response.toDomain());
        } else {
          //failure --return business error
          return left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      //return  internet connection error
      return left(DataSource.noInternetConnection.getFailure());
    }
  }
}