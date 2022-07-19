

import 'package:salaa/app/constant.dart';

extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return Constant.empty;
    }else{
      return this!;
    }
  }
}


extension NonNullInteger on int?{
  int orZero(){
    if(this == null){
      return Constant.zero;
    }else{
      return this!;
    }
  }
}



extension NonNullDouble on num?{
  num orDoubleZero(){
    if(this == null){
      return Constant.zeroDouble;
    }else{
      return this!;
    }
  }
}



extension NonNullBool on bool?{
  bool orFalse(){
    if(this == null){
      return Constant.dataFalse;
    }else{
      return this!;
    }
  }
}



extension NonNullList on List<String>?{
  List<String> orList(){
    if(this == null){
      return Constant.dataList;
    }else{
      return this!;
    }
  }
}
