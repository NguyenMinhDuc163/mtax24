import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/service/init.dart';

import '../controller.dart';

class ThongTinNguoiMuaController extends BaseController {

  final ApiServices apiServices;

  ThongTinNguoiMuaController(this.apiServices);

  @override
  // TODO: implement model
  ThongTinNguoiMuaModel get model => GetIt.I<ThongTinNguoiMuaModel>();


  void getDMucNHangTTe(DMucNHangTTeRequest request) {
    execute(() => apiServices.dmucnhangtte(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "GDM002"){
            final objectConverted = jsonDecode(baseResponse?.object);
            DMucNHangTTeResponse _listResult = DMucNHangTTeResponse.fromJson(objectConverted);
            model.setDMucNHangTTe(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void getCustomerInfoByUserId(CustomerInfoByUserIdRequest request) {
    execute(() => apiServices.CustomerInfoByUserId(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "QRT00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            CustomerInfoByUserIdResponse _listCorpSerials =  CustomerInfoByUserIdResponse.fromJson(objectConverted);
            model.setCustomerInfoByUserId(response: _listCorpSerials);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void createCustomerAPI(CreateCustomerApiRequest request) {
    execute(() => apiServices.createCustomerAPI(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "SUCC"){
            final objectConverted = jsonDecode(baseResponse?.object);
            print('getSerialInvoiceApi: ${objectConverted.toString()}');
            print('getSerialInvoiceApi: ${baseResponse.toJson()}');
            CreateCustomerApiResponse _listResult =  CreateCustomerApiResponse.fromJson(objectConverted);
            model.setCreateCustomer(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }

  void getInfoCustomerByCode(GetInfoCustomerByCodeRequest request) {
    execute(() => apiServices.getInfoCustomerByCode(request: request),
        onCompleted: (BaseResponse baseResponse) {
          if(baseResponse.responseCode == "QRT00"){
            final objectConverted = jsonDecode(baseResponse?.object);
            GetInfoCustomerByCodeResponse _listResult =
            GetInfoCustomerByCodeResponse.fromJson(objectConverted);
            model.setGetInfoCustomerByCode(response: _listResult);
          }else{
            model.setError(error: baseResponse.message, source: "setDMucHoaDon");
          }
        }, source: "LapHoaDonController: setDMucHoaDon");
  }
}