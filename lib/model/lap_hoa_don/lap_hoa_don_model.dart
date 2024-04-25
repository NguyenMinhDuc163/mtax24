import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';

import '../model.dart';

class LapHoaDonModel extends BaseModel {


  final ValueNotifier<List<DanhMucHoaDonResponse>> dMucHoaDon = ValueNotifier<List<DanhMucHoaDonResponse>>(null);

  final ValueNotifier<List<CorpSerialsResponse>> lstCorpSerials = ValueNotifier<List<CorpSerialsResponse>>(null);

  final ValueNotifier<List<SerialInvoiceResponse>> lstSerialInvoice = ValueNotifier<List<SerialInvoiceResponse>>(null);

  final ValueNotifier<KyHoaDonApiResponse> guiReview = ValueNotifier<KyHoaDonApiResponse>(null);


  final ValueNotifier<KyHoaDonApiResponse> luuHoaDon = ValueNotifier<KyHoaDonApiResponse>(null);
  final ValueNotifier<BaseResponse> checkAmountHoaDon = ValueNotifier<BaseResponse>(null);
  final ValueNotifier<KyHoaDonApiResponse> kyHoaDonAPI = ValueNotifier<KyHoaDonApiResponse>(null);
  final ValueNotifier<KyHoaDonApiResponse> guiHoaDonAPI = ValueNotifier<KyHoaDonApiResponse>(null);



  final ValueNotifier<LstCorpSerial> corpSerial = ValueNotifier<LstCorpSerial>(null);


  void setDanhMucHoaDon({@required List<DanhMucHoaDonResponse> response}) {
    print("set avatar: ${response.toList()}");
    this.dMucHoaDon.value = response;
    clearError();
  }

  void setCorpSerials({@required List<CorpSerialsResponse> response}) {
    print("set avatar: ${response.toList()}");
    this.lstCorpSerials.value = response;
    clearError();
  }

  void setSerialInvoice({@required List<SerialInvoiceResponse> response}) {
    print("set avatar: ${response.toList()}");
    this.lstSerialInvoice.value = response;
    clearError();
  }

  void setLuuHoaDon({@required KyHoaDonApiResponse response}) {
    print("setLuuHoaDon: ${response.toString()}");
    this.luuHoaDon.value = response;
    clearError();
  }

  void setCheckAmountHD({@required BaseResponse response}) {
    print("setCheckAmountHD: ${response.toString()}");
    this.checkAmountHoaDon.value = response;
    clearError();
  }
  void setGuiHoaDon({@required KyHoaDonApiResponse response}) {
    print("setGuiHoaDon: ${response.toString()}");
    this.guiHoaDonAPI.value = response;
    clearError();
  }
  void setKyHoaDon({@required KyHoaDonApiResponse response}) {
    print("setKyHoaDon: ${response.toString()}");
    this.kyHoaDonAPI.value = response;
    clearError();
  }

  void setCorpSerial({@required LstCorpSerial response}) {
    print("setKyHoaDon: ${response.toString()}");
    this.corpSerial.value = response;
    clearError();
  }

  void setSendReviewEmail({@required KyHoaDonApiResponse response}) {
    print("setSendReviewEmail: ${response.toJson()}");
    this.guiReview.value = response;
    clearError();
  }
}