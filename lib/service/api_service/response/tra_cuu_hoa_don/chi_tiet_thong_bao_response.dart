
// import 'dart:convert';
//
// ChiTietThongBaoResponse chiTietThongBaoResponseFromJson(String str) => ChiTietThongBaoResponse.fromJson(json.decode(str));
//
// String chiTietThongBaoResponseToJson(ChiTietThongBaoResponse data) => json.encode(data.toJson());
//
// class ChiTietThongBaoResponse {
//   ChiTietThongBaoResponse({
//     this.thongBaoHdr,
//     this.invHdr,
//     this.lstInvoiceDtlTbao,
//     this.urlViewBody,
//     this.htmlViewTBao,
//   });
//
//   final ThongBaoHdr thongBaoHdr;
//   final InvHdr invHdr;
//   final List<dynamic> lstInvoiceDtlTbao;
//   final dynamic urlViewBody;
//   final dynamic htmlViewTBao;
//
//   factory ChiTietThongBaoResponse.fromJson(Map<String, dynamic> json) => ChiTietThongBaoResponse(
//     thongBaoHdr: json["thongBaoHdr"] == null ? null : ThongBaoHdr.fromJson(json["thongBaoHdr"]),
//     invHdr: json["invHdr"] == null ? null : InvHdr.fromJson(json["invHdr"]),
//     lstInvoiceDtlTbao: json["lstInvoiceDtlTbao"] == null ? null : List<dynamic>.from(json["lstInvoiceDtlTbao"].map((x) => x)),
//     urlViewBody: json["url_viewBody"],
//     htmlViewTBao: json["htmlViewTBao"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "thongBaoHdr": thongBaoHdr == null ? null : thongBaoHdr.toJson(),
//     "invHdr": invHdr == null ? null : invHdr.toJson(),
//     "lstInvoiceDtlTbao": lstInvoiceDtlTbao == null ? null : List<dynamic>.from(lstInvoiceDtlTbao.map((x) => x)),
//     "url_viewBody": urlViewBody,
//     "htmlViewTBao": htmlViewTBao,
//   };
// }
//
// class InvHdr {
//   InvHdr({
//     this.channelCode,
//     this.typehdongoc,
//     this.serviceType,
//     this.lyDoXoaBo,
//     this.dchinmua,
//     this.dthoainmua,
//     this.emailnmua,
//     this.faxnmua,
//     this.hthuctoan,
//     this.hthuctoankhac,
//     this.id,
//     this.idGoc,
//     this.khieuhdon,
//     this.loaihdon,
//     this.macqt,
//     this.tencqt,
//     this.maktra,
//     this.matte,
//     this.mauhdon,
//     this.mstNban,
//     this.mstNmua,
//     this.ngayduyet,
//     this.ngayhdcqt,
//     this.ngayLap,
//     this.ngayhdon,
//     this.ngayhdong,
//     this.ngayvban,
//     this.ngayvbanStr,
//     this.nguoiduyet,
//     this.nguoilap,
//     this.nguoivchuyen,
//     this.nhangnmua,
//     this.ptienvchuyen,
//     this.sohdcqt,
//     this.sohdon,
//     this.sohdong,
//     this.sohdongoc,
//     this.ngayCqThdongoc,
//     this.sovban,
//     this.tendvinmua,
//     this.tenhdon,
//     this.tenhdong,
//     this.tenknhap,
//     this.tenkxuat,
//     this.tennmua,
//     this.tgia,
//     this.tgiaStr,
//     this.tkhoannmua,
//     this.tongtienckhaunte,
//     this.tongtienckhauvnd,
//     this.tongtiennte,
//     this.tongtienttoanbchu,
//     this.tongtienttoannte,
//     this.tongtienttoannteStr,
//     this.tongtienttoanvnd,
//     this.tongtienhangtruocthue,
//     this.tongtienhangtruocthuevnd,
//     this.tongtienttoanvndStr,
//     this.tongtienvnd,
//     this.trangthai,
//     this.tinhChat,
//     this.tennban,
//     this.dchinban,
//     this.dthoainban,
//     this.tkhoannban,
//     this.nhangnban,
//     this.faxnban,
//     this.emailnban,
//     this.ghiChu,
//     this.contentxml,
//     this.barcode,
//     this.mota,
//     this.tongtienthuente,
//     this.tongtienthuenteStr,
//     this.confirm,
//     this.check,
//     this.flagFee,
//     this.flagGiayTuin,
//     this.maKeyGopExcel,
//     this.trnRefNo,
//     this.relatedCustomer,
//     this.uniqueId,
//     this.extRef,
//     this.tongtienttoanbchuVnd,
//     this.branchName,
//     this.invoiceKey,
//     this.adjustmentInvoice,
//     this.sttHdUpload,
//     this.mustToSign,
//     this.hoadondacthu,
//     this.userName,
//     this.checkInChuyenDoi,
//     this.tongtienthuevnd,
//     this.tongtienthuevndStr,
//     this.tongthuesuat5Nte,
//     this.tongthuesuat5Vnd,
//     this.tongthuesuat10Nte,
//     this.tongthuesuat10Vnd,
//     this.tongthuesuatthuekhacnte,
//     this.tongthuesuatthuekhacvnd,
//     this.tongthuesuat0Nte,
//     this.tongthuesuat0Vnd,
//     this.khongchiuthuegtgt,
//     this.mienthuegtgt,
//     this.thueTang,
//     this.thueGiam,
//     this.tongTToanTang,
//     this.tongTToanGiam,
//     this.lyDoDChinh,
//     this.tongtienthuedchinhtanggiam,
//     this.tongtienttoandchinhtanggiam,
//     this.tongtienthuedchinhtanggiamStr,
//     this.tongtienttoandchinhtanggiamStr,
//     this.pbanxml,
//     this.messReceived,
//     this.hDongVchuyen,
//     this.idNguoilap,
//     this.vanId,
//     this.lydotuchoi,
//     this.detail,
//     this.listOfProduct,
//     this.soLenhDDong,
//     this.ngayDDong,
//     this.nguoiDDong,
//     this.lDoDDong,
//     this.maGdich,
//     this.tongtientruocthue10Nte,
//     this.tongtientruocthue5Nte,
//     this.tongtientruocthue0Nte,
//     this.tongtientruocthuekchiuthuente,
//     this.tongtientruocthuemienthuente,
//     this.tongtientruocthuethuekhacnte,
//     this.tongtientruocthue10Vnd,
//     this.tongtientruocthue5Vnd,
//     this.tongtientruocthue0Vnd,
//     this.tongtientruocthuekchiuthuevnd,
//     this.tongtientruocthuemienthuevnd,
//     this.tongtientruocthuethuekhacvnd,
//     this.tongtiensauthue10Nte,
//     this.tongtiensauthue5Nte,
//     this.tongtiensauthue0Nte,
//     this.tongtiensauthuekchiuthuente,
//     this.tongtiensauthuemienthuevnd,
//     this.tongtiensauthuethuekhacvnd,
//     this.tongtiensauthue10Vnd,
//     this.tongtiensauthue5Vnd,
//     this.tongtiensauthue0Vnd,
//     this.tongtiensauthuekchiuthuevnd,
//     this.tongtiensauthuemienthuente,
//     this.tongtiensauthuethuekhacnte,
//     this.updateTime,
//     this.cdKhieuhdon,
//     this.cdMauhdon,
//     this.cdSohdon,
//     this.hdongiay,
//     this.tongTienTToanGiay,
//     this.tongTienThueGtgtGiay,
//     this.hThucHDon,
//     this.kyDienTu,
//     this.fee,
//     this.feeVat,
//     this.wfProcessId,
//     this.wfStatus,
//     this.wfUpdateTime,
//     this.status,
//     this.loaiDieuChinh,
//     this.level,
//     this.qrcode,
//     this.lstInvOtherInfoBan,
//     this.lstInvOtherInfoMua,
//     this.lstInvOtherInfoTToan,
//     this.lstInvOtherInfoLePhiKhac,
//     this.lstInvOtherInfoCthd,
//     this.tongcongthucxuat,
//     this.isTt68,
//     this.signDescError,
//     this.tinhchatgoc,
//     this.sluongdcdd,
//     this.sluongdcCopy,
//     this.checkBanNhap,
//     this.ngayLapFormat,
//     this.corpId,
//     this.hthucHDonGoc,
//   });
//
//   final String channelCode;
//   final String typehdongoc;
//   final String serviceType;
//   final String lyDoXoaBo;
//   final String dchinmua;
//   final String dthoainmua;
//   final String emailnmua;
//   final String faxnmua;
//   final String hthuctoan;
//   final String hthuctoankhac;
//   final int id;
//   final int idGoc;
//   final String khieuhdon;
//   final String loaihdon;
//   final String macqt;
//   final String tencqt;
//   final String maktra;
//   final String matte;
//   final String mauhdon;
//   final String mstNban;
//   final String mstNmua;
//   final dynamic ngayduyet;
//   final dynamic ngayhdcqt;
//   final dynamic ngayLap;
//   final int ngayhdon;
//   final dynamic ngayhdong;
//   final dynamic ngayvban;
//   final String ngayvbanStr;
//   final String nguoiduyet;
//   final String nguoilap;
//   final String nguoivchuyen;
//   final String nhangnmua;
//   final String ptienvchuyen;
//   final String sohdcqt;
//   final String sohdon;
//   final String sohdong;
//   final String sohdongoc;
//   final String ngayCqThdongoc;
//   final String sovban;
//   final String tendvinmua;
//   final String tenhdon;
//   final String tenhdong;
//   final String tenknhap;
//   final String tenkxuat;
//   final String tennmua;
//   final dynamic tgia;
//   final String tgiaStr;
//   final String tkhoannmua;
//   final int tongtienckhaunte;
//   final int tongtienckhauvnd;
//   final int tongtiennte;
//   final String tongtienttoanbchu;
//   final int tongtienttoannte;
//   final String tongtienttoannteStr;
//   final int tongtienttoanvnd;
//   final int tongtienhangtruocthue;
//   final int tongtienhangtruocthuevnd;
//   final String tongtienttoanvndStr;
//   final int tongtienvnd;
//   final String trangthai;
//   final String tinhChat;
//   final String tennban;
//   final String dchinban;
//   final String dthoainban;
//   final String tkhoannban;
//   final String nhangnban;
//   final String faxnban;
//   final String emailnban;
//   final String ghiChu;
//   final dynamic contentxml;
//   final String barcode;
//   final String mota;
//   final int tongtienthuente;
//   final String tongtienthuenteStr;
//   final String confirm;
//   final String check;
//   final String flagFee;
//   final String flagGiayTuin;
//   final dynamic maKeyGopExcel;
//   final dynamic trnRefNo;
//   final dynamic relatedCustomer;
//   final dynamic uniqueId;
//   final dynamic extRef;
//   final String tongtienttoanbchuVnd;
//   final dynamic branchName;
//   final dynamic invoiceKey;
//   final dynamic adjustmentInvoice;
//   final dynamic sttHdUpload;
//   final dynamic mustToSign;
//   final dynamic hoadondacthu;
//   final dynamic userName;
//   final dynamic checkInChuyenDoi;
//   final int tongtienthuevnd;
//   final String tongtienthuevndStr;
//   final int tongthuesuat5Nte;
//   final int tongthuesuat5Vnd;
//   final int tongthuesuat10Nte;
//   final int tongthuesuat10Vnd;
//   final int tongthuesuatthuekhacnte;
//   final int tongthuesuatthuekhacvnd;
//   final int tongthuesuat0Nte;
//   final int tongthuesuat0Vnd;
//   final int khongchiuthuegtgt;
//   final int mienthuegtgt;
//   final int thueTang;
//   final int thueGiam;
//   final int tongTToanTang;
//   final int tongTToanGiam;
//   final String lyDoDChinh;
//   final int tongtienthuedchinhtanggiam;
//   final int tongtienttoandchinhtanggiam;
//   final dynamic tongtienthuedchinhtanggiamStr;
//   final dynamic tongtienttoandchinhtanggiamStr;
//   final String pbanxml;
//   final String messReceived;
//   final String hDongVchuyen;
//   final int idNguoilap;
//   final String vanId;
//   final String lydotuchoi;
//   final dynamic detail;
//   final dynamic listOfProduct;
//   final String soLenhDDong;
//   final dynamic ngayDDong;
//   final String nguoiDDong;
//   final String lDoDDong;
//   final String maGdich;
//   final int tongtientruocthue10Nte;
//   final int tongtientruocthue5Nte;
//   final int tongtientruocthue0Nte;
//   final int tongtientruocthuekchiuthuente;
//   final int tongtientruocthuemienthuente;
//   final int tongtientruocthuethuekhacnte;
//   final int tongtientruocthue10Vnd;
//   final int tongtientruocthue5Vnd;
//   final int tongtientruocthue0Vnd;
//   final int tongtientruocthuekchiuthuevnd;
//   final int tongtientruocthuemienthuevnd;
//   final int tongtientruocthuethuekhacvnd;
//   final int tongtiensauthue10Nte;
//   final int tongtiensauthue5Nte;
//   final int tongtiensauthue0Nte;
//   final int tongtiensauthuekchiuthuente;
//   final int tongtiensauthuemienthuevnd;
//   final int tongtiensauthuethuekhacvnd;
//   final int tongtiensauthue10Vnd;
//   final int tongtiensauthue5Vnd;
//   final int tongtiensauthue0Vnd;
//   final int tongtiensauthuekchiuthuevnd;
//   final int tongtiensauthuemienthuente;
//   final int tongtiensauthuethuekhacnte;
//   final dynamic updateTime;
//   final String cdKhieuhdon;
//   final String cdMauhdon;
//   final String cdSohdon;
//   final String hdongiay;
//   final int tongTienTToanGiay;
//   final int tongTienThueGtgtGiay;
//   final String hThucHDon;
//   final String kyDienTu;
//   final int fee;
//   final int feeVat;
//   final dynamic wfProcessId;
//   final dynamic wfStatus;
//   final dynamic wfUpdateTime;
//   final String status;
//   final dynamic loaiDieuChinh;
//   final int level;
//   final dynamic qrcode;
//   final dynamic lstInvOtherInfoBan;
//   final dynamic lstInvOtherInfoMua;
//   final dynamic lstInvOtherInfoTToan;
//   final dynamic lstInvOtherInfoLePhiKhac;
//   final dynamic lstInvOtherInfoCthd;
//   final dynamic tongcongthucxuat;
//   final String isTt68;
//   final dynamic signDescError;
//   final String tinhchatgoc;
//   final int sluongdcdd;
//   final int sluongdcCopy;
//   final dynamic checkBanNhap;
//   final dynamic ngayLapFormat;
//   final dynamic corpId;
//   final String hthucHDonGoc;
//
//   factory InvHdr.fromJson(Map<String, dynamic> json) => InvHdr(
//     channelCode: json["channelCode"] == null ? null : json["channelCode"],
//     typehdongoc: json["typehdongoc"] == null ? null : json["typehdongoc"],
//     serviceType: json["serviceType"] == null ? null : json["serviceType"],
//     lyDoXoaBo: json["lyDoXoaBo"] == null ? null : json["lyDoXoaBo"],
//     dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
//     dthoainmua: json["dthoainmua"] == null ? null : json["dthoainmua"],
//     emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
//     faxnmua: json["faxnmua"] == null ? null : json["faxnmua"],
//     hthuctoan: json["hthuctoan"] == null ? null : json["hthuctoan"],
//     hthuctoankhac: json["hthuctoankhac"] == null ? null : json["hthuctoankhac"],
//     id: json["id"] == null ? null : json["id"],
//     idGoc: json["idGoc"] == null ? null : json["idGoc"],
//     khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
//     loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
//     macqt: json["macqt"] == null ? null : json["macqt"],
//     tencqt: json["tencqt"] == null ? null : json["tencqt"],
//     maktra: json["maktra"] == null ? null : json["maktra"],
//     matte: json["matte"] == null ? null : json["matte"],
//     mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
//     mstNban: json["mstNban"] == null ? null : json["mstNban"],
//     mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
//     ngayduyet: json["ngayduyet"],
//     ngayhdcqt: json["ngayhdcqt"],
//     ngayLap: json["ngayLap"],
//     ngayhdon: json["ngayhdon"] == null ? null : json["ngayhdon"],
//     ngayhdong: json["ngayhdong"],
//     ngayvban: json["ngayvban"],
//     ngayvbanStr: json["ngayvbanStr"] == null ? null : json["ngayvbanStr"],
//     nguoiduyet: json["nguoiduyet"] == null ? null : json["nguoiduyet"],
//     nguoilap: json["nguoilap"] == null ? null : json["nguoilap"],
//     nguoivchuyen: json["nguoivchuyen"] == null ? null : json["nguoivchuyen"],
//     nhangnmua: json["nhangnmua"] == null ? null : json["nhangnmua"],
//     ptienvchuyen: json["ptienvchuyen"] == null ? null : json["ptienvchuyen"],
//     sohdcqt: json["sohdcqt"] == null ? null : json["sohdcqt"],
//     sohdon: json["sohdon"] == null ? null : json["sohdon"],
//     sohdong: json["sohdong"] == null ? null : json["sohdong"],
//     sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
//     ngayCqThdongoc: json["ngayCQThdongoc"] == null ? null : json["ngayCQThdongoc"],
//     sovban: json["sovban"] == null ? null : json["sovban"],
//     tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
//     tenhdon: json["tenhdon"] == null ? null : json["tenhdon"],
//     tenhdong: json["tenhdong"] == null ? null : json["tenhdong"],
//     tenknhap: json["tenknhap"] == null ? null : json["tenknhap"],
//     tenkxuat: json["tenkxuat"] == null ? null : json["tenkxuat"],
//     tennmua: json["tennmua"] == null ? null : json["tennmua"],
//     tgia: json["tgia"],
//     tgiaStr: json["tgiaStr"] == null ? null : json["tgiaStr"],
//     tkhoannmua: json["tkhoannmua"] == null ? null : json["tkhoannmua"],
//     tongtienckhaunte: json["tongtienckhaunte"] == null ? null : json["tongtienckhaunte"],
//     tongtienckhauvnd: json["tongtienckhauvnd"] == null ? null : json["tongtienckhauvnd"],
//     tongtiennte: json["tongtiennte"] == null ? null : json["tongtiennte"],
//     tongtienttoanbchu: json["tongtienttoanbchu"] == null ? null : json["tongtienttoanbchu"],
//     tongtienttoannte: json["tongtienttoannte"] == null ? null : json["tongtienttoannte"],
//     tongtienttoannteStr: json["tongtienttoannteStr"] == null ? null : json["tongtienttoannteStr"],
//     tongtienttoanvnd: json["tongtienttoanvnd"] == null ? null : json["tongtienttoanvnd"],
//     tongtienhangtruocthue: json["tongtienhangtruocthue"] == null ? null : json["tongtienhangtruocthue"],
//     tongtienhangtruocthuevnd: json["tongtienhangtruocthuevnd"] == null ? null : json["tongtienhangtruocthuevnd"],
//     tongtienttoanvndStr: json["tongtienttoanvndStr"] == null ? null : json["tongtienttoanvndStr"],
//     tongtienvnd: json["tongtienvnd"] == null ? null : json["tongtienvnd"],
//     trangthai: json["trangthai"] == null ? null : json["trangthai"],
//     tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
//     tennban: json["tennban"] == null ? null : json["tennban"],
//     dchinban: json["dchinban"] == null ? null : json["dchinban"],
//     dthoainban: json["dthoainban"] == null ? null : json["dthoainban"],
//     tkhoannban: json["tkhoannban"] == null ? null : json["tkhoannban"],
//     nhangnban: json["nhangnban"] == null ? null : json["nhangnban"],
//     faxnban: json["faxnban"] == null ? null : json["faxnban"],
//     emailnban: json["emailnban"] == null ? null : json["emailnban"],
//     ghiChu: json["ghiChu"] == null ? null : json["ghiChu"],
//     contentxml: json["contentxml"],
//     barcode: json["barcode"] == null ? null : json["barcode"],
//     mota: json["mota"] == null ? null : json["mota"],
//     tongtienthuente: json["tongtienthuente"] == null ? null : json["tongtienthuente"],
//     tongtienthuenteStr: json["tongtienthuenteStr"] == null ? null : json["tongtienthuenteStr"],
//     confirm: json["confirm"] == null ? null : json["confirm"],
//     check: json["check"] == null ? null : json["check"],
//     flagFee: json["flag_fee"] == null ? null : json["flag_fee"],
//     flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
//     maKeyGopExcel: json["maKeyGopExcel"],
//     trnRefNo: json["trn_ref_no"],
//     relatedCustomer: json["related_customer"],
//     uniqueId: json["unique_id"],
//     extRef: json["ext_ref"],
//     tongtienttoanbchuVnd: json["tongtienttoanbchu_vnd"] == null ? null : json["tongtienttoanbchu_vnd"],
//     branchName: json["branch_name"],
//     invoiceKey: json["invoice_key"],
//     adjustmentInvoice: json["adjustmentInvoice"],
//     sttHdUpload: json["sttHDUpload"],
//     mustToSign: json["must_to_sign"],
//     hoadondacthu: json["hoadondacthu"],
//     userName: json["user_name"],
//     checkInChuyenDoi: json["checkInChuyenDoi"],
//     tongtienthuevnd: json["tongtienthuevnd"] == null ? null : json["tongtienthuevnd"],
//     tongtienthuevndStr: json["tongtienthuevndStr"] == null ? null : json["tongtienthuevndStr"],
//     tongthuesuat5Nte: json["tongthuesuat5nte"] == null ? null : json["tongthuesuat5nte"],
//     tongthuesuat5Vnd: json["tongthuesuat5vnd"] == null ? null : json["tongthuesuat5vnd"],
//     tongthuesuat10Nte: json["tongthuesuat10nte"] == null ? null : json["tongthuesuat10nte"],
//     tongthuesuat10Vnd: json["tongthuesuat10vnd"] == null ? null : json["tongthuesuat10vnd"],
//     tongthuesuatthuekhacnte: json["tongthuesuatthuekhacnte"] == null ? null : json["tongthuesuatthuekhacnte"],
//     tongthuesuatthuekhacvnd: json["tongthuesuatthuekhacvnd"] == null ? null : json["tongthuesuatthuekhacvnd"],
//     tongthuesuat0Nte: json["tongthuesuat0nte"] == null ? null : json["tongthuesuat0nte"],
//     tongthuesuat0Vnd: json["tongthuesuat0vnd"] == null ? null : json["tongthuesuat0vnd"],
//     khongchiuthuegtgt: json["khongchiuthuegtgt"] == null ? null : json["khongchiuthuegtgt"],
//     mienthuegtgt: json["mienthuegtgt"] == null ? null : json["mienthuegtgt"],
//     thueTang: json["thueTang"] == null ? null : json["thueTang"],
//     thueGiam: json["thueGiam"] == null ? null : json["thueGiam"],
//     tongTToanTang: json["tongTToanTang"] == null ? null : json["tongTToanTang"],
//     tongTToanGiam: json["tongTToanGiam"] == null ? null : json["tongTToanGiam"],
//     lyDoDChinh: json["lyDoDChinh"] == null ? null : json["lyDoDChinh"],
//     tongtienthuedchinhtanggiam: json["tongtienthuedchinhtanggiam"] == null ? null : json["tongtienthuedchinhtanggiam"],
//     tongtienttoandchinhtanggiam: json["tongtienttoandchinhtanggiam"] == null ? null : json["tongtienttoandchinhtanggiam"],
//     tongtienthuedchinhtanggiamStr: json["tongtienthuedchinhtanggiamStr"],
//     tongtienttoandchinhtanggiamStr: json["tongtienttoandchinhtanggiamStr"],
//     pbanxml: json["pbanxml"] == null ? null : json["pbanxml"],
//     messReceived: json["messReceived"] == null ? null : json["messReceived"],
//     hDongVchuyen: json["hDongVchuyen"] == null ? null : json["hDongVchuyen"],
//     idNguoilap: json["id_nguoilap"] == null ? null : json["id_nguoilap"],
//     vanId: json["van_id"] == null ? null : json["van_id"],
//     lydotuchoi: json["lydotuchoi"] == null ? null : json["lydotuchoi"],
//     detail: json["detail"],
//     listOfProduct: json["listOfProduct"],
//     soLenhDDong: json["soLenhDDong"] == null ? null : json["soLenhDDong"],
//     ngayDDong: json["ngayDDong"],
//     nguoiDDong: json["nguoiDDong"] == null ? null : json["nguoiDDong"],
//     lDoDDong: json["lDoDDong"] == null ? null : json["lDoDDong"],
//     maGdich: json["ma_gdich"] == null ? null : json["ma_gdich"],
//     tongtientruocthue10Nte: json["tongtientruocthue10nte"] == null ? null : json["tongtientruocthue10nte"],
//     tongtientruocthue5Nte: json["tongtientruocthue5nte"] == null ? null : json["tongtientruocthue5nte"],
//     tongtientruocthue0Nte: json["tongtientruocthue0nte"] == null ? null : json["tongtientruocthue0nte"],
//     tongtientruocthuekchiuthuente: json["tongtientruocthuekchiuthuente"] == null ? null : json["tongtientruocthuekchiuthuente"],
//     tongtientruocthuemienthuente: json["tongtientruocthuemienthuente"] == null ? null : json["tongtientruocthuemienthuente"],
//     tongtientruocthuethuekhacnte: json["tongtientruocthuethuekhacnte"] == null ? null : json["tongtientruocthuethuekhacnte"],
//     tongtientruocthue10Vnd: json["tongtientruocthue10vnd"] == null ? null : json["tongtientruocthue10vnd"],
//     tongtientruocthue5Vnd: json["tongtientruocthue5vnd"] == null ? null : json["tongtientruocthue5vnd"],
//     tongtientruocthue0Vnd: json["tongtientruocthue0vnd"] == null ? null : json["tongtientruocthue0vnd"],
//     tongtientruocthuekchiuthuevnd: json["tongtientruocthuekchiuthuevnd"] == null ? null : json["tongtientruocthuekchiuthuevnd"],
//     tongtientruocthuemienthuevnd: json["tongtientruocthuemienthuevnd"] == null ? null : json["tongtientruocthuemienthuevnd"],
//     tongtientruocthuethuekhacvnd: json["tongtientruocthuethuekhacvnd"] == null ? null : json["tongtientruocthuethuekhacvnd"],
//     tongtiensauthue10Nte: json["tongtiensauthue10nte"] == null ? null : json["tongtiensauthue10nte"],
//     tongtiensauthue5Nte: json["tongtiensauthue5nte"] == null ? null : json["tongtiensauthue5nte"],
//     tongtiensauthue0Nte: json["tongtiensauthue0nte"] == null ? null : json["tongtiensauthue0nte"],
//     tongtiensauthuekchiuthuente: json["tongtiensauthuekchiuthuente"] == null ? null : json["tongtiensauthuekchiuthuente"],
//     tongtiensauthuemienthuevnd: json["tongtiensauthuemienthuevnd"] == null ? null : json["tongtiensauthuemienthuevnd"],
//     tongtiensauthuethuekhacvnd: json["tongtiensauthuethuekhacvnd"] == null ? null : json["tongtiensauthuethuekhacvnd"],
//     tongtiensauthue10Vnd: json["tongtiensauthue10vnd"] == null ? null : json["tongtiensauthue10vnd"],
//     tongtiensauthue5Vnd: json["tongtiensauthue5vnd"] == null ? null : json["tongtiensauthue5vnd"],
//     tongtiensauthue0Vnd: json["tongtiensauthue0vnd"] == null ? null : json["tongtiensauthue0vnd"],
//     tongtiensauthuekchiuthuevnd: json["tongtiensauthuekchiuthuevnd"] == null ? null : json["tongtiensauthuekchiuthuevnd"],
//     tongtiensauthuemienthuente: json["tongtiensauthuemienthuente"] == null ? null : json["tongtiensauthuemienthuente"],
//     tongtiensauthuethuekhacnte: json["tongtiensauthuethuekhacnte"] == null ? null : json["tongtiensauthuethuekhacnte"],
//     updateTime: json["update_time"],
//     cdKhieuhdon: json["cd_khieuhdon"] == null ? null : json["cd_khieuhdon"],
//     cdMauhdon: json["cd_mauhdon"] == null ? null : json["cd_mauhdon"],
//     cdSohdon: json["cd_sohdon"] == null ? null : json["cd_sohdon"],
//     hdongiay: json["hdongiay"] == null ? null : json["hdongiay"],
//     tongTienTToanGiay: json["tongTienTToanGiay"] == null ? null : json["tongTienTToanGiay"],
//     tongTienThueGtgtGiay: json["tongTienThueGTGTGiay"] == null ? null : json["tongTienThueGTGTGiay"],
//     hThucHDon: json["hThucHDon"] == null ? null : json["hThucHDon"],
//     kyDienTu: json["kyDienTu"] == null ? null : json["kyDienTu"],
//     fee: json["fee"] == null ? null : json["fee"],
//     feeVat: json["fee_vat"] == null ? null : json["fee_vat"],
//     wfProcessId: json["wf_process_id"],
//     wfStatus: json["wf_status"],
//     wfUpdateTime: json["wf_update_time"],
//     status: json["status"] == null ? null : json["status"],
//     loaiDieuChinh: json["loai_dieu_chinh"],
//     level: json["level"] == null ? null : json["level"],
//     qrcode: json["qrcode"],
//     lstInvOtherInfoBan: json["lstInvOtherInfoBan"],
//     lstInvOtherInfoMua: json["lstInvOtherInfoMua"],
//     lstInvOtherInfoTToan: json["lstInvOtherInfoTToan"],
//     lstInvOtherInfoLePhiKhac: json["lstInvOtherInfoLePhiKhac"],
//     lstInvOtherInfoCthd: json["lstInvOtherInfoCTHD"],
//     tongcongthucxuat: json["tongcongthucxuat"],
//     isTt68: json["is_tt68"] == null ? null : json["is_tt68"],
//     signDescError: json["sign_desc_error"],
//     tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
//     sluongdcdd: json["sluongdcdd"] == null ? null : json["sluongdcdd"],
//     sluongdcCopy: json["sluongdcCopy"] == null ? null : json["sluongdcCopy"],
//     checkBanNhap: json["checkBanNhap"],
//     ngayLapFormat: json["ngayLapFormat"],
//     corpId: json["corpID"],
//     hthucHDonGoc: json["hthucHDonGoc"] == null ? null : json["hthucHDonGoc"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "channelCode": channelCode == null ? null : channelCode,
//     "typehdongoc": typehdongoc == null ? null : typehdongoc,
//     "serviceType": serviceType == null ? null : serviceType,
//     "lyDoXoaBo": lyDoXoaBo == null ? null : lyDoXoaBo,
//     "dchinmua": dchinmua == null ? null : dchinmua,
//     "dthoainmua": dthoainmua == null ? null : dthoainmua,
//     "emailnmua": emailnmua == null ? null : emailnmua,
//     "faxnmua": faxnmua == null ? null : faxnmua,
//     "hthuctoan": hthuctoan == null ? null : hthuctoan,
//     "hthuctoankhac": hthuctoankhac == null ? null : hthuctoankhac,
//     "id": id == null ? null : id,
//     "idGoc": idGoc == null ? null : idGoc,
//     "khieuhdon": khieuhdon == null ? null : khieuhdon,
//     "loaihdon": loaihdon == null ? null : loaihdon,
//     "macqt": macqt == null ? null : macqt,
//     "tencqt": tencqt == null ? null : tencqt,
//     "maktra": maktra == null ? null : maktra,
//     "matte": matte == null ? null : matte,
//     "mauhdon": mauhdon == null ? null : mauhdon,
//     "mstNban": mstNban == null ? null : mstNban,
//     "mstNmua": mstNmua == null ? null : mstNmua,
//     "ngayduyet": ngayduyet,
//     "ngayhdcqt": ngayhdcqt,
//     "ngayLap": ngayLap,
//     "ngayhdon": ngayhdon == null ? null : ngayhdon,
//     "ngayhdong": ngayhdong,
//     "ngayvban": ngayvban,
//     "ngayvbanStr": ngayvbanStr == null ? null : ngayvbanStr,
//     "nguoiduyet": nguoiduyet == null ? null : nguoiduyet,
//     "nguoilap": nguoilap == null ? null : nguoilap,
//     "nguoivchuyen": nguoivchuyen == null ? null : nguoivchuyen,
//     "nhangnmua": nhangnmua == null ? null : nhangnmua,
//     "ptienvchuyen": ptienvchuyen == null ? null : ptienvchuyen,
//     "sohdcqt": sohdcqt == null ? null : sohdcqt,
//     "sohdon": sohdon == null ? null : sohdon,
//     "sohdong": sohdong == null ? null : sohdong,
//     "sohdongoc": sohdongoc == null ? null : sohdongoc,
//     "ngayCQThdongoc": ngayCqThdongoc == null ? null : ngayCqThdongoc,
//     "sovban": sovban == null ? null : sovban,
//     "tendvinmua": tendvinmua == null ? null : tendvinmua,
//     "tenhdon": tenhdon == null ? null : tenhdon,
//     "tenhdong": tenhdong == null ? null : tenhdong,
//     "tenknhap": tenknhap == null ? null : tenknhap,
//     "tenkxuat": tenkxuat == null ? null : tenkxuat,
//     "tennmua": tennmua == null ? null : tennmua,
//     "tgia": tgia,
//     "tgiaStr": tgiaStr == null ? null : tgiaStr,
//     "tkhoannmua": tkhoannmua == null ? null : tkhoannmua,
//     "tongtienckhaunte": tongtienckhaunte == null ? null : tongtienckhaunte,
//     "tongtienckhauvnd": tongtienckhauvnd == null ? null : tongtienckhauvnd,
//     "tongtiennte": tongtiennte == null ? null : tongtiennte,
//     "tongtienttoanbchu": tongtienttoanbchu == null ? null : tongtienttoanbchu,
//     "tongtienttoannte": tongtienttoannte == null ? null : tongtienttoannte,
//     "tongtienttoannteStr": tongtienttoannteStr == null ? null : tongtienttoannteStr,
//     "tongtienttoanvnd": tongtienttoanvnd == null ? null : tongtienttoanvnd,
//     "tongtienhangtruocthue": tongtienhangtruocthue == null ? null : tongtienhangtruocthue,
//     "tongtienhangtruocthuevnd": tongtienhangtruocthuevnd == null ? null : tongtienhangtruocthuevnd,
//     "tongtienttoanvndStr": tongtienttoanvndStr == null ? null : tongtienttoanvndStr,
//     "tongtienvnd": tongtienvnd == null ? null : tongtienvnd,
//     "trangthai": trangthai == null ? null : trangthai,
//     "tinhChat": tinhChat == null ? null : tinhChat,
//     "tennban": tennban == null ? null : tennban,
//     "dchinban": dchinban == null ? null : dchinban,
//     "dthoainban": dthoainban == null ? null : dthoainban,
//     "tkhoannban": tkhoannban == null ? null : tkhoannban,
//     "nhangnban": nhangnban == null ? null : nhangnban,
//     "faxnban": faxnban == null ? null : faxnban,
//     "emailnban": emailnban == null ? null : emailnban,
//     "ghiChu": ghiChu == null ? null : ghiChu,
//     "contentxml": contentxml,
//     "barcode": barcode == null ? null : barcode,
//     "mota": mota == null ? null : mota,
//     "tongtienthuente": tongtienthuente == null ? null : tongtienthuente,
//     "tongtienthuenteStr": tongtienthuenteStr == null ? null : tongtienthuenteStr,
//     "confirm": confirm == null ? null : confirm,
//     "check": check == null ? null : check,
//     "flag_fee": flagFee == null ? null : flagFee,
//     "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
//     "maKeyGopExcel": maKeyGopExcel,
//     "trn_ref_no": trnRefNo,
//     "related_customer": relatedCustomer,
//     "unique_id": uniqueId,
//     "ext_ref": extRef,
//     "tongtienttoanbchu_vnd": tongtienttoanbchuVnd == null ? null : tongtienttoanbchuVnd,
//     "branch_name": branchName,
//     "invoice_key": invoiceKey,
//     "adjustmentInvoice": adjustmentInvoice,
//     "sttHDUpload": sttHdUpload,
//     "must_to_sign": mustToSign,
//     "hoadondacthu": hoadondacthu,
//     "user_name": userName,
//     "checkInChuyenDoi": checkInChuyenDoi,
//     "tongtienthuevnd": tongtienthuevnd == null ? null : tongtienthuevnd,
//     "tongtienthuevndStr": tongtienthuevndStr == null ? null : tongtienthuevndStr,
//     "tongthuesuat5nte": tongthuesuat5Nte == null ? null : tongthuesuat5Nte,
//     "tongthuesuat5vnd": tongthuesuat5Vnd == null ? null : tongthuesuat5Vnd,
//     "tongthuesuat10nte": tongthuesuat10Nte == null ? null : tongthuesuat10Nte,
//     "tongthuesuat10vnd": tongthuesuat10Vnd == null ? null : tongthuesuat10Vnd,
//     "tongthuesuatthuekhacnte": tongthuesuatthuekhacnte == null ? null : tongthuesuatthuekhacnte,
//     "tongthuesuatthuekhacvnd": tongthuesuatthuekhacvnd == null ? null : tongthuesuatthuekhacvnd,
//     "tongthuesuat0nte": tongthuesuat0Nte == null ? null : tongthuesuat0Nte,
//     "tongthuesuat0vnd": tongthuesuat0Vnd == null ? null : tongthuesuat0Vnd,
//     "khongchiuthuegtgt": khongchiuthuegtgt == null ? null : khongchiuthuegtgt,
//     "mienthuegtgt": mienthuegtgt == null ? null : mienthuegtgt,
//     "thueTang": thueTang == null ? null : thueTang,
//     "thueGiam": thueGiam == null ? null : thueGiam,
//     "tongTToanTang": tongTToanTang == null ? null : tongTToanTang,
//     "tongTToanGiam": tongTToanGiam == null ? null : tongTToanGiam,
//     "lyDoDChinh": lyDoDChinh == null ? null : lyDoDChinh,
//     "tongtienthuedchinhtanggiam": tongtienthuedchinhtanggiam == null ? null : tongtienthuedchinhtanggiam,
//     "tongtienttoandchinhtanggiam": tongtienttoandchinhtanggiam == null ? null : tongtienttoandchinhtanggiam,
//     "tongtienthuedchinhtanggiamStr": tongtienthuedchinhtanggiamStr,
//     "tongtienttoandchinhtanggiamStr": tongtienttoandchinhtanggiamStr,
//     "pbanxml": pbanxml == null ? null : pbanxml,
//     "messReceived": messReceived == null ? null : messReceived,
//     "hDongVchuyen": hDongVchuyen == null ? null : hDongVchuyen,
//     "id_nguoilap": idNguoilap == null ? null : idNguoilap,
//     "van_id": vanId == null ? null : vanId,
//     "lydotuchoi": lydotuchoi == null ? null : lydotuchoi,
//     "detail": detail,
//     "listOfProduct": listOfProduct,
//     "soLenhDDong": soLenhDDong == null ? null : soLenhDDong,
//     "ngayDDong": ngayDDong,
//     "nguoiDDong": nguoiDDong == null ? null : nguoiDDong,
//     "lDoDDong": lDoDDong == null ? null : lDoDDong,
//     "ma_gdich": maGdich == null ? null : maGdich,
//     "tongtientruocthue10nte": tongtientruocthue10Nte == null ? null : tongtientruocthue10Nte,
//     "tongtientruocthue5nte": tongtientruocthue5Nte == null ? null : tongtientruocthue5Nte,
//     "tongtientruocthue0nte": tongtientruocthue0Nte == null ? null : tongtientruocthue0Nte,
//     "tongtientruocthuekchiuthuente": tongtientruocthuekchiuthuente == null ? null : tongtientruocthuekchiuthuente,
//     "tongtientruocthuemienthuente": tongtientruocthuemienthuente == null ? null : tongtientruocthuemienthuente,
//     "tongtientruocthuethuekhacnte": tongtientruocthuethuekhacnte == null ? null : tongtientruocthuethuekhacnte,
//     "tongtientruocthue10vnd": tongtientruocthue10Vnd == null ? null : tongtientruocthue10Vnd,
//     "tongtientruocthue5vnd": tongtientruocthue5Vnd == null ? null : tongtientruocthue5Vnd,
//     "tongtientruocthue0vnd": tongtientruocthue0Vnd == null ? null : tongtientruocthue0Vnd,
//     "tongtientruocthuekchiuthuevnd": tongtientruocthuekchiuthuevnd == null ? null : tongtientruocthuekchiuthuevnd,
//     "tongtientruocthuemienthuevnd": tongtientruocthuemienthuevnd == null ? null : tongtientruocthuemienthuevnd,
//     "tongtientruocthuethuekhacvnd": tongtientruocthuethuekhacvnd == null ? null : tongtientruocthuethuekhacvnd,
//     "tongtiensauthue10nte": tongtiensauthue10Nte == null ? null : tongtiensauthue10Nte,
//     "tongtiensauthue5nte": tongtiensauthue5Nte == null ? null : tongtiensauthue5Nte,
//     "tongtiensauthue0nte": tongtiensauthue0Nte == null ? null : tongtiensauthue0Nte,
//     "tongtiensauthuekchiuthuente": tongtiensauthuekchiuthuente == null ? null : tongtiensauthuekchiuthuente,
//     "tongtiensauthuemienthuevnd": tongtiensauthuemienthuevnd == null ? null : tongtiensauthuemienthuevnd,
//     "tongtiensauthuethuekhacvnd": tongtiensauthuethuekhacvnd == null ? null : tongtiensauthuethuekhacvnd,
//     "tongtiensauthue10vnd": tongtiensauthue10Vnd == null ? null : tongtiensauthue10Vnd,
//     "tongtiensauthue5vnd": tongtiensauthue5Vnd == null ? null : tongtiensauthue5Vnd,
//     "tongtiensauthue0vnd": tongtiensauthue0Vnd == null ? null : tongtiensauthue0Vnd,
//     "tongtiensauthuekchiuthuevnd": tongtiensauthuekchiuthuevnd == null ? null : tongtiensauthuekchiuthuevnd,
//     "tongtiensauthuemienthuente": tongtiensauthuemienthuente == null ? null : tongtiensauthuemienthuente,
//     "tongtiensauthuethuekhacnte": tongtiensauthuethuekhacnte == null ? null : tongtiensauthuethuekhacnte,
//     "update_time": updateTime,
//     "cd_khieuhdon": cdKhieuhdon == null ? null : cdKhieuhdon,
//     "cd_mauhdon": cdMauhdon == null ? null : cdMauhdon,
//     "cd_sohdon": cdSohdon == null ? null : cdSohdon,
//     "hdongiay": hdongiay == null ? null : hdongiay,
//     "tongTienTToanGiay": tongTienTToanGiay == null ? null : tongTienTToanGiay,
//     "tongTienThueGTGTGiay": tongTienThueGtgtGiay == null ? null : tongTienThueGtgtGiay,
//     "hThucHDon": hThucHDon == null ? null : hThucHDon,
//     "kyDienTu": kyDienTu == null ? null : kyDienTu,
//     "fee": fee == null ? null : fee,
//     "fee_vat": feeVat == null ? null : feeVat,
//     "wf_process_id": wfProcessId,
//     "wf_status": wfStatus,
//     "wf_update_time": wfUpdateTime,
//     "status": status == null ? null : status,
//     "loai_dieu_chinh": loaiDieuChinh,
//     "level": level == null ? null : level,
//     "qrcode": qrcode,
//     "lstInvOtherInfoBan": lstInvOtherInfoBan,
//     "lstInvOtherInfoMua": lstInvOtherInfoMua,
//     "lstInvOtherInfoTToan": lstInvOtherInfoTToan,
//     "lstInvOtherInfoLePhiKhac": lstInvOtherInfoLePhiKhac,
//     "lstInvOtherInfoCTHD": lstInvOtherInfoCthd,
//     "tongcongthucxuat": tongcongthucxuat,
//     "is_tt68": isTt68 == null ? null : isTt68,
//     "sign_desc_error": signDescError,
//     "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
//     "sluongdcdd": sluongdcdd == null ? null : sluongdcdd,
//     "sluongdcCopy": sluongdcCopy == null ? null : sluongdcCopy,
//     "checkBanNhap": checkBanNhap,
//     "ngayLapFormat": ngayLapFormat,
//     "corpID": corpId,
//     "hthucHDonGoc": hthucHDonGoc == null ? null : hthucHDonGoc,
//   };
// }
//
// class ThongBaoHdr {
//   ThongBaoHdr({
//     this.id,
//     this.idGoc,
//     this.hThucHDon,
//     this.hdongvchuyen,
//     this.idNguoilap,
//     this.loaitbao,
//     this.ngayhdon,
//     this.maGdich,
//     this.macqt,
//     this.maktra,
//     this.motaloi,
//     this.mstNban,
//     this.ngayduyet,
//     this.ngayhdcqt,
//     this.ngayhdongoc,
//     this.ngayvban,
//     this.nguoiduyet,
//     this.nguoilap,
//     this.nhangnban,
//     this.sohdongoc,
//     this.sotbao,
//     this.sotbaocqt,
//     this.sovban,
//     this.tentbao,
//     this.tkhoannban,
//     this.trangthai,
//     this.contentxml,
//     this.dchinmua,
//     this.tennmua,
//     this.lydodieuchinh,
//     this.tennban,
//     this.dchinban,
//     this.dthoainban,
//     this.faxnban,
//     this.emailnban,
//     this.mstNmua,
//     this.tendvinmua,
//     this.emailnmua,
//     this.dthoainmua,
//     this.tkhoannmua,
//     this.nhangnmua,
//     this.faxnmua,
//     this.tinhChat,
//     this.tencqt,
//     this.matte,
//     this.soLenhDDong,
//     this.ngayDDong,
//     this.nguoiDDong,
//     this.ndDDong,
//     this.nguoivchuyen,
//     this.hDongVchuyen,
//     this.ptienvchuyen,
//     this.tenkxuat,
//     this.tenknhap,
//     this.lydoTchoi,
//     this.kihieu,
//     this.ngayLap,
//     this.tGia,
//     this.thuKhoXuat,
//     this.lyDoXoaBo,
//     this.sohdong,
//     this.kyDienTu,
//     this.ngayhdong,
//     this.updateTime,
//     this.serviceType,
//     this.channelCode,
//     this.status,
//     this.content,
//     this.fee,
//     this.feeVat,
//     this.wfProcessId,
//     this.flagFee,
//     this.dtlTbao,
//     this.pTbaoId,
//     this.sohdoncqtgoc,
//     this.cdMauso,
//     this.cdKihieu,
//     this.hthuchdongoc,
//     this.isTt68,
//     this.flagGiayTuin,
//     this.mauso,
//     this.hdongiay,
//     this.barcode,
//     this.tinhchatgoc,
//     this.messReceived,
//     this.lydodchinh,
//     this.thuKhoNhap,
//     this.tctbao,
//   });
//
//   final int id;
//   final int idGoc;
//   final String hThucHDon;
//   final dynamic hdongvchuyen;
//   final int idNguoilap;
//   final String loaitbao;
//   final dynamic ngayhdon;
//   final String maGdich;
//   final String macqt;
//   final dynamic maktra;
//   final dynamic motaloi;
//   final String mstNban;
//   final dynamic ngayduyet;
//   final dynamic ngayhdcqt;
//   final int ngayhdongoc;
//   final dynamic ngayvban;
//   final dynamic nguoiduyet;
//   final String nguoilap;
//   final dynamic nhangnban;
//   final String sohdongoc;
//   final String sotbao;
//   final dynamic sotbaocqt;
//   final dynamic sovban;
//   final String tentbao;
//   final dynamic tkhoannban;
//   final String trangthai;
//   final String contentxml;
//   final dynamic dchinmua;
//   final dynamic tennmua;
//   final dynamic lydodieuchinh;
//   final dynamic tennban;
//   final dynamic dchinban;
//   final dynamic dthoainban;
//   final dynamic faxnban;
//   final dynamic emailnban;
//   final dynamic mstNmua;
//   final dynamic tendvinmua;
//   final dynamic emailnmua;
//   final dynamic dthoainmua;
//   final dynamic tkhoannmua;
//   final dynamic nhangnmua;
//   final dynamic faxnmua;
//   final String tinhChat;
//   final dynamic tencqt;
//   final dynamic matte;
//   final dynamic soLenhDDong;
//   final dynamic ngayDDong;
//   final dynamic nguoiDDong;
//   final dynamic ndDDong;
//   final dynamic nguoivchuyen;
//   final dynamic hDongVchuyen;
//   final dynamic ptienvchuyen;
//   final dynamic tenkxuat;
//   final dynamic tenknhap;
//   final dynamic lydoTchoi;
//   final String kihieu;
//   final int ngayLap;
//   final dynamic tGia;
//   final dynamic thuKhoXuat;
//   final dynamic lyDoXoaBo;
//   final dynamic sohdong;
//   final String kyDienTu;
//   final dynamic ngayhdong;
//   final dynamic updateTime;
//   final String serviceType;
//   final String channelCode;
//   final String status;
//   final dynamic content;
//   final int fee;
//   final int feeVat;
//   final dynamic wfProcessId;
//   final String flagFee;
//   final dynamic dtlTbao;
//   final int pTbaoId;
//   final dynamic sohdoncqtgoc;
//   final dynamic cdMauso;
//   final dynamic cdKihieu;
//   final dynamic hthuchdongoc;
//   final String isTt68;
//   final String flagGiayTuin;
//   final String mauso;
//   final String hdongiay;
//   final dynamic barcode;
//   final String tinhchatgoc;
//   final dynamic messReceived;
//   final dynamic lydodchinh;
//   final dynamic thuKhoNhap;
//   final String tctbao;
//
//   factory ThongBaoHdr.fromJson(Map<String, dynamic> json) => ThongBaoHdr(
//     id: json["id"] == null ? null : json["id"],
//     idGoc: json["idGoc"] == null ? null : json["idGoc"],
//     hThucHDon: json["hThucHDon"] == null ? null : json["hThucHDon"],
//     hdongvchuyen: json["hdongvchuyen"],
//     idNguoilap: json["idNguoilap"] == null ? null : json["idNguoilap"],
//     loaitbao: json["loaitbao"] == null ? null : json["loaitbao"],
//     ngayhdon: json["ngayhdon"],
//     maGdich: json["maGdich"] == null ? null : json["maGdich"],
//     macqt: json["macqt"] == null ? null : json["macqt"],
//     maktra: json["maktra"],
//     motaloi: json["motaloi"],
//     mstNban: json["mstNban"] == null ? null : json["mstNban"],
//     ngayduyet: json["ngayduyet"],
//     ngayhdcqt: json["ngayhdcqt"],
//     ngayhdongoc: json["ngayhdongoc"] == null ? null : json["ngayhdongoc"],
//     ngayvban: json["ngayvban"],
//     nguoiduyet: json["nguoiduyet"],
//     nguoilap: json["nguoilap"] == null ? null : json["nguoilap"],
//     nhangnban: json["nhangnban"],
//     sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
//     sotbao: json["sotbao"] == null ? null : json["sotbao"],
//     sotbaocqt: json["sotbaocqt"],
//     sovban: json["sovban"],
//     tentbao: json["tentbao"] == null ? null : json["tentbao"],
//     tkhoannban: json["tkhoannban"],
//     trangthai: json["trangthai"] == null ? null : json["trangthai"],
//     contentxml: json["contentxml"] == null ? null : json["contentxml"],
//     dchinmua: json["dchinmua"],
//     tennmua: json["tennmua"],
//     lydodieuchinh: json["lydodieuchinh"],
//     tennban: json["tennban"],
//     dchinban: json["dchinban"],
//     dthoainban: json["dthoainban"],
//     faxnban: json["faxnban"],
//     emailnban: json["emailnban"],
//     mstNmua: json["mstNmua"],
//     tendvinmua: json["tendvinmua"],
//     emailnmua: json["emailnmua"],
//     dthoainmua: json["dthoainmua"],
//     tkhoannmua: json["tkhoannmua"],
//     nhangnmua: json["nhangnmua"],
//     faxnmua: json["faxnmua"],
//     tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
//     tencqt: json["tencqt"],
//     matte: json["matte"],
//     soLenhDDong: json["soLenhDDong"],
//     ngayDDong: json["ngayDDong"],
//     nguoiDDong: json["nguoiDDong"],
//     ndDDong: json["ndDDong"],
//     nguoivchuyen: json["nguoivchuyen"],
//     hDongVchuyen: json["hDongVchuyen"],
//     ptienvchuyen: json["ptienvchuyen"],
//     tenkxuat: json["tenkxuat"],
//     tenknhap: json["tenknhap"],
//     lydoTchoi: json["lydoTchoi"],
//     kihieu: json["kihieu"] == null ? null : json["kihieu"],
//     ngayLap: json["ngayLap"] == null ? null : json["ngayLap"],
//     tGia: json["tGia"],
//     thuKhoXuat: json["thuKhoXuat"],
//     lyDoXoaBo: json["lyDoXoaBo"],
//     sohdong: json["sohdong"],
//     kyDienTu: json["kyDienTu"] == null ? null : json["kyDienTu"],
//     ngayhdong: json["ngayhdong"],
//     updateTime: json["update_time"],
//     serviceType: json["serviceType"] == null ? null : json["serviceType"],
//     channelCode: json["channelCode"] == null ? null : json["channelCode"],
//     status: json["status"] == null ? null : json["status"],
//     content: json["content"],
//     fee: json["fee"] == null ? null : json["fee"],
//     feeVat: json["fee_vat"] == null ? null : json["fee_vat"],
//     wfProcessId: json["wf_process_id"],
//     flagFee: json["flag_fee"] == null ? null : json["flag_fee"],
//     dtlTbao: json["dtlTbao"],
//     pTbaoId: json["p_tbao_id"] == null ? null : json["p_tbao_id"],
//     sohdoncqtgoc: json["sohdoncqtgoc"],
//     cdMauso: json["cd_mauso"],
//     cdKihieu: json["cd_kihieu"],
//     hthuchdongoc: json["hthuchdongoc"],
//     isTt68: json["is_tt68"] == null ? null : json["is_tt68"],
//     flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
//     mauso: json["mauso"] == null ? null : json["mauso"],
//     hdongiay: json["hdongiay"] == null ? null : json["hdongiay"],
//     barcode: json["barcode"],
//     tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
//     messReceived: json["messReceived"],
//     lydodchinh: json["lydodchinh"],
//     thuKhoNhap: json["thuKhoNhap"],
//     tctbao: json["tctbao"] == null ? null : json["tctbao"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "idGoc": idGoc == null ? null : idGoc,
//     "hThucHDon": hThucHDon == null ? null : hThucHDon,
//     "hdongvchuyen": hdongvchuyen,
//     "idNguoilap": idNguoilap == null ? null : idNguoilap,
//     "loaitbao": loaitbao == null ? null : loaitbao,
//     "ngayhdon": ngayhdon,
//     "maGdich": maGdich == null ? null : maGdich,
//     "macqt": macqt == null ? null : macqt,
//     "maktra": maktra,
//     "motaloi": motaloi,
//     "mstNban": mstNban == null ? null : mstNban,
//     "ngayduyet": ngayduyet,
//     "ngayhdcqt": ngayhdcqt,
//     "ngayhdongoc": ngayhdongoc == null ? null : ngayhdongoc,
//     "ngayvban": ngayvban,
//     "nguoiduyet": nguoiduyet,
//     "nguoilap": nguoilap == null ? null : nguoilap,
//     "nhangnban": nhangnban,
//     "sohdongoc": sohdongoc == null ? null : sohdongoc,
//     "sotbao": sotbao == null ? null : sotbao,
//     "sotbaocqt": sotbaocqt,
//     "sovban": sovban,
//     "tentbao": tentbao == null ? null : tentbao,
//     "tkhoannban": tkhoannban,
//     "trangthai": trangthai == null ? null : trangthai,
//     "contentxml": contentxml == null ? null : contentxml,
//     "dchinmua": dchinmua,
//     "tennmua": tennmua,
//     "lydodieuchinh": lydodieuchinh,
//     "tennban": tennban,
//     "dchinban": dchinban,
//     "dthoainban": dthoainban,
//     "faxnban": faxnban,
//     "emailnban": emailnban,
//     "mstNmua": mstNmua,
//     "tendvinmua": tendvinmua,
//     "emailnmua": emailnmua,
//     "dthoainmua": dthoainmua,
//     "tkhoannmua": tkhoannmua,
//     "nhangnmua": nhangnmua,
//     "faxnmua": faxnmua,
//     "tinhChat": tinhChat == null ? null : tinhChat,
//     "tencqt": tencqt,
//     "matte": matte,
//     "soLenhDDong": soLenhDDong,
//     "ngayDDong": ngayDDong,
//     "nguoiDDong": nguoiDDong,
//     "ndDDong": ndDDong,
//     "nguoivchuyen": nguoivchuyen,
//     "hDongVchuyen": hDongVchuyen,
//     "ptienvchuyen": ptienvchuyen,
//     "tenkxuat": tenkxuat,
//     "tenknhap": tenknhap,
//     "lydoTchoi": lydoTchoi,
//     "kihieu": kihieu == null ? null : kihieu,
//     "ngayLap": ngayLap == null ? null : ngayLap,
//     "tGia": tGia,
//     "thuKhoXuat": thuKhoXuat,
//     "lyDoXoaBo": lyDoXoaBo,
//     "sohdong": sohdong,
//     "kyDienTu": kyDienTu == null ? null : kyDienTu,
//     "ngayhdong": ngayhdong,
//     "update_time": updateTime,
//     "serviceType": serviceType == null ? null : serviceType,
//     "channelCode": channelCode == null ? null : channelCode,
//     "status": status == null ? null : status,
//     "content": content,
//     "fee": fee == null ? null : fee,
//     "fee_vat": feeVat == null ? null : feeVat,
//     "wf_process_id": wfProcessId,
//     "flag_fee": flagFee == null ? null : flagFee,
//     "dtlTbao": dtlTbao,
//     "p_tbao_id": pTbaoId == null ? null : pTbaoId,
//     "sohdoncqtgoc": sohdoncqtgoc,
//     "cd_mauso": cdMauso,
//     "cd_kihieu": cdKihieu,
//     "hthuchdongoc": hthuchdongoc,
//     "is_tt68": isTt68 == null ? null : isTt68,
//     "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
//     "mauso": mauso == null ? null : mauso,
//     "hdongiay": hdongiay == null ? null : hdongiay,
//     "barcode": barcode,
//     "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
//     "messReceived": messReceived,
//     "lydodchinh": lydodchinh,
//     "thuKhoNhap": thuKhoNhap,
//     "tctbao": tctbao == null ? null : tctbao,
//   };
// }



// To parse this JSON data, do
//
//     final chiTietThongBaoResponse = chiTietThongBaoResponseFromJson(jsonString);

import 'dart:convert';

ChiTietThongBaoResponse chiTietThongBaoResponseFromJson(String str) => ChiTietThongBaoResponse.fromJson(json.decode(str));

String chiTietThongBaoResponseToJson(ChiTietThongBaoResponse data) => json.encode(data.toJson());

class ChiTietThongBaoResponse {
  ChiTietThongBaoResponse({
    this.thongBaoHdr,
    this.invHdr,
    this.lstInvoiceDtlTbao,
    this.urlViewBody,
    this.htmlViewTBao,
  });

  final ThongBaoHdr thongBaoHdr;
  final InvHdr invHdr;
  final List<LstInvoiceDtlTbao> lstInvoiceDtlTbao;
  final dynamic urlViewBody;
  final dynamic htmlViewTBao;

  factory ChiTietThongBaoResponse.fromJson(Map<String, dynamic> json) => ChiTietThongBaoResponse(
    thongBaoHdr: json["thongBaoHdr"] == null ? null : ThongBaoHdr.fromJson(json["thongBaoHdr"]),
    invHdr: json["invHdr"] == null ? null : InvHdr.fromJson(json["invHdr"]),
    lstInvoiceDtlTbao: json["lstInvoiceDtlTbao"] == null ? null : List<LstInvoiceDtlTbao>.from(json["lstInvoiceDtlTbao"].map((x) => LstInvoiceDtlTbao.fromJson(x))),
    urlViewBody: json["url_viewBody"],
    htmlViewTBao: json["htmlViewTBao"],
  );

  Map<String, dynamic> toJson() => {
    "thongBaoHdr": thongBaoHdr == null ? null : thongBaoHdr.toJson(),
    "invHdr": invHdr == null ? null : invHdr.toJson(),
    "lstInvoiceDtlTbao": lstInvoiceDtlTbao == null ? null : List<dynamic>.from(lstInvoiceDtlTbao.map((x) => x.toJson())),
    "url_viewBody": urlViewBody,
    "htmlViewTBao": htmlViewTBao,
  };
}

class InvHdr {
  InvHdr({
    this.channelCode,
    this.typehdongoc,
    this.serviceType,
    this.lyDoXoaBo,
    this.dchinmua,
    this.dthoainmua,
    this.emailnmua,
    this.faxnmua,
    this.hthuctoan,
    this.hthuctoankhac,
    this.id,
    this.idGoc,
    this.khieuhdon,
    this.loaihdon,
    this.macqt,
    this.tencqt,
    this.maktra,
    this.matte,
    this.mauhdon,
    this.mstNban,
    this.mstNmua,
    this.ngayduyet,
    this.ngayhdcqt,
    this.ngayLap,
    this.ngayhdon,
    this.ngayhdong,
    this.ngayvban,
    this.ngayvbanStr,
    this.nguoiduyet,
    this.nguoilap,
    this.nguoivchuyen,
    this.nhangnmua,
    this.ptienvchuyen,
    this.sohdcqt,
    this.sohdon,
    this.sohdong,
    this.sohdongoc,
    this.ngayCqThdongoc,
    this.sovban,
    this.tendvinmua,
    this.tenhdon,
    this.tenhdong,
    this.tenknhap,
    this.tenkxuat,
    this.tennmua,
    this.tgia,
    this.tgiaStr,
    this.tkhoannmua,
    this.tongtienckhaunte,
    this.tongtienckhauvnd,
    this.tongtiennte,
    this.tongtienttoanbchu,
    this.tongtienttoannte,
    this.tongtienttoannteStr,
    this.tongtienttoanvnd,
    this.tongtienhangtruocthue,
    this.tongtienhangtruocthuevnd,
    this.tongtienttoanvndStr,
    this.tongtienvnd,
    this.trangthai,
    this.tinhChat,
    this.tennban,
    this.dchinban,
    this.dthoainban,
    this.tkhoannban,
    this.nhangnban,
    this.faxnban,
    this.emailnban,
    this.ghiChu,
    this.contentxml,
    this.barcode,
    this.mota,
    this.tongtienthuente,
    this.tongtienthuenteStr,
    this.confirm,
    this.check,
    this.flagFee,
    this.flagGiayTuin,
    this.maKeyGopExcel,
    this.trnRefNo,
    this.relatedCustomer,
    this.uniqueId,
    this.extRef,
    this.tongtienttoanbchuVnd,
    this.branchName,
    this.invoiceKey,
    this.adjustmentInvoice,
    this.sttHdUpload,
    this.mustToSign,
    this.hoadondacthu,
    this.userName,
    this.checkInChuyenDoi,
    this.tongtienthuevnd,
    this.tongtienthuevndStr,
    this.tongthuesuat5Nte,
    this.tongthuesuat5Vnd,
    this.tongthuesuat10Nte,
    this.tongthuesuat10Vnd,
    this.tongthuesuatthuekhacnte,
    this.tongthuesuatthuekhacvnd,
    this.tongthuesuat0Nte,
    this.tongthuesuat0Vnd,
    this.khongchiuthuegtgt,
    this.mienthuegtgt,
    this.thueTang,
    this.thueGiam,
    this.tongTToanTang,
    this.tongTToanGiam,
    this.lyDoDChinh,
    this.tongtienthuedchinhtanggiam,
    this.tongtienttoandchinhtanggiam,
    this.tongtienthuedchinhtanggiamStr,
    this.tongtienttoandchinhtanggiamStr,
    this.pbanxml,
    this.messReceived,
    this.hDongVchuyen,
    this.idNguoilap,
    this.vanId,
    this.lydotuchoi,
    this.detail,
    this.listOfProduct,
    this.soLenhDDong,
    this.ngayDDong,
    this.nguoiDDong,
    this.lDoDDong,
    this.maGdich,
    this.tongtientruocthue10Nte,
    this.tongtientruocthue5Nte,
    this.tongtientruocthue0Nte,
    this.tongtientruocthuekchiuthuente,
    this.tongtientruocthuemienthuente,
    this.tongtientruocthuethuekhacnte,
    this.tongtientruocthue10Vnd,
    this.tongtientruocthue5Vnd,
    this.tongtientruocthue0Vnd,
    this.tongtientruocthuekchiuthuevnd,
    this.tongtientruocthuemienthuevnd,
    this.tongtientruocthuethuekhacvnd,
    this.tongtiensauthue10Nte,
    this.tongtiensauthue5Nte,
    this.tongtiensauthue0Nte,
    this.tongtiensauthuekchiuthuente,
    this.tongtiensauthuemienthuevnd,
    this.tongtiensauthuethuekhacvnd,
    this.tongtiensauthue10Vnd,
    this.tongtiensauthue5Vnd,
    this.tongtiensauthue0Vnd,
    this.tongtiensauthuekchiuthuevnd,
    this.tongtiensauthuemienthuente,
    this.tongtiensauthuethuekhacnte,
    this.updateTime,
    this.cdKhieuhdon,
    this.cdMauhdon,
    this.cdSohdon,
    this.hdongiay,
    this.tongTienTToanGiay,
    this.tongTienThueGtgtGiay,
    this.hThucHDon,
    this.kyDienTu,
    this.fee,
    this.feeVat,
    this.wfProcessId,
    this.wfStatus,
    this.wfUpdateTime,
    this.status,
    this.loaiDieuChinh,
    this.level,
    this.qrcode,
    this.lstInvOtherInfoBan,
    this.lstInvOtherInfoMua,
    this.lstInvOtherInfoTToan,
    this.lstInvOtherInfoLePhiKhac,
    this.lstInvOtherInfoCthd,
    this.tongcongthucxuat,
    this.isTt68,
    this.signDescError,
    this.tinhchatgoc,
    this.sluongdcdd,
    this.sluongdcCopy,
    this.checkBanNhap,
    this.ngayLapFormat,
    this.corpId,
    this.hthucHDonGoc,
  });

  final String channelCode;
  final String typehdongoc;
  final String serviceType;
  final String lyDoXoaBo;
  final String dchinmua;
  final String dthoainmua;
  final String emailnmua;
  final String faxnmua;
  final String hthuctoan;
  final String hthuctoankhac;
  final int id;
  final int idGoc;
  final String khieuhdon;
  final String loaihdon;
  final String macqt;
  final String tencqt;
  final String maktra;
  final String matte;
  final String mauhdon;
  final String mstNban;
  final String mstNmua;
  final dynamic ngayduyet;
  final dynamic ngayhdcqt;
  final dynamic ngayLap;
  final dynamic ngayhdon;
  final dynamic ngayhdong;
  final dynamic ngayvban;
  final String ngayvbanStr;
  final String nguoiduyet;
  final String nguoilap;
  final String nguoivchuyen;
  final String nhangnmua;
  final String ptienvchuyen;
  final String sohdcqt;
  final String sohdon;
  final String sohdong;
  final String sohdongoc;
  final String ngayCqThdongoc;
  final String sovban;
  final String tendvinmua;
  final String tenhdon;
  final String tenhdong;
  final String tenknhap;
  final String tenkxuat;
  final String tennmua;
  final dynamic tgia;
  final String tgiaStr;
  final String tkhoannmua;
  final int tongtienckhaunte;
  final int tongtienckhauvnd;
  final int tongtiennte;
  final String tongtienttoanbchu;
  final int tongtienttoannte;
  final String tongtienttoannteStr;
  final int tongtienttoanvnd;
  final int tongtienhangtruocthue;
  final int tongtienhangtruocthuevnd;
  final String tongtienttoanvndStr;
  final int tongtienvnd;
  final String trangthai;
  final String tinhChat;
  final String tennban;
  final String dchinban;
  final String dthoainban;
  final String tkhoannban;
  final String nhangnban;
  final String faxnban;
  final String emailnban;
  final String ghiChu;
  final dynamic contentxml;
  final String barcode;
  final String mota;
  final int tongtienthuente;
  final String tongtienthuenteStr;
  final String confirm;
  final String check;
  final String flagFee;
  final String flagGiayTuin;
  final dynamic maKeyGopExcel;
  final dynamic trnRefNo;
  final dynamic relatedCustomer;
  final dynamic uniqueId;
  final dynamic extRef;
  final String tongtienttoanbchuVnd;
  final dynamic branchName;
  final dynamic invoiceKey;
  final dynamic adjustmentInvoice;
  final dynamic sttHdUpload;
  final dynamic mustToSign;
  final dynamic hoadondacthu;
  final dynamic userName;
  final dynamic checkInChuyenDoi;
  final int tongtienthuevnd;
  final String tongtienthuevndStr;
  final int tongthuesuat5Nte;
  final int tongthuesuat5Vnd;
  final int tongthuesuat10Nte;
  final int tongthuesuat10Vnd;
  final int tongthuesuatthuekhacnte;
  final int tongthuesuatthuekhacvnd;
  final int tongthuesuat0Nte;
  final int tongthuesuat0Vnd;
  final int khongchiuthuegtgt;
  final int mienthuegtgt;
  final int thueTang;
  final int thueGiam;
  final int tongTToanTang;
  final int tongTToanGiam;
  final String lyDoDChinh;
  final int tongtienthuedchinhtanggiam;
  final int tongtienttoandchinhtanggiam;
  final dynamic tongtienthuedchinhtanggiamStr;
  final dynamic tongtienttoandchinhtanggiamStr;
  final String pbanxml;
  final String messReceived;
  final String hDongVchuyen;
  final int idNguoilap;
  final String vanId;
  final String lydotuchoi;
  final dynamic detail;
  final dynamic listOfProduct;
  final String soLenhDDong;
  final dynamic ngayDDong;
  final String nguoiDDong;
  final String lDoDDong;
  final String maGdich;
  final int tongtientruocthue10Nte;
  final int tongtientruocthue5Nte;
  final int tongtientruocthue0Nte;
  final int tongtientruocthuekchiuthuente;
  final int tongtientruocthuemienthuente;
  final int tongtientruocthuethuekhacnte;
  final int tongtientruocthue10Vnd;
  final int tongtientruocthue5Vnd;
  final int tongtientruocthue0Vnd;
  final int tongtientruocthuekchiuthuevnd;
  final int tongtientruocthuemienthuevnd;
  final int tongtientruocthuethuekhacvnd;
  final int tongtiensauthue10Nte;
  final int tongtiensauthue5Nte;
  final int tongtiensauthue0Nte;
  final int tongtiensauthuekchiuthuente;
  final int tongtiensauthuemienthuevnd;
  final int tongtiensauthuethuekhacvnd;
  final int tongtiensauthue10Vnd;
  final int tongtiensauthue5Vnd;
  final int tongtiensauthue0Vnd;
  final int tongtiensauthuekchiuthuevnd;
  final int tongtiensauthuemienthuente;
  final int tongtiensauthuethuekhacnte;
  final dynamic updateTime;
  final String cdKhieuhdon;
  final String cdMauhdon;
  final String cdSohdon;
  final String hdongiay;
  final int tongTienTToanGiay;
  final int tongTienThueGtgtGiay;
  final String hThucHDon;
  final String kyDienTu;
  final int fee;
  final int feeVat;
  final dynamic wfProcessId;
  final dynamic wfStatus;
  final dynamic wfUpdateTime;
  final String status;
  final dynamic loaiDieuChinh;
  final int level;
  final dynamic qrcode;
  final dynamic lstInvOtherInfoBan;
  final dynamic lstInvOtherInfoMua;
  final dynamic lstInvOtherInfoTToan;
  final dynamic lstInvOtherInfoLePhiKhac;
  final dynamic lstInvOtherInfoCthd;
  final dynamic tongcongthucxuat;
  final dynamic isTt68;
  final dynamic signDescError;
  final String tinhchatgoc;
  final int sluongdcdd;
  final int sluongdcCopy;
  final dynamic checkBanNhap;
  final dynamic ngayLapFormat;
  final dynamic corpId;
  final String hthucHDonGoc;

  factory InvHdr.fromJson(Map<String, dynamic> json) => InvHdr(
    channelCode: json["channelCode"] == null ? null : json["channelCode"],
    typehdongoc: json["typehdongoc"] == null ? null : json["typehdongoc"],
    serviceType: json["serviceType"] == null ? null : json["serviceType"],
    lyDoXoaBo: json["lyDoXoaBo"] == null ? null : json["lyDoXoaBo"],
    dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
    dthoainmua: json["dthoainmua"] == null ? null : json["dthoainmua"],
    emailnmua: json["emailnmua"] == null ? null : json["emailnmua"],
    faxnmua: json["faxnmua"] == null ? null : json["faxnmua"],
    hthuctoan: json["hthuctoan"] == null ? null : json["hthuctoan"],
    hthuctoankhac: json["hthuctoankhac"] == null ? null : json["hthuctoankhac"],
    id: json["id"] == null ? null : json["id"],
    idGoc: json["idGoc"] == null ? null : json["idGoc"],
    khieuhdon: json["khieuhdon"] == null ? null : json["khieuhdon"],
    loaihdon: json["loaihdon"] == null ? null : json["loaihdon"],
    macqt: json["macqt"] == null ? null : json["macqt"],
    tencqt: json["tencqt"] == null ? null : json["tencqt"],
    maktra: json["maktra"] == null ? null : json["maktra"],
    matte: json["matte"] == null ? null : json["matte"],
    mauhdon: json["mauhdon"] == null ? null : json["mauhdon"],
    mstNban: json["mstNban"] == null ? null : json["mstNban"],
    mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
    ngayduyet: json["ngayduyet"],
    ngayhdcqt: json["ngayhdcqt"],
    ngayLap: json["ngayLap"],
    ngayhdon: json["ngayhdon"],
    ngayhdong: json["ngayhdong"],
    ngayvban: json["ngayvban"],
    ngayvbanStr: json["ngayvbanStr"] == null ? null : json["ngayvbanStr"],
    nguoiduyet: json["nguoiduyet"] == null ? null : json["nguoiduyet"],
    nguoilap: json["nguoilap"] == null ? null : json["nguoilap"],
    nguoivchuyen: json["nguoivchuyen"] == null ? null : json["nguoivchuyen"],
    nhangnmua: json["nhangnmua"] == null ? null : json["nhangnmua"],
    ptienvchuyen: json["ptienvchuyen"] == null ? null : json["ptienvchuyen"],
    sohdcqt: json["sohdcqt"] == null ? null : json["sohdcqt"],
    sohdon: json["sohdon"] == null ? null : json["sohdon"],
    sohdong: json["sohdong"] == null ? null : json["sohdong"],
    sohdongoc: json["sohdongoc"] == null ? null : json["sohdongoc"],
    ngayCqThdongoc: json["ngayCQThdongoc"] == null ? null : json["ngayCQThdongoc"],
    sovban: json["sovban"] == null ? null : json["sovban"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    tenhdon: json["tenhdon"] == null ? null : json["tenhdon"],
    tenhdong: json["tenhdong"] == null ? null : json["tenhdong"],
    tenknhap: json["tenknhap"] == null ? null : json["tenknhap"],
    tenkxuat: json["tenkxuat"] == null ? null : json["tenkxuat"],
    tennmua: json["tennmua"] == null ? null : json["tennmua"],
    tgia: json["tgia"],
    tgiaStr: json["tgiaStr"] == null ? null : json["tgiaStr"],
    tkhoannmua: json["tkhoannmua"] == null ? null : json["tkhoannmua"],
    tongtienckhaunte: json["tongtienckhaunte"] == null ? null : json["tongtienckhaunte"],
    tongtienckhauvnd: json["tongtienckhauvnd"] == null ? null : json["tongtienckhauvnd"],
    tongtiennte: json["tongtiennte"] == null ? null : json["tongtiennte"],
    tongtienttoanbchu: json["tongtienttoanbchu"] == null ? null : json["tongtienttoanbchu"],
    tongtienttoannte: json["tongtienttoannte"] == null ? null : json["tongtienttoannte"],
    tongtienttoannteStr: json["tongtienttoannteStr"] == null ? null : json["tongtienttoannteStr"],
    tongtienttoanvnd: json["tongtienttoanvnd"] == null ? null : json["tongtienttoanvnd"],
    tongtienhangtruocthue: json["tongtienhangtruocthue"] == null ? null : json["tongtienhangtruocthue"],
    tongtienhangtruocthuevnd: json["tongtienhangtruocthuevnd"] == null ? null : json["tongtienhangtruocthuevnd"],
    tongtienttoanvndStr: json["tongtienttoanvndStr"] == null ? null : json["tongtienttoanvndStr"],
    tongtienvnd: json["tongtienvnd"] == null ? null : json["tongtienvnd"],
    trangthai: json["trangthai"] == null ? null : json["trangthai"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    tennban: json["tennban"] == null ? null : json["tennban"],
    dchinban: json["dchinban"] == null ? null : json["dchinban"],
    dthoainban: json["dthoainban"] == null ? null : json["dthoainban"],
    tkhoannban: json["tkhoannban"] == null ? null : json["tkhoannban"],
    nhangnban: json["nhangnban"] == null ? null : json["nhangnban"],
    faxnban: json["faxnban"] == null ? null : json["faxnban"],
    emailnban: json["emailnban"] == null ? null : json["emailnban"],
    ghiChu: json["ghiChu"] == null ? null : json["ghiChu"],
    contentxml: json["contentxml"],
    barcode: json["barcode"] == null ? null : json["barcode"],
    mota: json["mota"] == null ? null : json["mota"],
    tongtienthuente: json["tongtienthuente"] == null ? null : json["tongtienthuente"],
    tongtienthuenteStr: json["tongtienthuenteStr"] == null ? null : json["tongtienthuenteStr"],
    confirm: json["confirm"] == null ? null : json["confirm"],
    check: json["check"] == null ? null : json["check"],
    flagFee: json["flag_fee"] == null ? null : json["flag_fee"],
    flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
    maKeyGopExcel: json["maKeyGopExcel"],
    trnRefNo: json["trn_ref_no"],
    relatedCustomer: json["related_customer"],
    uniqueId: json["unique_id"],
    extRef: json["ext_ref"],
    tongtienttoanbchuVnd: json["tongtienttoanbchu_vnd"] == null ? null : json["tongtienttoanbchu_vnd"],
    branchName: json["branch_name"],
    invoiceKey: json["invoice_key"],
    adjustmentInvoice: json["adjustmentInvoice"],
    sttHdUpload: json["sttHDUpload"],
    mustToSign: json["must_to_sign"],
    hoadondacthu: json["hoadondacthu"],
    userName: json["user_name"],
    checkInChuyenDoi: json["checkInChuyenDoi"],
    tongtienthuevnd: json["tongtienthuevnd"] == null ? null : json["tongtienthuevnd"],
    tongtienthuevndStr: json["tongtienthuevndStr"] == null ? null : json["tongtienthuevndStr"],
    tongthuesuat5Nte: json["tongthuesuat5nte"] == null ? null : json["tongthuesuat5nte"],
    tongthuesuat5Vnd: json["tongthuesuat5vnd"] == null ? null : json["tongthuesuat5vnd"],
    tongthuesuat10Nte: json["tongthuesuat10nte"] == null ? null : json["tongthuesuat10nte"],
    tongthuesuat10Vnd: json["tongthuesuat10vnd"] == null ? null : json["tongthuesuat10vnd"],
    tongthuesuatthuekhacnte: json["tongthuesuatthuekhacnte"] == null ? null : json["tongthuesuatthuekhacnte"],
    tongthuesuatthuekhacvnd: json["tongthuesuatthuekhacvnd"] == null ? null : json["tongthuesuatthuekhacvnd"],
    tongthuesuat0Nte: json["tongthuesuat0nte"] == null ? null : json["tongthuesuat0nte"],
    tongthuesuat0Vnd: json["tongthuesuat0vnd"] == null ? null : json["tongthuesuat0vnd"],
    khongchiuthuegtgt: json["khongchiuthuegtgt"] == null ? null : json["khongchiuthuegtgt"],
    mienthuegtgt: json["mienthuegtgt"] == null ? null : json["mienthuegtgt"],
    thueTang: json["thueTang"] == null ? null : json["thueTang"],
    thueGiam: json["thueGiam"] == null ? null : json["thueGiam"],
    tongTToanTang: json["tongTToanTang"] == null ? null : json["tongTToanTang"],
    tongTToanGiam: json["tongTToanGiam"] == null ? null : json["tongTToanGiam"],
    lyDoDChinh: json["lyDoDChinh"] == null ? null : json["lyDoDChinh"],
    tongtienthuedchinhtanggiam: json["tongtienthuedchinhtanggiam"] == null ? null : json["tongtienthuedchinhtanggiam"],
    tongtienttoandchinhtanggiam: json["tongtienttoandchinhtanggiam"] == null ? null : json["tongtienttoandchinhtanggiam"],
    tongtienthuedchinhtanggiamStr: json["tongtienthuedchinhtanggiamStr"],
    tongtienttoandchinhtanggiamStr: json["tongtienttoandchinhtanggiamStr"],
    pbanxml: json["pbanxml"] == null ? null : json["pbanxml"],
    messReceived: json["messReceived"] == null ? null : json["messReceived"],
    hDongVchuyen: json["hDongVchuyen"] == null ? null : json["hDongVchuyen"],
    idNguoilap: json["id_nguoilap"] == null ? null : json["id_nguoilap"],
    vanId: json["van_id"] == null ? null : json["van_id"],
    lydotuchoi: json["lydotuchoi"] == null ? null : json["lydotuchoi"],
    detail: json["detail"],
    listOfProduct: json["listOfProduct"],
    soLenhDDong: json["soLenhDDong"] == null ? null : json["soLenhDDong"],
    ngayDDong: json["ngayDDong"],
    nguoiDDong: json["nguoiDDong"] == null ? null : json["nguoiDDong"],
    lDoDDong: json["lDoDDong"] == null ? null : json["lDoDDong"],
    maGdich: json["ma_gdich"] == null ? null : json["ma_gdich"],
    tongtientruocthue10Nte: json["tongtientruocthue10nte"] == null ? null : json["tongtientruocthue10nte"],
    tongtientruocthue5Nte: json["tongtientruocthue5nte"] == null ? null : json["tongtientruocthue5nte"],
    tongtientruocthue0Nte: json["tongtientruocthue0nte"] == null ? null : json["tongtientruocthue0nte"],
    tongtientruocthuekchiuthuente: json["tongtientruocthuekchiuthuente"] == null ? null : json["tongtientruocthuekchiuthuente"],
    tongtientruocthuemienthuente: json["tongtientruocthuemienthuente"] == null ? null : json["tongtientruocthuemienthuente"],
    tongtientruocthuethuekhacnte: json["tongtientruocthuethuekhacnte"] == null ? null : json["tongtientruocthuethuekhacnte"],
    tongtientruocthue10Vnd: json["tongtientruocthue10vnd"] == null ? null : json["tongtientruocthue10vnd"],
    tongtientruocthue5Vnd: json["tongtientruocthue5vnd"] == null ? null : json["tongtientruocthue5vnd"],
    tongtientruocthue0Vnd: json["tongtientruocthue0vnd"] == null ? null : json["tongtientruocthue0vnd"],
    tongtientruocthuekchiuthuevnd: json["tongtientruocthuekchiuthuevnd"] == null ? null : json["tongtientruocthuekchiuthuevnd"],
    tongtientruocthuemienthuevnd: json["tongtientruocthuemienthuevnd"] == null ? null : json["tongtientruocthuemienthuevnd"],
    tongtientruocthuethuekhacvnd: json["tongtientruocthuethuekhacvnd"] == null ? null : json["tongtientruocthuethuekhacvnd"],
    tongtiensauthue10Nte: json["tongtiensauthue10nte"] == null ? null : json["tongtiensauthue10nte"],
    tongtiensauthue5Nte: json["tongtiensauthue5nte"] == null ? null : json["tongtiensauthue5nte"],
    tongtiensauthue0Nte: json["tongtiensauthue0nte"] == null ? null : json["tongtiensauthue0nte"],
    tongtiensauthuekchiuthuente: json["tongtiensauthuekchiuthuente"] == null ? null : json["tongtiensauthuekchiuthuente"],
    tongtiensauthuemienthuevnd: json["tongtiensauthuemienthuevnd"] == null ? null : json["tongtiensauthuemienthuevnd"],
    tongtiensauthuethuekhacvnd: json["tongtiensauthuethuekhacvnd"] == null ? null : json["tongtiensauthuethuekhacvnd"],
    tongtiensauthue10Vnd: json["tongtiensauthue10vnd"] == null ? null : json["tongtiensauthue10vnd"],
    tongtiensauthue5Vnd: json["tongtiensauthue5vnd"] == null ? null : json["tongtiensauthue5vnd"],
    tongtiensauthue0Vnd: json["tongtiensauthue0vnd"] == null ? null : json["tongtiensauthue0vnd"],
    tongtiensauthuekchiuthuevnd: json["tongtiensauthuekchiuthuevnd"] == null ? null : json["tongtiensauthuekchiuthuevnd"],
    tongtiensauthuemienthuente: json["tongtiensauthuemienthuente"] == null ? null : json["tongtiensauthuemienthuente"],
    tongtiensauthuethuekhacnte: json["tongtiensauthuethuekhacnte"] == null ? null : json["tongtiensauthuethuekhacnte"],
    updateTime: json["update_time"],
    cdKhieuhdon: json["cd_khieuhdon"] == null ? null : json["cd_khieuhdon"],
    cdMauhdon: json["cd_mauhdon"] == null ? null : json["cd_mauhdon"],
    cdSohdon: json["cd_sohdon"] == null ? null : json["cd_sohdon"],
    hdongiay: json["hdongiay"] == null ? null : json["hdongiay"],
    tongTienTToanGiay: json["tongTienTToanGiay"] == null ? null : json["tongTienTToanGiay"],
    tongTienThueGtgtGiay: json["tongTienThueGTGTGiay"] == null ? null : json["tongTienThueGTGTGiay"],
    hThucHDon: json["hThucHDon"] == null ? null : json["hThucHDon"],
    kyDienTu: json["kyDienTu"] == null ? null : json["kyDienTu"],
    fee: json["fee"] == null ? null : json["fee"],
    feeVat: json["fee_vat"] == null ? null : json["fee_vat"],
    wfProcessId: json["wf_process_id"],
    wfStatus: json["wf_status"],
    wfUpdateTime: json["wf_update_time"],
    status: json["status"] == null ? null : json["status"],
    loaiDieuChinh: json["loai_dieu_chinh"],
    level: json["level"] == null ? null : json["level"],
    qrcode: json["qrcode"],
    lstInvOtherInfoBan: json["lstInvOtherInfoBan"],
    lstInvOtherInfoMua: json["lstInvOtherInfoMua"],
    lstInvOtherInfoTToan: json["lstInvOtherInfoTToan"],
    lstInvOtherInfoLePhiKhac: json["lstInvOtherInfoLePhiKhac"],
    lstInvOtherInfoCthd: json["lstInvOtherInfoCTHD"],
    tongcongthucxuat: json["tongcongthucxuat"],
    isTt68: json["is_tt68"],
    signDescError: json["sign_desc_error"],
    tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
    sluongdcdd: json["sluongdcdd"] == null ? null : json["sluongdcdd"],
    sluongdcCopy: json["sluongdcCopy"] == null ? null : json["sluongdcCopy"],
    checkBanNhap: json["checkBanNhap"],
    ngayLapFormat: json["ngayLapFormat"],
    corpId: json["corpID"],
    hthucHDonGoc: json["hthucHDonGoc"] == null ? null : json["hthucHDonGoc"],
  );

  Map<String, dynamic> toJson() => {
    "channelCode": channelCode == null ? null : channelCode,
    "typehdongoc": typehdongoc == null ? null : typehdongoc,
    "serviceType": serviceType == null ? null : serviceType,
    "lyDoXoaBo": lyDoXoaBo == null ? null : lyDoXoaBo,
    "dchinmua": dchinmua == null ? null : dchinmua,
    "dthoainmua": dthoainmua == null ? null : dthoainmua,
    "emailnmua": emailnmua == null ? null : emailnmua,
    "faxnmua": faxnmua == null ? null : faxnmua,
    "hthuctoan": hthuctoan == null ? null : hthuctoan,
    "hthuctoankhac": hthuctoankhac == null ? null : hthuctoankhac,
    "id": id == null ? null : id,
    "idGoc": idGoc == null ? null : idGoc,
    "khieuhdon": khieuhdon == null ? null : khieuhdon,
    "loaihdon": loaihdon == null ? null : loaihdon,
    "macqt": macqt == null ? null : macqt,
    "tencqt": tencqt == null ? null : tencqt,
    "maktra": maktra == null ? null : maktra,
    "matte": matte == null ? null : matte,
    "mauhdon": mauhdon == null ? null : mauhdon,
    "mstNban": mstNban == null ? null : mstNban,
    "mstNmua": mstNmua == null ? null : mstNmua,
    "ngayduyet": ngayduyet,
    "ngayhdcqt": ngayhdcqt,
    "ngayLap": ngayLap,
    "ngayhdon": ngayhdon,
    "ngayhdong": ngayhdong,
    "ngayvban": ngayvban,
    "ngayvbanStr": ngayvbanStr == null ? null : ngayvbanStr,
    "nguoiduyet": nguoiduyet == null ? null : nguoiduyet,
    "nguoilap": nguoilap == null ? null : nguoilap,
    "nguoivchuyen": nguoivchuyen == null ? null : nguoivchuyen,
    "nhangnmua": nhangnmua == null ? null : nhangnmua,
    "ptienvchuyen": ptienvchuyen == null ? null : ptienvchuyen,
    "sohdcqt": sohdcqt == null ? null : sohdcqt,
    "sohdon": sohdon == null ? null : sohdon,
    "sohdong": sohdong == null ? null : sohdong,
    "sohdongoc": sohdongoc == null ? null : sohdongoc,
    "ngayCQThdongoc": ngayCqThdongoc == null ? null : ngayCqThdongoc,
    "sovban": sovban == null ? null : sovban,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "tenhdon": tenhdon == null ? null : tenhdon,
    "tenhdong": tenhdong == null ? null : tenhdong,
    "tenknhap": tenknhap == null ? null : tenknhap,
    "tenkxuat": tenkxuat == null ? null : tenkxuat,
    "tennmua": tennmua == null ? null : tennmua,
    "tgia": tgia,
    "tgiaStr": tgiaStr == null ? null : tgiaStr,
    "tkhoannmua": tkhoannmua == null ? null : tkhoannmua,
    "tongtienckhaunte": tongtienckhaunte == null ? null : tongtienckhaunte,
    "tongtienckhauvnd": tongtienckhauvnd == null ? null : tongtienckhauvnd,
    "tongtiennte": tongtiennte == null ? null : tongtiennte,
    "tongtienttoanbchu": tongtienttoanbchu == null ? null : tongtienttoanbchu,
    "tongtienttoannte": tongtienttoannte == null ? null : tongtienttoannte,
    "tongtienttoannteStr": tongtienttoannteStr == null ? null : tongtienttoannteStr,
    "tongtienttoanvnd": tongtienttoanvnd == null ? null : tongtienttoanvnd,
    "tongtienhangtruocthue": tongtienhangtruocthue == null ? null : tongtienhangtruocthue,
    "tongtienhangtruocthuevnd": tongtienhangtruocthuevnd == null ? null : tongtienhangtruocthuevnd,
    "tongtienttoanvndStr": tongtienttoanvndStr == null ? null : tongtienttoanvndStr,
    "tongtienvnd": tongtienvnd == null ? null : tongtienvnd,
    "trangthai": trangthai == null ? null : trangthai,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "tennban": tennban == null ? null : tennban,
    "dchinban": dchinban == null ? null : dchinban,
    "dthoainban": dthoainban == null ? null : dthoainban,
    "tkhoannban": tkhoannban == null ? null : tkhoannban,
    "nhangnban": nhangnban == null ? null : nhangnban,
    "faxnban": faxnban == null ? null : faxnban,
    "emailnban": emailnban == null ? null : emailnban,
    "ghiChu": ghiChu == null ? null : ghiChu,
    "contentxml": contentxml,
    "barcode": barcode == null ? null : barcode,
    "mota": mota == null ? null : mota,
    "tongtienthuente": tongtienthuente == null ? null : tongtienthuente,
    "tongtienthuenteStr": tongtienthuenteStr == null ? null : tongtienthuenteStr,
    "confirm": confirm == null ? null : confirm,
    "check": check == null ? null : check,
    "flag_fee": flagFee == null ? null : flagFee,
    "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
    "maKeyGopExcel": maKeyGopExcel,
    "trn_ref_no": trnRefNo,
    "related_customer": relatedCustomer,
    "unique_id": uniqueId,
    "ext_ref": extRef,
    "tongtienttoanbchu_vnd": tongtienttoanbchuVnd == null ? null : tongtienttoanbchuVnd,
    "branch_name": branchName,
    "invoice_key": invoiceKey,
    "adjustmentInvoice": adjustmentInvoice,
    "sttHDUpload": sttHdUpload,
    "must_to_sign": mustToSign,
    "hoadondacthu": hoadondacthu,
    "user_name": userName,
    "checkInChuyenDoi": checkInChuyenDoi,
    "tongtienthuevnd": tongtienthuevnd == null ? null : tongtienthuevnd,
    "tongtienthuevndStr": tongtienthuevndStr == null ? null : tongtienthuevndStr,
    "tongthuesuat5nte": tongthuesuat5Nte == null ? null : tongthuesuat5Nte,
    "tongthuesuat5vnd": tongthuesuat5Vnd == null ? null : tongthuesuat5Vnd,
    "tongthuesuat10nte": tongthuesuat10Nte == null ? null : tongthuesuat10Nte,
    "tongthuesuat10vnd": tongthuesuat10Vnd == null ? null : tongthuesuat10Vnd,
    "tongthuesuatthuekhacnte": tongthuesuatthuekhacnte == null ? null : tongthuesuatthuekhacnte,
    "tongthuesuatthuekhacvnd": tongthuesuatthuekhacvnd == null ? null : tongthuesuatthuekhacvnd,
    "tongthuesuat0nte": tongthuesuat0Nte == null ? null : tongthuesuat0Nte,
    "tongthuesuat0vnd": tongthuesuat0Vnd == null ? null : tongthuesuat0Vnd,
    "khongchiuthuegtgt": khongchiuthuegtgt == null ? null : khongchiuthuegtgt,
    "mienthuegtgt": mienthuegtgt == null ? null : mienthuegtgt,
    "thueTang": thueTang == null ? null : thueTang,
    "thueGiam": thueGiam == null ? null : thueGiam,
    "tongTToanTang": tongTToanTang == null ? null : tongTToanTang,
    "tongTToanGiam": tongTToanGiam == null ? null : tongTToanGiam,
    "lyDoDChinh": lyDoDChinh == null ? null : lyDoDChinh,
    "tongtienthuedchinhtanggiam": tongtienthuedchinhtanggiam == null ? null : tongtienthuedchinhtanggiam,
    "tongtienttoandchinhtanggiam": tongtienttoandchinhtanggiam == null ? null : tongtienttoandchinhtanggiam,
    "tongtienthuedchinhtanggiamStr": tongtienthuedchinhtanggiamStr,
    "tongtienttoandchinhtanggiamStr": tongtienttoandchinhtanggiamStr,
    "pbanxml": pbanxml == null ? null : pbanxml,
    "messReceived": messReceived == null ? null : messReceived,
    "hDongVchuyen": hDongVchuyen == null ? null : hDongVchuyen,
    "id_nguoilap": idNguoilap == null ? null : idNguoilap,
    "van_id": vanId == null ? null : vanId,
    "lydotuchoi": lydotuchoi == null ? null : lydotuchoi,
    "detail": detail,
    "listOfProduct": listOfProduct,
    "soLenhDDong": soLenhDDong == null ? null : soLenhDDong,
    "ngayDDong": ngayDDong,
    "nguoiDDong": nguoiDDong == null ? null : nguoiDDong,
    "lDoDDong": lDoDDong == null ? null : lDoDDong,
    "ma_gdich": maGdich == null ? null : maGdich,
    "tongtientruocthue10nte": tongtientruocthue10Nte == null ? null : tongtientruocthue10Nte,
    "tongtientruocthue5nte": tongtientruocthue5Nte == null ? null : tongtientruocthue5Nte,
    "tongtientruocthue0nte": tongtientruocthue0Nte == null ? null : tongtientruocthue0Nte,
    "tongtientruocthuekchiuthuente": tongtientruocthuekchiuthuente == null ? null : tongtientruocthuekchiuthuente,
    "tongtientruocthuemienthuente": tongtientruocthuemienthuente == null ? null : tongtientruocthuemienthuente,
    "tongtientruocthuethuekhacnte": tongtientruocthuethuekhacnte == null ? null : tongtientruocthuethuekhacnte,
    "tongtientruocthue10vnd": tongtientruocthue10Vnd == null ? null : tongtientruocthue10Vnd,
    "tongtientruocthue5vnd": tongtientruocthue5Vnd == null ? null : tongtientruocthue5Vnd,
    "tongtientruocthue0vnd": tongtientruocthue0Vnd == null ? null : tongtientruocthue0Vnd,
    "tongtientruocthuekchiuthuevnd": tongtientruocthuekchiuthuevnd == null ? null : tongtientruocthuekchiuthuevnd,
    "tongtientruocthuemienthuevnd": tongtientruocthuemienthuevnd == null ? null : tongtientruocthuemienthuevnd,
    "tongtientruocthuethuekhacvnd": tongtientruocthuethuekhacvnd == null ? null : tongtientruocthuethuekhacvnd,
    "tongtiensauthue10nte": tongtiensauthue10Nte == null ? null : tongtiensauthue10Nte,
    "tongtiensauthue5nte": tongtiensauthue5Nte == null ? null : tongtiensauthue5Nte,
    "tongtiensauthue0nte": tongtiensauthue0Nte == null ? null : tongtiensauthue0Nte,
    "tongtiensauthuekchiuthuente": tongtiensauthuekchiuthuente == null ? null : tongtiensauthuekchiuthuente,
    "tongtiensauthuemienthuevnd": tongtiensauthuemienthuevnd == null ? null : tongtiensauthuemienthuevnd,
    "tongtiensauthuethuekhacvnd": tongtiensauthuethuekhacvnd == null ? null : tongtiensauthuethuekhacvnd,
    "tongtiensauthue10vnd": tongtiensauthue10Vnd == null ? null : tongtiensauthue10Vnd,
    "tongtiensauthue5vnd": tongtiensauthue5Vnd == null ? null : tongtiensauthue5Vnd,
    "tongtiensauthue0vnd": tongtiensauthue0Vnd == null ? null : tongtiensauthue0Vnd,
    "tongtiensauthuekchiuthuevnd": tongtiensauthuekchiuthuevnd == null ? null : tongtiensauthuekchiuthuevnd,
    "tongtiensauthuemienthuente": tongtiensauthuemienthuente == null ? null : tongtiensauthuemienthuente,
    "tongtiensauthuethuekhacnte": tongtiensauthuethuekhacnte == null ? null : tongtiensauthuethuekhacnte,
    "update_time": updateTime,
    "cd_khieuhdon": cdKhieuhdon == null ? null : cdKhieuhdon,
    "cd_mauhdon": cdMauhdon == null ? null : cdMauhdon,
    "cd_sohdon": cdSohdon == null ? null : cdSohdon,
    "hdongiay": hdongiay == null ? null : hdongiay,
    "tongTienTToanGiay": tongTienTToanGiay == null ? null : tongTienTToanGiay,
    "tongTienThueGTGTGiay": tongTienThueGtgtGiay == null ? null : tongTienThueGtgtGiay,
    "hThucHDon": hThucHDon == null ? null : hThucHDon,
    "kyDienTu": kyDienTu == null ? null : kyDienTu,
    "fee": fee == null ? null : fee,
    "fee_vat": feeVat == null ? null : feeVat,
    "wf_process_id": wfProcessId,
    "wf_status": wfStatus,
    "wf_update_time": wfUpdateTime,
    "status": status == null ? null : status,
    "loai_dieu_chinh": loaiDieuChinh,
    "level": level == null ? null : level,
    "qrcode": qrcode,
    "lstInvOtherInfoBan": lstInvOtherInfoBan,
    "lstInvOtherInfoMua": lstInvOtherInfoMua,
    "lstInvOtherInfoTToan": lstInvOtherInfoTToan,
    "lstInvOtherInfoLePhiKhac": lstInvOtherInfoLePhiKhac,
    "lstInvOtherInfoCTHD": lstInvOtherInfoCthd,
    "tongcongthucxuat": tongcongthucxuat,
    "is_tt68": isTt68,
    "sign_desc_error": signDescError,
    "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
    "sluongdcdd": sluongdcdd == null ? null : sluongdcdd,
    "sluongdcCopy": sluongdcCopy == null ? null : sluongdcCopy,
    "checkBanNhap": checkBanNhap,
    "ngayLapFormat": ngayLapFormat,
    "corpID": corpId,
    "hthucHDonGoc": hthucHDonGoc == null ? null : hthucHDonGoc,
  };
}

class LstInvoiceDtlTbao {
  LstInvoiceDtlTbao({
    this.id,
    this.idGoc,
    this.dchinmua,
    this.hdongvchuyen,
    this.lydodchinh,
    this.mstNmua,
    this.ndungddong,
    this.ngayddong,
    this.ngayvban,
    this.nguoiddong,
    this.nguoiduyet,
    this.nguoivchuyen,
    this.pTbaoId,
    this.ptienvchuyen,
    this.sohdoncqtgoc,
    this.solenhddonghdong,
    this.sovban,
    this.tendvinmua,
    this.sodthoainmua,
    this.emailNmua,
    this.tenknhap,
    this.tenkxuat,
    this.tennmua,
    this.trangthai,
    this.tinhchatgoc,
    this.ngayhdongoc,
    this.ngayhdgocStr,
    this.sohdong,
    this.ngayhdong,
    this.ngayhdongStr,
    this.ngayddongStr,
    this.status,
    this.loaiTbao,
    this.mstNban,
    this.lstOther,
    this.kihieu,
    this.mauso,
    this.hdongiay,
    this.stt,
    this.flagGiayTuin,
    this.ptbaoId,
  });

  final int id;
  final int idGoc;
  final String dchinmua;
  final dynamic hdongvchuyen;
  final String lydodchinh;
  final String mstNmua;
  final dynamic ndungddong;
  final dynamic ngayddong;
  final dynamic ngayvban;
  final dynamic nguoiddong;
  final dynamic nguoiduyet;
  final dynamic nguoivchuyen;
  final int pTbaoId;
  final dynamic ptienvchuyen;
  final String sohdoncqtgoc;
  final dynamic solenhddonghdong;
  final String sovban;
  final String tendvinmua;
  final dynamic sodthoainmua;
  final dynamic emailNmua;
  final dynamic tenknhap;
  final dynamic tenkxuat;
  final String tennmua;
  final dynamic trangthai;
  final String tinhchatgoc;
  final dynamic ngayhdongoc;
  final String ngayhdgocStr;
  final dynamic sohdong;
  final dynamic ngayhdong;
  final dynamic ngayhdongStr;
  final dynamic ngayddongStr;
  final dynamic status;
  final dynamic loaiTbao;
  final dynamic mstNban;
  final dynamic lstOther;
  final String kihieu;
  final String mauso;
  final String hdongiay;
  final int stt;
  final String flagGiayTuin;
  final int ptbaoId;

  factory LstInvoiceDtlTbao.fromJson(Map<String, dynamic> json) => LstInvoiceDtlTbao(
    id: json["id"] == null ? null : json["id"],
    idGoc: json["idGoc"] == null ? null : json["idGoc"],
    dchinmua: json["dchinmua"] == null ? null : json["dchinmua"],
    hdongvchuyen: json["hdongvchuyen"],
    lydodchinh: json["lydodchinh"] == null ? null : json["lydodchinh"],
    mstNmua: json["mstNmua"] == null ? null : json["mstNmua"],
    ndungddong: json["ndungddong"],
    ngayddong: json["ngayddong"],
    ngayvban: json["ngayvban"],
    nguoiddong: json["nguoiddong"],
    nguoiduyet: json["nguoiduyet"],
    nguoivchuyen: json["nguoivchuyen"],
    pTbaoId: json["pTbaoId"] == null ? null : json["pTbaoId"],
    ptienvchuyen: json["ptienvchuyen"],
    sohdoncqtgoc: json["sohdoncqtgoc"] == null ? null : json["sohdoncqtgoc"],
    solenhddonghdong: json["solenhddonghdong"],
    sovban: json["sovban"] == null ? null : json["sovban"],
    tendvinmua: json["tendvinmua"] == null ? null : json["tendvinmua"],
    sodthoainmua: json["sodthoainmua"],
    emailNmua: json["emailNmua"],
    tenknhap: json["tenknhap"],
    tenkxuat: json["tenkxuat"],
    tennmua: json["tennmua"] == null ? null : json["tennmua"],
    trangthai: json["trangthai"],
    tinhchatgoc: json["tinhchatgoc"] == null ? null : json["tinhchatgoc"],
    ngayhdongoc: json["ngayhdongoc"],
    ngayhdgocStr: json["ngayhdgocStr"] == null ? null : json["ngayhdgocStr"],
    sohdong: json["sohdong"],
    ngayhdong: json["ngayhdong"],
    ngayhdongStr: json["ngayhdongStr"],
    ngayddongStr: json["ngayddongStr"],
    status: json["status"],
    loaiTbao: json["loaiTbao"],
    mstNban: json["mstNban"],
    lstOther: json["lstOther"],
    kihieu: json["kihieu"] == null ? null : json["kihieu"],
    mauso: json["mauso"] == null ? null : json["mauso"],
    hdongiay: json["hdongiay"] == null ? null : json["hdongiay"],
    stt: json["stt"] == null ? null : json["stt"],
    flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
    ptbaoId: json["ptbaoId"] == null ? null : json["ptbaoId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "idGoc": idGoc == null ? null : idGoc,
    "dchinmua": dchinmua == null ? null : dchinmua,
    "hdongvchuyen": hdongvchuyen,
    "lydodchinh": lydodchinh == null ? null : lydodchinh,
    "mstNmua": mstNmua == null ? null : mstNmua,
    "ndungddong": ndungddong,
    "ngayddong": ngayddong,
    "ngayvban": ngayvban,
    "nguoiddong": nguoiddong,
    "nguoiduyet": nguoiduyet,
    "nguoivchuyen": nguoivchuyen,
    "pTbaoId": pTbaoId == null ? null : pTbaoId,
    "ptienvchuyen": ptienvchuyen,
    "sohdoncqtgoc": sohdoncqtgoc == null ? null : sohdoncqtgoc,
    "solenhddonghdong": solenhddonghdong,
    "sovban": sovban == null ? null : sovban,
    "tendvinmua": tendvinmua == null ? null : tendvinmua,
    "sodthoainmua": sodthoainmua,
    "emailNmua": emailNmua,
    "tenknhap": tenknhap,
    "tenkxuat": tenkxuat,
    "tennmua": tennmua == null ? null : tennmua,
    "trangthai": trangthai,
    "tinhchatgoc": tinhchatgoc == null ? null : tinhchatgoc,
    "ngayhdongoc": ngayhdongoc,
    "ngayhdgocStr": ngayhdgocStr == null ? null : ngayhdgocStr,
    "sohdong": sohdong,
    "ngayhdong": ngayhdong,
    "ngayhdongStr": ngayhdongStr,
    "ngayddongStr": ngayddongStr,
    "status": status,
    "loaiTbao": loaiTbao,
    "mstNban": mstNban,
    "lstOther": lstOther,
    "kihieu": kihieu == null ? null : kihieu,
    "mauso": mauso == null ? null : mauso,
    "hdongiay": hdongiay == null ? null : hdongiay,
    "stt": stt == null ? null : stt,
    "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
    "ptbaoId": ptbaoId == null ? null : ptbaoId,
  };
}

class ThongBaoHdr {
  ThongBaoHdr({
    this.id,
    this.idGoc,
    this.hThucHDon,
    this.hdongvchuyen,
    this.idNguoilap,
    this.loaitbao,
    this.ngayhdon,
    this.maGdich,
    this.macqt,
    this.maktra,
    this.motaloi,
    this.mstNban,
    this.ngayduyet,
    this.ngayhdcqt,
    this.ngayhdongoc,
    this.ngayvban,
    this.nguoiduyet,
    this.nguoilap,
    this.nhangnban,
    this.sohdongoc,
    this.sotbao,
    this.sotbaocqt,
    this.sovban,
    this.tentbao,
    this.tkhoannban,
    this.trangthai,
    this.contentxml,
    this.dchinmua,
    this.tennmua,
    this.lydodieuchinh,
    this.tennban,
    this.dchinban,
    this.dthoainban,
    this.faxnban,
    this.emailnban,
    this.mstNmua,
    this.tendvinmua,
    this.emailnmua,
    this.dthoainmua,
    this.tkhoannmua,
    this.nhangnmua,
    this.faxnmua,
    this.tinhChat,
    this.tencqt,
    this.matte,
    this.soLenhDDong,
    this.ngayDDong,
    this.nguoiDDong,
    this.ndDDong,
    this.nguoivchuyen,
    this.hDongVchuyen,
    this.ptienvchuyen,
    this.tenkxuat,
    this.tenknhap,
    this.lydoTchoi,
    this.kihieu,
    this.ngayLap,
    this.tGia,
    this.thuKhoXuat,
    this.lyDoXoaBo,
    this.sohdong,
    this.kyDienTu,
    this.ngayhdong,
    this.updateTime,
    this.serviceType,
    this.channelCode,
    this.status,
    this.content,
    this.fee,
    this.feeVat,
    this.wfProcessId,
    this.flagFee,
    this.dtlTbao,
    this.pTbaoId,
    this.sohdoncqtgoc,
    this.cdMauso,
    this.cdKihieu,
    this.hthuchdongoc,
    this.isTt68,
    this.flagGiayTuin,
    this.mauso,
    this.hdongiay,
    this.barcode,
    this.tinhchatgoc,
    this.messReceived,
    this.lydodchinh,
    this.thuKhoNhap,
    this.tctbao,
  this.ltbao,
  });

  final int id;
  final int idGoc;
  final dynamic hThucHDon;
  final dynamic hdongvchuyen;
  final int idNguoilap;
  final String loaitbao;
  final dynamic ngayhdon;
  final String maGdich;
  final String macqt;
  final dynamic maktra;
  final dynamic motaloi;
  final String mstNban;
  final int ngayduyet;
  final dynamic ngayhdcqt;
  final dynamic ngayhdongoc;
  final dynamic ngayvban;
  final dynamic nguoiduyet;
  final String nguoilap;
  final dynamic nhangnban;
  final dynamic sohdongoc;
  final String sotbao;
  final dynamic sotbaocqt;
  final dynamic sovban;
  final String tentbao;
  final dynamic tkhoannban;
  final String trangthai;
  final String contentxml;
  final dynamic dchinmua;
  final dynamic tennmua;
  final dynamic lydodieuchinh;
  final String tennban;
  final String dchinban;
  final dynamic dthoainban;
  final String faxnban;
  final String emailnban;
  final dynamic mstNmua;
  final dynamic tendvinmua;
  final dynamic emailnmua;
  final dynamic dthoainmua;
  final dynamic tkhoannmua;
  final dynamic nhangnmua;
  final dynamic faxnmua;
  final String tinhChat;
  final String tencqt;
  final dynamic matte;
  final dynamic soLenhDDong;
  final dynamic ngayDDong;
  final dynamic nguoiDDong;
  final dynamic ndDDong;
  final dynamic nguoivchuyen;
  final dynamic hDongVchuyen;
  final dynamic ptienvchuyen;
  final dynamic tenkxuat;
  final dynamic tenknhap;
  final dynamic lydoTchoi;
  final dynamic kihieu;
  final int ngayLap;
  final dynamic tGia;
  final dynamic thuKhoXuat;
  final dynamic lyDoXoaBo;
  final dynamic sohdong;
  final String kyDienTu;
  final dynamic ngayhdong;
  final dynamic updateTime;
  final String serviceType;
  final String channelCode;
  final String status;
  final dynamic content;
  final int fee;
  final int feeVat;
  final dynamic wfProcessId;
  final String flagFee;
  final dynamic dtlTbao;
  final int pTbaoId;
  final dynamic sohdoncqtgoc;
  final dynamic cdMauso;
  final dynamic cdKihieu;
  final dynamic hthuchdongoc;
   String isTt68;
  final String flagGiayTuin;
  final dynamic mauso;
  final String hdongiay;
  final dynamic barcode;
  final dynamic tinhchatgoc;
  final dynamic messReceived;
  final dynamic lydodchinh;
  final dynamic thuKhoNhap;
  final dynamic tctbao;
  final dynamic ltbao;

  factory ThongBaoHdr.fromJson(Map<String, dynamic> json) => ThongBaoHdr(
    id: json["id"] == null ? null : json["id"],
    idGoc: json["idGoc"] == null ? null : json["idGoc"],
    hThucHDon: json["hThucHDon"],
    hdongvchuyen: json["hdongvchuyen"],
    idNguoilap: json["idNguoilap"] == null ? null : json["idNguoilap"],
    loaitbao: json["loaitbao"] == null ? null : json["loaitbao"],
    ngayhdon: json["ngayhdon"],
    maGdich: json["maGdich"] == null ? null : json["maGdich"],
    macqt: json["macqt"] == null ? null : json["macqt"],
    maktra: json["maktra"],
    motaloi: json["motaloi"],
    mstNban: json["mstNban"] == null ? null : json["mstNban"],
    ngayduyet: json["ngayduyet"] == null ? null : json["ngayduyet"],
    ngayhdcqt: json["ngayhdcqt"],
    ngayhdongoc: json["ngayhdongoc"],
    ngayvban: json["ngayvban"],
    nguoiduyet: json["nguoiduyet"],
    nguoilap: json["nguoilap"] == null ? null : json["nguoilap"],
    nhangnban: json["nhangnban"],
    sohdongoc: json["sohdongoc"],
    sotbao: json["sotbao"] == null ? null : json["sotbao"],
    sotbaocqt: json["sotbaocqt"],
    sovban: json["sovban"],
    tentbao: json["tentbao"] == null ? null : json["tentbao"],
    tkhoannban: json["tkhoannban"],
    trangthai: json["trangthai"] == null ? null : json["trangthai"],
    contentxml: json["contentxml"] == null ? null : json["contentxml"],
    dchinmua: json["dchinmua"],
    tennmua: json["tennmua"],
    lydodieuchinh: json["lydodieuchinh"],
    tennban: json["tennban"] == null ? null : json["tennban"],
    dchinban: json["dchinban"] == null ? null : json["dchinban"],
    dthoainban: json["dthoainban"],
    faxnban: json["faxnban"] == null ? null : json["faxnban"],
    emailnban: json["emailnban"] == null ? null : json["emailnban"],
    mstNmua: json["mstNmua"],
    tendvinmua: json["tendvinmua"],
    emailnmua: json["emailnmua"],
    dthoainmua: json["dthoainmua"],
    tkhoannmua: json["tkhoannmua"],
    nhangnmua: json["nhangnmua"],
    faxnmua: json["faxnmua"],
    tinhChat: json["tinhChat"] == null ? null : json["tinhChat"],
    tencqt: json["tencqt"] == null ? null : json["tencqt"],
    matte: json["matte"],
    soLenhDDong: json["soLenhDDong"],
    ngayDDong: json["ngayDDong"],
    nguoiDDong: json["nguoiDDong"],
    ndDDong: json["ndDDong"],
    nguoivchuyen: json["nguoivchuyen"],
    hDongVchuyen: json["hDongVchuyen"],
    ptienvchuyen: json["ptienvchuyen"],
    tenkxuat: json["tenkxuat"],
    tenknhap: json["tenknhap"],
    lydoTchoi: json["lydoTchoi"],
    kihieu: json["kihieu"],
    ngayLap: json["ngayLap"] == null ? null : json["ngayLap"],
    tGia: json["tGia"],
    thuKhoXuat: json["thuKhoXuat"],
    lyDoXoaBo: json["lyDoXoaBo"],
    sohdong: json["sohdong"],
    kyDienTu: json["kyDienTu"] == null ? null : json["kyDienTu"],
    ngayhdong: json["ngayhdong"],
    updateTime: json["update_time"],
    serviceType: json["serviceType"] == null ? null : json["serviceType"],
    channelCode: json["channelCode"] == null ? null : json["channelCode"],
    status: json["status"] == null ? null : json["status"],
    content: json["content"],
    fee: json["fee"] == null ? null : json["fee"],
    feeVat: json["fee_vat"] == null ? null : json["fee_vat"],
    wfProcessId: json["wf_process_id"],
    flagFee: json["flag_fee"] == null ? null : json["flag_fee"],
    dtlTbao: json["dtlTbao"],
    pTbaoId: json["p_tbao_id"] == null ? null : json["p_tbao_id"],
    sohdoncqtgoc: json["sohdoncqtgoc"],
    cdMauso: json["cd_mauso"],
    cdKihieu: json["cd_kihieu"],
    hthuchdongoc: json["hthuchdongoc"],
    isTt68: json["is_tt68"] == null ? null : json["is_tt68"],
    flagGiayTuin: json["flagGiayTuin"] == null ? null : json["flagGiayTuin"],
    mauso: json["mauso"],
    hdongiay: json["hdongiay"] == null ? null : json["hdongiay"],
    ltbao: json["ltbao"] == null ? null : json["ltbao"],
    barcode: json["barcode"],
    tinhchatgoc: json["tinhchatgoc"],
    messReceived: json["messReceived"],
    lydodchinh: json["lydodchinh"],
    thuKhoNhap: json["thuKhoNhap"],
    tctbao: json["tctbao"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "idGoc": idGoc == null ? null : idGoc,
    "hThucHDon": hThucHDon,
    "hdongvchuyen": hdongvchuyen,
    "idNguoilap": idNguoilap == null ? null : idNguoilap,
    "loaitbao": loaitbao == null ? null : loaitbao,
    "ngayhdon": ngayhdon,
    "maGdich": maGdich == null ? null : maGdich,
    "macqt": macqt == null ? null : macqt,
    "maktra": maktra,
    "motaloi": motaloi,
    "mstNban": mstNban == null ? null : mstNban,
    "ngayduyet": ngayduyet == null ? null : ngayduyet,
    "ngayhdcqt": ngayhdcqt,
    "ngayhdongoc": ngayhdongoc,
    "ngayvban": ngayvban,
    "nguoiduyet": nguoiduyet,
    "nguoilap": nguoilap == null ? null : nguoilap,
    "nhangnban": nhangnban,
    "sohdongoc": sohdongoc,
    "sotbao": sotbao == null ? null : sotbao,
    "sotbaocqt": sotbaocqt,
    "sovban": sovban,
    "tentbao": tentbao == null ? null : tentbao,
    "tkhoannban": tkhoannban,
    "trangthai": trangthai == null ? null : trangthai,
    "contentxml": contentxml == null ? null : contentxml,
    "dchinmua": dchinmua,
    "tennmua": tennmua,
    "lydodieuchinh": lydodieuchinh,
    "tennban": tennban == null ? null : tennban,
    "dchinban": dchinban == null ? null : dchinban,
    "dthoainban": dthoainban,
    "faxnban": faxnban == null ? null : faxnban,
    "emailnban": emailnban == null ? null : emailnban,
    "mstNmua": mstNmua,
    "tendvinmua": tendvinmua,
    "emailnmua": emailnmua,
    "dthoainmua": dthoainmua,
    "tkhoannmua": tkhoannmua,
    "nhangnmua": nhangnmua,
    "faxnmua": faxnmua,
    "tinhChat": tinhChat == null ? null : tinhChat,
    "tencqt": tencqt == null ? null : tencqt,
    "matte": matte,
    "soLenhDDong": soLenhDDong,
    "ngayDDong": ngayDDong,
    "nguoiDDong": nguoiDDong,
    "ndDDong": ndDDong,
    "nguoivchuyen": nguoivchuyen,
    "hDongVchuyen": hDongVchuyen,
    "ptienvchuyen": ptienvchuyen,
    "tenkxuat": tenkxuat,
    "tenknhap": tenknhap,
    "lydoTchoi": lydoTchoi,
    "kihieu": kihieu,
    "ngayLap": ngayLap == null ? null : ngayLap,
    "tGia": tGia,
    "thuKhoXuat": thuKhoXuat,
    "lyDoXoaBo": lyDoXoaBo,
    "sohdong": sohdong,
    "kyDienTu": kyDienTu == null ? null : kyDienTu,
    "ngayhdong": ngayhdong,
    "update_time": updateTime,
    "serviceType": serviceType == null ? null : serviceType,
    "channelCode": channelCode == null ? null : channelCode,
    "status": status == null ? null : status,
    "content": content,
    "fee": fee == null ? null : fee,
    "fee_vat": feeVat == null ? null : feeVat,
    "wf_process_id": wfProcessId,
    "flag_fee": flagFee == null ? null : flagFee,
    "dtlTbao": dtlTbao,
    "p_tbao_id": pTbaoId == null ? null : pTbaoId,
    "sohdoncqtgoc": sohdoncqtgoc,
    "cd_mauso": cdMauso,
    "cd_kihieu": cdKihieu,
    "hthuchdongoc": hthuchdongoc,
    "is_tt68": isTt68 == null ? null : isTt68,
    "flagGiayTuin": flagGiayTuin == null ? null : flagGiayTuin,
    "mauso": mauso,
    "hdongiay": hdongiay == null ? null : hdongiay,
    "barcode": barcode,
    "tinhchatgoc": tinhchatgoc,
    "messReceived": messReceived,
    "lydodchinh": lydodchinh,
    "thuKhoNhap": thuKhoNhap,
    "tctbao": tctbao,
    "ltbao": ltbao,
  };
}
