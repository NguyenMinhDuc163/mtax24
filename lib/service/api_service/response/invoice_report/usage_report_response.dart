import 'dart:convert';

class UsageReportResponse {
  UsageReportResponse({
    this.listbc26,
    this.tongcongbc26,
    this.htmlContent,
  });

  List<Bc26> listbc26;
  Bc26 tongcongbc26;
  dynamic htmlContent;

  factory UsageReportResponse.fromJson(String str) => UsageReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsageReportResponse.fromMap(Map<String, dynamic> json) => UsageReportResponse(
    listbc26: List<Bc26>.from(json["listbc26"].map((x) => Bc26.fromMap(x))),
    tongcongbc26: Bc26.fromMap(json["tongcongbc26"]),
    htmlContent: json["htmlContent"],
  );

  Map<String, dynamic> toMap() => {
    "listbc26": List<dynamic>.from(listbc26.map((x) => x.toMap())),
    "tongcongbc26": tongcongbc26.toMap(),
    "htmlContent": htmlContent,
  };
}

class Bc26 {
  Bc26({
    this.maHoaDon,
    this.kieuky,
    this.tenHDon,
    this.kHieuMauHDon,
    this.kHieuHDon,
    this.soTonMuaTrKyTongSo,
    this.soTonDauKyTuSo,
    this.soTonDauKyDenSo,
    this.muaTrongKyTuSo,
    this.muaTrongKyDenSo,
    this.tongSoSuDungTuSo,
    this.tongSoSuDungDenSo,
    this.tongSoSuDungCong,
    this.soDaSDung,
    this.xoaBoSoLuong,
    this.xoaBoSo,
    this.matSoLuong,
    this.matSo,
    this.huySoLuong,
    this.huySo,
    this.tonCuoiKyTuSo,
    this.tonCuoiKyDenSo,
    this.tonCuoiKySoLuong,
    this.stt,
    this.tongCongSoTonDKy,
    this.tongCongSDung,
    this.tongCongSoTonCKy,
    this.kyBCaoCuoi,
    this.chuyenDiaDiem,
    this.ngayDauKyBc,
    this.ngayCuoiKyBc,
    this.kyKKhai,
    this.nguoidaidien,
  });

  String maHoaDon;
  String kieuky;
  String tenHDon;
  String kHieuMauHDon;
  String kHieuHDon;
  String soTonMuaTrKyTongSo;
  String soTonDauKyTuSo;
  String soTonDauKyDenSo;
  dynamic muaTrongKyTuSo;
  dynamic muaTrongKyDenSo;
  String tongSoSuDungTuSo;
  String tongSoSuDungDenSo;
  int tongSoSuDungCong;
  int soDaSDung;
  int xoaBoSoLuong;
  String xoaBoSo;
  int matSoLuong;
  dynamic matSo;
  int huySoLuong;
  String huySo;
  String tonCuoiKyTuSo;
  String tonCuoiKyDenSo;
  int tonCuoiKySoLuong;
  int stt;
  int tongCongSoTonDKy;
  int tongCongSDung;
  int tongCongSoTonCKy;
  dynamic kyBCaoCuoi;
  dynamic chuyenDiaDiem;
  int ngayDauKyBc;
  int ngayCuoiKyBc;
  String kyKKhai;
  String nguoidaidien;

  factory Bc26.fromJson(String str) => Bc26.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bc26.fromMap(Map<String, dynamic> json) => Bc26(
    maHoaDon: json["maHoaDon"] == null ? null : json["maHoaDon"],
    kieuky: json["kieuky"] == null ? null : json["kieuky"],
    tenHDon: json["tenHDon"] == null ? null : json["tenHDon"],
    kHieuMauHDon: json["kHieuMauHDon"] == null ? null : json["kHieuMauHDon"],
    kHieuHDon: json["kHieuHDon"] == null ? null : json["kHieuHDon"],
    soTonMuaTrKyTongSo: json["soTonMuaTrKy_tongSo"] == null ? null : json["soTonMuaTrKy_tongSo"],
    soTonDauKyTuSo: json["soTonDauKy_tuSo"] == null ? null : json["soTonDauKy_tuSo"],
    soTonDauKyDenSo: json["soTonDauKy_denSo"] == null ? null : json["soTonDauKy_denSo"],
    muaTrongKyTuSo: json["muaTrongKy_tuSo"],
    muaTrongKyDenSo: json["muaTrongKy_denSo"],
    tongSoSuDungTuSo: json["tongSoSuDung_tuSo"] == null ? null : json["tongSoSuDung_tuSo"],
    tongSoSuDungDenSo: json["tongSoSuDung_denSo"] == null ? null : json["tongSoSuDung_denSo"],
    tongSoSuDungCong: json["tongSoSuDung_cong"] == null ? null : json["tongSoSuDung_cong"],
    soDaSDung: json["soDaSDung"] == null ? null : json["soDaSDung"],
    xoaBoSoLuong: json["xoaBo_soLuong"] == null ? null : json["xoaBo_soLuong"],
    xoaBoSo: json["xoaBo_so"] == null ? null : json["xoaBo_so"],
    matSoLuong: json["mat_soLuong"] == null ? null : json["mat_soLuong"],
    matSo: json["mat_so"],
    huySoLuong: json["huy_soLuong"] == null ? null : json["huy_soLuong"],
    huySo: json["huy_so"] == null ? null : json["huy_so"],
    tonCuoiKyTuSo: json["tonCuoiKy_tuSo"] == null ? null : json["tonCuoiKy_tuSo"],
    tonCuoiKyDenSo: json["tonCuoiKy_denSo"] == null ? null : json["tonCuoiKy_denSo"],
    tonCuoiKySoLuong: json["tonCuoiKy_soLuong"] == null ? null : json["tonCuoiKy_soLuong"],
    stt: json["stt"] == null ? null : json["stt"],
    tongCongSoTonDKy: json["tongCongSoTonDKy"] == null ? null : json["tongCongSoTonDKy"],
    tongCongSDung: json["tongCongSDung"] == null ? null : json["tongCongSDung"],
    tongCongSoTonCKy: json["tongCongSoTonCKy"] == null ? null : json["tongCongSoTonCKy"],
    kyBCaoCuoi: json["kyBCaoCuoi"],
    chuyenDiaDiem: json["chuyenDiaDiem"],
    ngayDauKyBc: json["ngayDauKyBC"] == null ? null : json["ngayDauKyBC"],
    ngayCuoiKyBc: json["ngayCuoiKyBC"] == null ? null : json["ngayCuoiKyBC"],
    kyKKhai: json["kyKKhai"] == null ? null : json["kyKKhai"],
    nguoidaidien: json["nguoidaidien"] == null ? null : json["nguoidaidien"],
  );

  Map<String, dynamic> toMap() => {
    "maHoaDon": maHoaDon == null ? null : maHoaDon,
    "kieuky": kieuky == null ? null : kieuky,
    "tenHDon": tenHDon == null ? null : tenHDon,
    "kHieuMauHDon": kHieuMauHDon == null ? null : kHieuMauHDon,
    "kHieuHDon": kHieuHDon == null ? null : kHieuHDon,
    "soTonMuaTrKy_tongSo": soTonMuaTrKyTongSo == null ? null : soTonMuaTrKyTongSo,
    "soTonDauKy_tuSo": soTonDauKyTuSo == null ? null : soTonDauKyTuSo,
    "soTonDauKy_denSo": soTonDauKyDenSo == null ? null : soTonDauKyDenSo,
    "muaTrongKy_tuSo": muaTrongKyTuSo,
    "muaTrongKy_denSo": muaTrongKyDenSo,
    "tongSoSuDung_tuSo": tongSoSuDungTuSo == null ? null : tongSoSuDungTuSo,
    "tongSoSuDung_denSo": tongSoSuDungDenSo == null ? null : tongSoSuDungDenSo,
    "tongSoSuDung_cong": tongSoSuDungCong == null ? null : tongSoSuDungCong,
    "soDaSDung": soDaSDung == null ? null : soDaSDung,
    "xoaBo_soLuong": xoaBoSoLuong == null ? null : xoaBoSoLuong,
    "xoaBo_so": xoaBoSo == null ? null : xoaBoSo,
    "mat_soLuong": matSoLuong == null ? null : matSoLuong,
    "mat_so": matSo,
    "huy_soLuong": huySoLuong == null ? null : huySoLuong,
    "huy_so": huySo == null ? null : huySo,
    "tonCuoiKy_tuSo": tonCuoiKyTuSo == null ? null : tonCuoiKyTuSo,
    "tonCuoiKy_denSo": tonCuoiKyDenSo == null ? null : tonCuoiKyDenSo,
    "tonCuoiKy_soLuong": tonCuoiKySoLuong == null ? null : tonCuoiKySoLuong,
    "stt": stt == null ? null : stt,
    "tongCongSoTonDKy": tongCongSoTonDKy == null ? null : tongCongSoTonDKy,
    "tongCongSDung": tongCongSDung == null ? null : tongCongSDung,
    "tongCongSoTonCKy": tongCongSoTonCKy == null ? null : tongCongSoTonCKy,
    "kyBCaoCuoi": kyBCaoCuoi,
    "chuyenDiaDiem": chuyenDiaDiem,
    "ngayDauKyBC": ngayDauKyBc == null ? null : ngayDauKyBc,
    "ngayCuoiKyBC": ngayCuoiKyBc == null ? null : ngayCuoiKyBc,
    "kyKKhai": kyKKhai == null ? null : kyKKhai,
    "nguoidaidien": nguoidaidien == null ? null : nguoidaidien,
  };
}
