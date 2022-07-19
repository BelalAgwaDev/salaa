import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/rxdart.dart';
import 'package:salaa/domain/model/category/category_model.dart';
import 'package:salaa/domain/model/home/category.dart';
import 'package:salaa/domain/model/home/home_model.dart';
import 'package:salaa/domain/useCase/aboutAs/use_case.dart';
import 'package:salaa/domain/useCase/addProduct/useCase.dart';
import 'package:salaa/domain/useCase/category/use_case.dart';
import 'package:salaa/domain/useCase/contactUs/use_case.dart';
import 'package:salaa/domain/useCase/deleteProduct/useCase.dart';
import 'package:salaa/domain/useCase/favor/favor_use_case.dart';
import 'package:salaa/domain/useCase/getFavor/get_favor_use_case.dart';
import 'package:salaa/domain/useCase/getProduct/use_case.dart';
import 'package:salaa/domain/useCase/home/category.dart';
import 'package:salaa/domain/useCase/home/home_use_case.dart';
import 'package:salaa/domain/useCase/search/search_use_case.dart';
import 'package:salaa/domain/useCase/updateProduct/use_case.dart';
import 'package:salaa/presentation/base/baseView/base_view_model.dart';
import '../../../domain/model/AddProduct/model.dart';
import '../../../domain/model/aboutAs/about_as_model.dart';
import '../../../domain/model/contactUs/contact_us_model.dart';
import '../../../domain/model/deleteProduct/model.dart';
import '../../../domain/model/getFvor/get_favor_model.dart';
import '../../../domain/model/getProduct/model.dart';
import '../../../domain/model/updateProduct/model.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutPut {
  final StreamController _dataStreamController = BehaviorSubject<HomeModel>();
  final StreamController _categoryStreamController =
      StreamController<CategoryDaTADetailsModel>.broadcast();
  final StreamController _categoryDataStreamController =
      BehaviorSubject<CategoryModel>();
  final StreamController _aboutAsDataStreamController =
      BehaviorSubject<AboutAsModel>();
  final StreamController _contactUsDataStreamController =
      BehaviorSubject<ContactUsModel>();
  final StreamController _searchDataStreamController =
      BehaviorSubject<CategoryDaTADetailsModel>();
  final StreamController _favorStreamController =
      BehaviorSubject<GetFavoriteDataModel>();
  final StreamController _getProductStreamController =
      BehaviorSubject<GetProductDaTaModel>();
  final StreamController _addProductStreamController =
      BehaviorSubject<AddProductModel>();
  final StreamController _deleteProductStreamController =
      BehaviorSubject<DeleteProductDaTaModel>();
  final StreamController _updateProductStreamController =
      BehaviorSubject<UpdateProductDaTaModel>();

  final HomeUseCase _homeUseCase;
  final GetSettingsUseCase _getSettingsUseCase;
  final GetContactUseCase _getContactUseCase;
  final CategoryUseCase _categoryUseCase;
  final FavorUseCase _favorUseCase;
  final CategoryDataUseCase _categoryDataUseCase;
  final GetFavorUseCase _getFavorUseCase;
  final SearchUseCase _searchUseCase;
  final GetProductUseCase _getProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;
  final AddProductUseCase _addProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;

  HomeViewModel(
      this._homeUseCase,
      this._categoryUseCase,
      this._favorUseCase,
      this._getFavorUseCase,
      this._searchUseCase,
      this._categoryDataUseCase,
      this._getContactUseCase,
      this._getSettingsUseCase,
      this._deleteProductUseCase,
      this._addProductUseCase,
      this._updateProductUseCase,
      this._getProductUseCase);

  Map<int, bool> favorites = {};
  @override
  void start() {
    getHomeData();
    getCategory();
    getFavorData();
    getContacts();
    getSettings();
    getProducts();

  }

  @override
  void dispose() {
    _dataStreamController.close();
    _categoryDataStreamController.close();
    _categoryStreamController.close();
    _favorStreamController.close();
    _searchDataStreamController.close();
    _aboutAsDataStreamController.close();
    _contactUsDataStreamController.close();
    _addProductStreamController.close();
    _getProductStreamController.close();
    _deleteProductStreamController.close();
    _updateProductStreamController.close();
    super.dispose();
  }

  @override
  getHomeData() async {
    (await _homeUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      //right -> data(success)

      for (var element in data.data!.products!) {
        favorites.addAll({element.id: element.inFavorites});
      }
      //content
      inputState.add(ContentState());
      //push data to home screen
      inputData.add(data);
    });
  }

  @override
  getCategoryData(int id) async {
    (await _categoryDataUseCase.execute(CategoryUseCaseInput(id))).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      //right -> data(success)
      inputCategory.add(data);

      //content
    });
  }

  @override
  getCategory() async {
    (await _categoryUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      //right -> data(success)
      //push data to home screen
      inputCategoryData.add(data);
    });
  }

  @override
  getFavor(int id) async {
    favorites[id] = !favorites[id]!;

    (await _favorUseCase.execute(FavorUseCaseInput(id))).fold(
        (failure) => {
              // left -> failure
              favorites[id] = !favorites[id]!,
            }, (data) {
      //right -> data(success)
      if (!data.status) {
        favorites[id] = !favorites[id]!;
      } else {
        getFavorData();
      }
    });
  }

  @override
  getFavorData() async {
    (await _getFavorUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      //right -> data(success)
      //push data to home screen
      inputFavor.add(data);
    });
  }

  @override
  search(String text) async {
    (await _searchUseCase.execute(SearchUseCaseInput(text))).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      inputSearch.add(data);
    });
  }

  @override
  Sink get inputSearch => _searchDataStreamController.sink;

  @override
  Stream<CategoryDaTADetailsModel> get outputSearch =>
      _searchDataStreamController.stream.map((data) => data);

  @override
  getContacts() async {
    (await _getContactUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      //right -> data(success)
      //push data to  screen
      inputContact.add(data);
    });
  }

  @override
  getSettings() async {
    (await _getSettingsUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      //right -> data(success)
      //push data to  screen
      inputSetting.add(data);
    });
  }

  @override
  addProducts(int id) async {
    (await _addProductUseCase.execute(AddProductUseCaseInput(id))).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      //right -> data(success)
      //push data to  screen

    });
  }

  @override
  deleteProduct(int id) async {
    (await _deleteProductUseCase.execute(DeleteProductUseCaseInput(id))).fold(
        (failure) => {
              // left -> failure
            }, (data) {
      //right -> data(success)
      //push data to  screen
      getProducts();
    });
  }

  @override
  getProducts() async {
    (await _getProductUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure

            }, (data) {
      //right -> data(success)
      //push data to  screen

      inputGetProduct.add(data);
    });
  }

  @override
  updateProduct(int productId, int id) async {
    (await _updateProductUseCase
            .execute(UpdateProductUseCaseInput(productId, id)))
        .fold(
            (failure) => {
                  // left -> failure
                }, (data) {
      //right -> data(success)
      //push data to  screen
      getProducts();
    });
  }

  @override
  Sink get inputData => _dataStreamController.sink;

  @override
  Stream<HomeModel> get outputData =>
      _dataStreamController.stream.map((data) => data);

  @override
  Sink get inputCategoryData => _categoryDataStreamController.sink;

  @override
  Stream<CategoryModel> get outputCategoryData =>
      _categoryDataStreamController.stream.map((data) => data);

  @override
  Sink get inputCategory => _categoryStreamController.sink;

  @override
  Stream<CategoryDaTADetailsModel> get outputCategory =>
      _categoryStreamController.stream.map((data) => data);

  @override
  Sink get inputFavor => _favorStreamController.sink;

  @override
  Stream<GetFavoriteDataModel> get outputFavor =>
      _favorStreamController.stream.map((data) => data);

  @override
  Sink get inputContact => _contactUsDataStreamController.sink;

  @override
  Sink get inputSetting => _aboutAsDataStreamController.sink;

  @override
  Stream<AboutAsModel> get outputAbout =>
      _aboutAsDataStreamController.stream.map((data) => data);

  @override
  Stream<ContactUsModel> get outputContact =>
      _contactUsDataStreamController.stream.map((data) => data);

  @override
  Sink get inputAddProduct => _addProductStreamController.sink;

  @override
  Sink get inputDeleteProduct => _deleteProductStreamController.sink;

  @override
  Sink get inputGetProduct => _getProductStreamController.sink;

  @override
  Sink get inputUpdateProduct => _updateProductStreamController.sink;

  @override
  Stream<AddProductModel> get outputAddProduct =>
      _addProductStreamController.stream.map((data) => data);

  @override
  Stream<DeleteProductDaTaModel> get outputDeleteProduct =>
      _deleteProductStreamController.stream.map((data) => data);

  @override
  Stream<GetProductDaTaModel> get outputGetProduct =>
      _getProductStreamController.stream.map((data) => data);

  @override
  Stream<UpdateProductDaTaModel> get outputUpdateProduct =>
      _updateProductStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputData;
  Sink get inputCategoryData;
  Sink get inputCategory;
  Sink get inputFavor;
  Sink get inputSearch;
  Sink get inputSetting;
  Sink get inputContact;
  Sink get inputGetProduct;
  Sink get inputUpdateProduct;
  Sink get inputAddProduct;
  Sink get inputDeleteProduct;
  getHomeData();
  getCategory();
  getSettings();
  getContacts();
  getCategoryData(int id);
  getFavor(int id);
  getFavorData();
  search(String text);
  getProducts();
  addProducts(int id);
  deleteProduct(int id);
  updateProduct(int productId, int id);
}

abstract class HomeViewModelOutPut {
  Stream<HomeModel> get outputData;
  Stream<GetFavoriteDataModel> get outputFavor;
  Stream<CategoryDaTADetailsModel> get outputCategory;
  Stream<CategoryDaTADetailsModel> get outputSearch;
  Stream<CategoryModel> get outputCategoryData;
  Stream<AboutAsModel> get outputAbout;
  Stream<ContactUsModel> get outputContact;
  Stream<GetProductDaTaModel> get outputGetProduct;
  Stream<AddProductModel> get outputAddProduct;
  Stream<DeleteProductDaTaModel> get outputDeleteProduct;
  Stream<UpdateProductDaTaModel> get outputUpdateProduct;
}
