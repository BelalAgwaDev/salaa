import 'package:salaa/data/response/home/category_response.dart';

import '../../../network/error_handler/error_handler.dart';

const cacheHomeKey="cacheHomeKey";
const cacheHomeInterval=60*1000;  // 1 minute cache in millis
abstract class CategoryLocalDataSource{
  Future<CategoryResponse> getHomeData();

  Future<void> saveReportToCache(CategoryResponse categoryResponse);

  void clearCache();
  void removeFromCache(String key);

}


class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  //run time cache
  Map<String,CachedItem> cashMap={};
  @override
  Future<CategoryResponse> getHomeData() async{
    CachedItem? cachedItem=cashMap[cacheHomeKey];
    if(cachedItem !=null&&cachedItem.isValid(cacheHomeInterval)){
      //return the response from cash
      return cachedItem.data;

    }else{
      // return an error that cash is not there or its not valid
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveReportToCache(CategoryResponse reportResponse) async{
    cashMap[cacheHomeKey]=CachedItem(reportResponse);
  }

  @override
  void clearCache() {
    cashMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cashMap.remove(key);
  }
}


class CachedItem{
  dynamic data;
  int cacheTime=DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}



extension CachedItemExtension on CachedItem{
  bool isValid(int expirationTimeInMillis){
    int currentTimeInMillis=DateTime.now().millisecondsSinceEpoch;
    bool isValid=currentTimeInMillis-cacheTime<=expirationTimeInMillis;
    return isValid;
  }
}