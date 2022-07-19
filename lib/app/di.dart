import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:salaa/data/datasource/localData/homeData/category_data.dart';
import 'package:salaa/data/datasource/localData/homeData/home_data.dart';
import 'package:salaa/domain/repositry/repositry.dart';
import 'package:salaa/domain/useCase/aboutAs/use_case.dart';
import 'package:salaa/domain/useCase/contactUs/use_case.dart';
import 'package:salaa/domain/useCase/favor/favor_use_case.dart';
import 'package:salaa/domain/useCase/home/category.dart';
import 'package:salaa/domain/useCase/home/home_use_case.dart';
import 'package:salaa/domain/useCase/profile/use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/datasource/remoteData/remote_data_source.dart';
import '../data/network/api/app_api.dart';
import '../data/network/dio_factory/dio_factory.dart';
import '../data/network/network_info/network_info.dart';
import '../data/repositryImpl/repositry_impl.dart';
import '../domain/useCase/addProduct/useCase.dart';
import '../domain/useCase/category/use_case.dart';
import '../domain/useCase/deleteProduct/useCase.dart';
import '../domain/useCase/getFavor/get_favor_use_case.dart';
import '../domain/useCase/getProduct/use_case.dart';
import '../domain/useCase/login/login_use_case.dart';
import '../domain/useCase/register/register_use_case.dart';
import '../domain/useCase/search/search_use_case.dart';
import '../domain/useCase/updateProduct/use_case.dart';
import '../presentation/base/viewModel/home_view_model.dart';
import '../presentation/login/viewModel/login_view_model.dart';
import '../presentation/productsDetails/view/product_category_view.dart';
import '../presentation/profile/viewModel/profile_view_model.dart';
import '../presentation/register/viewModel/register_view_model.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module ,its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

//app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

//dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // local data source
  instance.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());

  // local data source
  instance.registerLazySingleton<CategoryLocalDataSource>(
      () => CategoryLocalDataSourceImpl());

  //repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
        instance(),
        instance(),
        instance(),
        instance(),
      ));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
  }
}

initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileUseCase>(() => ProfileUseCase(instance()));
    instance
        .registerFactory<ProfileViewModel>(() => ProfileViewModel(instance()));
  }
}


initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance
        .registerFactory<CategoryUseCase>(() => CategoryUseCase(instance()));
    instance.registerFactory<CategoryDataUseCase>(
        () => CategoryDataUseCase(instance()));
    instance.registerFactory<FavorUseCase>(() => FavorUseCase(instance()));
    instance
        .registerFactory<GetFavorUseCase>(() => GetFavorUseCase(instance()));
    instance.registerFactory<SearchUseCase>(() => SearchUseCase(instance()));
    instance.registerFactory<GetContactUseCase>(
        () => GetContactUseCase(instance()));
    instance.registerFactory<GetSettingsUseCase>(
        () => GetSettingsUseCase(instance()));
    instance.registerFactory<GetProductUseCase>(
        () => GetProductUseCase(instance()));
    instance.registerFactory<UpdateProductUseCase>(
        () => UpdateProductUseCase(instance()));
    instance.registerFactory<AddProductUseCase>(
        () => AddProductUseCase(instance()));
    instance.registerFactory<DeleteProductUseCase>(
        () => DeleteProductUseCase(instance()));


    instance.registerFactory<HomeViewModel>(() => HomeViewModel(
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance()));
  }
}

restAllModule() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initRegisterModule();
  initHomeModule();
  initProfileModule();
}
