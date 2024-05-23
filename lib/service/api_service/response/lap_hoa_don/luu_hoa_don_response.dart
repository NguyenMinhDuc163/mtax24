// import 'dart:convert';
// LuuHoaDonResponse luuHoaDonResponse(String str) => LuuHoaDonResponse.fromJson(json.decode(str));
//
// String luuHoaDonResponseToJson(LuuHoaDonResponse data) => json.encode(data.toJson());
//
// class LuuHoaDonResponse {
//   String channelCode;
//   String typehdongoc;
//   String serviceType;
//   String lyDoXoaBo;
//   String dchinmua;
//   String dthoainmua;
//   String emailnmua;
//   String faxnmua;
//   String hthuctoan;
//   String hthuctoankhac;
//   int id;
//   int idGoc;
//   String khieuhdon;
//   String loaihdon;
//   String macqt;
//   String tencqt;
//   String maktra;
//   String matte;
//   String mauhdon;
//   String mstNban;
//   String mstNmua;
//   dynamic ngayduyet;
//   dynamic ngayhdcqt;
//   int ngayLap;
//   int ngayhdon;
//   dynamic ngayhdong;
//   dynamic ngayvban;
//   String ngayvbanStr;
//   String nguoiduyet;
//   String nguoilap;
//   String nguoivchuyen;
//   String nhangnmua;
//   String ptienvchuyen;
//   String sohdcqt;
//   String sohdon;
//   String sohdong;
//   String sohdongoc;
//   String ngayCQThdongoc;
//   String sovban;
//   String tendvinmua;
//   String tenhdon;
//   String tenhdong;
//   String tenknhap;
//   String tenkxuat;
//   String tennmua;
//   int tgia;
//   String tgiaStr;
//   String tkhoannmua;
//   int tongtienckhaunte;
//   int tongtienckhauvnd;
//   int tongtiennte;
//   String tongtienttoanbchu;
//   int tongtienttoannte;
//   String tongtienttoannteStr;
//   int tongtienttoanvnd;
//   int tongtienhangtruocthue;
//   int tongtienhangtruocthuevnd;
//   String tongtienttoanvndStr;
//   int tongtienvnd;
//   String trangthai;
//   String tinhChat;
//   String tennban;
//   String dchinban;
//   String dthoainban;
//   String tkhoannban;
//   String nhangnban;
//   String faxnban;
//   String emailnban;
//   String ghiChu;
//   String contentxml;
//   bool showWarning;
//   int countRemain;
//
//   LuuHoaDonResponse({
//      this.channelCode,
//      this.typehdongoc,
//      this.serviceType,
//      this.lyDoXoaBo,
//      this.dchinmua,
//      this.dthoainmua,
//      this.emailnmua,
//      this.faxnmua,
//      this.hthuctoan,
//      this.hthuctoankhac,
//      this.id,
//      this.idGoc,
//      this.khieuhdon,
//      this.loaihdon,
//      this.macqt,
//      this.tencqt,
//      this.maktra,
//      this.matte,
//      this.mauhdon,
//      this.mstNban,
//      this.mstNmua,
//     this.ngayduyet,
//     this.ngayhdcqt,
//      this.ngayLap,
//      this.ngayhdon,
//     this.ngayhdong,
//     this.ngayvban,
//      this.ngayvbanStr,
//      this.nguoiduyet,
//      this.nguoilap,
//      this.nguoivchuyen,
//      this.nhangnmua,
//      this.ptienvchuyen,
//      this.sohdcqt,
//      this.sohdon,
//      this.sohdong,
//      this.sohdongoc,
//      this.ngayCQThdongoc,
//      this.sovban,
//      this.tendvinmua,
//      this.tenhdon,
//      this.tenhdong,
//      this.tenknhap,
//      this.tenkxuat,
//      this.tennmua,
//      this.tgia,
//      this.tgiaStr,
//      this.tkhoannmua,
//      this.tongtienckhaunte,
//      this.tongtienckhauvnd,
//      this.tongtiennte,
//      this.tongtienttoanbchu,
//      this.tongtienttoannte,
//      this.tongtienttoannteStr,
//      this.tongtienttoanvnd,
//      this.tongtienhangtruocthue,
//      this.tongtienhangtruocthuevnd,
//      this.tongtienttoanvndStr,
//      this.tongtienvnd,
//      this.trangthai,
//      this.tinhChat,
//      this.tennban,
//      this.dchinban,
//      this.dthoainban,
//      this.tkhoannban,
//      this.nhangnban,
//      this.faxnban,
//      this.emailnban,
//      this.ghiChu,
//      this.contentxml,
//      this.showWarning,
//      this.countRemain,
//   });
//
//   factory LuuHoaDonResponse.fromJson(Map<String, dynamic> json) {
//     return LuuHoaDonResponse(
//       channelCode: json['channelCode'],
//       typehdongoc: json['typehdongoc'],
//       serviceType: json['serviceType'],
//       lyDoXoaBo: json['lyDoXoaBo'],
//       dchinmua: json['dchinmua'],
//       dthoainmua: json['dthoainmua'],
//       emailnmua: json['emailnmua'],
//       faxnmua: json['faxnmua'],
//       hthuctoan: json['hthuctoan'],
//       hthuctoankhac: json['hthuctoankhac'],
//       id: json['id'],
//       idGoc: json['idGoc'],
//       khieuhdon: json['khieuhdon'],
//       loaihdon: json['loaihdon'],
//       macqt: json['macqt'],
//       tencqt: json['tencqt'],
//       maktra: json['maktra'],
//       matte: json['matte'],
//       mauhdon: json['mauhdon'],
//       mstNban: json['mstNban'],
//       mstNmua: json['mstNmua'],
//       ngayduyet: json['ngayduyet'],
//       ngayhdcqt: json['ngayhdcqt'],
//       ngayLap: json['ngayLap'],
//       ngayhdon: json['ngayhdon'],
//       ngayhdong: json['ngayhdong'],
//       ngayvban: json['ngayvban'],
//       ngayvbanStr: json['ngayvbanStr'],
//       nguoiduyet: json['nguoiduyet'],
//       nguoilap: json['nguoilap'],
//       nguoivchuyen: json['nguoivchuyen'],
//       nhangnmua: json['nhangnmua'],
//       ptienvchuyen: json['ptienvchuyen'],
//       sohdcqt: json['sohdcqt'],
//       sohdon: json['sohdon'],
//       sohdong: json['sohdong'],
//       sohdongoc: json['sohdongoc'],
//       ngayCQThdongoc: json['ngayCQThdongoc'],
//       sovban: json['sovban'],
//       tendvinmua: json['tendvinmua'],
//       tenhdon: json['tenhdon'],
//       tenhdong: json['tenhdong'],
//       tenknhap: json['tenknhap'],
//       tenkxuat: json['tenkxuat'],
//       tennmua: json['tennmua'],
//       tgia: json['tgia'],
//       tgiaStr: json['tgiaStr'],
//       tkhoannmua: json['tkhoannmua'],
//       tongtienckhaunte: json['tongtienckhaunte'],
//       tongtienckhauvnd: json['tongtienckhauvnd'],
//       tongtiennte: json['tongtiennte'],
//       tongtienttoanbchu: json['tongtienttoanbchu'],
//       tongtienttoannte: json['tongtienttoannte'],
//       tongtienttoannteStr: json['tongtienttoannteStr'],
//       tongtienttoanvnd: json['tongtienttoanvnd'],
//       tongtienhangtruocthue: json['tongtienhangtruocthue'],
//       tongtienhangtruocthuevnd: json['tongtienhangtruocthuevnd'],
//       tongtienttoanvndStr: json['tongtienttoanvndStr'],
//       tongtienvnd: json['tongtienvnd'],
//       trangthai: json['trangthai'],
//       tinhChat: json['tinhChat'],
//       tennban: json['tennban'],
//       dchinban: json['dchinban'],
//       dthoainban: json['dthoainban'],
//       tkhoannban: json['tkhoannban'],
//       nhangnban: json['nhangnban'],
//       faxnban: json['faxnban'],
//       emailnban: json['emailnban'],
//       ghiChu: json['ghiChu'],
//       contentxml: json['contentxml'],
//       showWarning: json['showWarning'],
//       countRemain: json['countRemain'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'channelCode': channelCode,
//       'typehdongoc': typehdongoc,
//       'serviceType': serviceType,
//       'lyDoXoaBo': lyDoXoaBo,
//       'dchinmua': dchinmua,
//       'dthoainmua': dthoainmua,
//       'emailnmua': emailnmua,
//       'faxnmua': faxnmua,
//       'hthuctoan': hthuctoan,
//       'hthuctoankhac': hthuctoankhac,
//       'id': id,
//       'idGoc': idGoc,
//       'khieuhdon': khieuhdon,
//       'loaihdon': loaihdon,
//       'macqt': macqt,
//       'tencqt': tencqt,
//       'maktra': maktra,
//       'matte': matte,
//       'mauhdon': mauhdon,
//       'mstNban': mstNban,
//       'mstNmua': mstNmua,
//       'ngayduyet': ngayduyet,
//       'ngayhdcqt': ngayhdcqt,
//       'ngayLap': ngayLap,
//       'ngayhdon': ngayhdon,
//       'ngayhdong': ngayhdong,
//       'ngayvban': ngayvban,
//       'ngayvbanStr': ngayvbanStr,
//       'nguoiduyet': nguoiduyet,
//       'nguoilap': nguoilap,
//       'nguoivchuyen': nguoivchuyen,
//       'nhangnmua': nhangnmua,
//       'ptienvchuyen': ptienvchuyen,
//       'sohdcqt': sohdcqt,
//       'sohdon': sohdon,
//       'sohdong': sohdong,
//       'sohdongoc': sohdongoc,
//       'ngayCQThdongoc': ngayCQThdongoc,
//       'sovban': sovban,
//       'tendvinmua': tendvinmua,
//       'tenhdon': tenhdon,
//       'tenhdong': tenhdong,
//       'tenknhap': tenknhap,
//       'tenkxuat': tenkxuat,
//       'tennmua': tennmua,
//       'tgia': tgia,
//       'tgiaStr': tgiaStr,
//       'tkhoannmua': tkhoannmua,
//       'tongtienckhaunte': tongtienckhaunte,
//       'tongtienckhauvnd': tongtienckhauvnd,
//       'tongtiennte': tongtiennte,
//       'tongtienttoanbchu': tongtienttoanbchu,
//       'tongtienttoannte': tongtienttoannte,
//       'tongtienttoannteStr': tongtienttoannteStr,
//       'tongtienttoanvnd': tongtienttoanvnd,
//       'tongtienhangtruocthue': tongtienhangtruocthue,
//       'tongtienhangtruocthuevnd': tongtienhangtruocthuevnd,
//       'tongtienttoanvndStr': tongtienttoanvndStr,
//       'tongtienvnd': tongtienvnd,
//       'trangthai': trangthai,
//       'tinhChat': tinhChat,
//       'tennban': tennban,
//       'dchinban': dchinban,
//       'dthoainban': dthoainban,
//       'tkhoannban': tkhoannban,
//       'nhangnban': nhangnban,
//       'faxnban': faxnban,
//       'emailnban': emailnban,
//       'ghiChu': ghiChu,
//       'contentxml': contentxml,
//       'showWarning': showWarning,
//       'countRemain': countRemain,
//     };
//   }
// }
