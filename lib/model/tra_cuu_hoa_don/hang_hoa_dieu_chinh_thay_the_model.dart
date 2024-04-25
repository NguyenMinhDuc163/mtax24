import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';

import '../model.dart';

class HoaDonDieuChinhThayTheModel extends BaseModel {

  final ValueNotifier<TraCuuHoaDonChiTietResponse> hoaDonChiTiet = ValueNotifier<TraCuuHoaDonChiTietResponse>(null);
  final ValueNotifier<LstCorpSerial> corpSerial = ValueNotifier<LstCorpSerial>(null);
  final ValueNotifier<ViewHDonResponse> viewHoaDon = ValueNotifier<ViewHDonResponse>(null);

  final ValueNotifier<KyHoaDonApiResponse> luuHoaDon = ValueNotifier<KyHoaDonApiResponse>(null);
  final ValueNotifier<BaseResponse> checkAmountHoaDon = ValueNotifier<BaseResponse>(null);
  final ValueNotifier<KyHoaDonApiResponse> kyHoaDonAPI = ValueNotifier<KyHoaDonApiResponse>(null);
  final ValueNotifier<KyHoaDonApiResponse> guiHoaDonAPI = ValueNotifier<KyHoaDonApiResponse>(null);
  final ValueNotifier<KyHoaDonApiResponse> guiReview = ValueNotifier<KyHoaDonApiResponse>(null);




  void setHoaDonChiTiet({@required TraCuuHoaDonChiTietResponse response}) {
    print("setHoaDonChiTiet: ${response.toJson()}");
    this.hoaDonChiTiet.value = response;
    clearError();
  }

  void setCorpSerial({@required LstCorpSerial response}) {
    print("setCorpSerial: ${response.toString()}");
    this.corpSerial.value = response;
    clearError();
  }

  void setViewHoaDon({@required ViewHDonResponse response}) {
    print("setViewHoaDon: ${response.toString()}");
    this.viewHoaDon.value = response;
    clearError();
  }


  void setLuuHoaDonDCTT({@required KyHoaDonApiResponse response}) {
    print("setLuuHoaDonDCTT: ${response.toString()}");
    this.luuHoaDon.value = response;
    clearError();
  }

  void setCheckAmountHDDCTT({@required BaseResponse response}) {
    print("setCheckAmountHD: ${response.toString()}");
    this.checkAmountHoaDon.value = response;
    clearError();
  }

  void setKyHoaDonDCTT({@required KyHoaDonApiResponse response}) {
    print("setKyHoaDon: ${response.toString()}");
    this.kyHoaDonAPI.value = response;
    clearError();
  }

  void setGuiHoaDonDCTT({@required KyHoaDonApiResponse response}) {
    print("setGuiHoaDon: ${response.toString()}");
    this.guiHoaDonAPI.value = response;
    clearError();
  }
  void setGuiReviewDCTT({@required KyHoaDonApiResponse response}) {
    print("setGuiHoaDon: ${response.toString()}");
    this.guiReview.value = response;
    clearError();
  }



}