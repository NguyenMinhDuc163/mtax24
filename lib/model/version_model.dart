import 'package:flutter/foundation.dart';
import 'model.dart';

class VersionModel extends BaseModel{

  final ValueNotifier<bool> isUpdate = ValueNotifier<bool>(false);

  void setIsUpdate({@required bool isUpdate}){
    print("setIsUpdate: $isUpdate");
    this.isUpdate.value = isUpdate;
    clearError();
  }

}