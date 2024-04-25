import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/init.dart';

import '../model.dart';

class ThongTinNguoiMuaModel extends BaseModel {


  final ValueNotifier<DMucNHangTTeResponse> lstDMucNH = ValueNotifier<DMucNHangTTeResponse>(null);

  final ValueNotifier<CustomerInfoByUserIdResponse> lstCustomerInfoByUserId = ValueNotifier<CustomerInfoByUserIdResponse>(null);

  final ValueNotifier<CreateCustomerApiResponse> lstCreateCustomer = ValueNotifier<CreateCustomerApiResponse>(null);

  final ValueNotifier<GetInfoCustomerByCodeResponse> getInfoCustomerByCode = ValueNotifier<GetInfoCustomerByCodeResponse>(null);


  void setDMucNHangTTe({@required DMucNHangTTeResponse response}) {
    print("setDMucNHangTTe: ${response.toJson()}");
    this.lstDMucNH.value = response;
    clearError();
  }

  void setCustomerInfoByUserId({@required CustomerInfoByUserIdResponse response}) {
    print("setCustomerInfoByUserId: ${response.toJson()}");
    this.lstCustomerInfoByUserId.value = response;
    clearError();
  }

  void setCreateCustomer({@required CreateCustomerApiResponse response}) {
    print("set avatar: ${response.toJson()}");
    this.lstCreateCustomer.value = response;
    clearError();
  }

  void setGetInfoCustomerByCode({@required GetInfoCustomerByCodeResponse response}) {
    print("setGetInfoCustomerByCode: ${response.toJson()}");
    this.getInfoCustomerByCode.value = response;
    clearError();
  }
}