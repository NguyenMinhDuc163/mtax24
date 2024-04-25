import 'package:flutter/cupertino.dart';
import 'package:mtax24/service/api_service/response/lap_hoa_don/ky_hoa_don_api_response.dart';
import 'package:mtax24/service/init.dart';

import '../model.dart';

class HoaDonBanHangModel extends BaseModel {


  final ValueNotifier<List<DanhMucHoaDonResponse>> dMucHoaDon = ValueNotifier<List<DanhMucHoaDonResponse>>(null);

  final ValueNotifier<List<TraCuuHoaDonResponse>> lstTraCuuHDBH = ValueNotifier<List<TraCuuHoaDonResponse>>(null);
  final ValueNotifier<XacMinhHoaDonResponse> xacMinhHoaDon = ValueNotifier<XacMinhHoaDonResponse>(null);
  final ValueNotifier<ViewHDonResponse> viewHoaDon = ValueNotifier<ViewHDonResponse>(null);
  final ValueNotifier<TraCuuHoaDonChiTietResponse> hoaDonChiTiet = ValueNotifier<TraCuuHoaDonChiTietResponse>(null);

  final ValueNotifier<KyHoaDonApiResponse> guiReview = ValueNotifier<KyHoaDonApiResponse>(null);
  final ValueNotifier<List<HoaDonXoaBoResponse>> lstHDXoaBo = ValueNotifier<List<HoaDonXoaBoResponse>>(null);
  final ValueNotifier<List<DieuChinhDinhDanhResponse>> lstDCDinhDanh = ValueNotifier<List<DieuChinhDinhDanhResponse>>(null);
  final ValueNotifier<List<TraCuuHddcResponse>> lstTraCuuHDDC = ValueNotifier<List<TraCuuHddcResponse>>(null);
  final ValueNotifier<List<TraCuuHdttResponse>> lstTraCuuHDTT = ValueNotifier<List<TraCuuHdttResponse>>(null);


  void setDanhMucHoaDon({@required List<DanhMucHoaDonResponse> response}) {
    print("setDanhMucHoaDon: ${response.toList()}");
    this.dMucHoaDon.value = response;
    clearError();
  }

  void setHoaDonBanHang({@required List<TraCuuHoaDonResponse> response}) {
    print("setHoaDonBanHang: ${response.toList()}");
    this.lstTraCuuHDBH.value = response;
    clearError();
  }

  void setXacMinhHoaDon({@required XacMinhHoaDonResponse response}) {
    print("setXacMinhHoaDon: ${response.toJson()}");
    this.xacMinhHoaDon.value = response;
    clearError();
  }
  void setViewHoaDon({@required ViewHDonResponse response}) {
    print("setViewHoaDon: ${response.toJson()}");
    this.viewHoaDon.value = response;
    clearError();
  }
  void setHoaDonChiTiet({@required TraCuuHoaDonChiTietResponse response}) {
      print("setHoaDonChiTiet: ${response.toJson()}");
      this.hoaDonChiTiet.value = response;
      clearError();
    }

  void setSendReviewEmail({@required KyHoaDonApiResponse response}) {
    print("setSendReviewEmail: ${response.toJson()}");
    this.guiReview.value = response;
    clearError();
  }

  void setHoaDonXoaBo({@required List<HoaDonXoaBoResponse> response}) {
    print("setSendReviewEmail: ${response.toList()}");
    this.lstHDXoaBo.value = response;
    clearError();
  }

  void setDieuChinhDinhDanh({@required List<DieuChinhDinhDanhResponse> response}) {
    print("setDieuChinhDinhDanh: ${response.toList()}");
    this.lstDCDinhDanh.value = response;
    clearError();
  }

  void setTraCuuHddc({@required List<TraCuuHddcResponse> response}) {
    print("setTraCuuHddc: ${response.toList()}");
    this.lstTraCuuHDDC.value = response;
    clearError();
  }

  void setTraCuuHdtt({@required List<TraCuuHdttResponse> response}) {
    print("setTraCuuHdtt: ${response.toList()}");
    this.lstTraCuuHDTT.value = response;
    clearError();
  }


}