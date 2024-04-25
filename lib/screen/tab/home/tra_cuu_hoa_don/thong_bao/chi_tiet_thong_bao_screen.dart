import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/calendar_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/service/api_service/request/tra_cuu_hoa_don/ky_tbao_dcdinh_danh_request.dart';
import 'package:mtax24/service/init.dart';
import '../../../../init_view.dart';

class ChiTietThongBaoScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final dynamic object;
  final String type;


  ChiTietThongBaoScreen({this.object, this.type});

  @override
  State<StatefulWidget> createState() => _ChiTietThongBaoScreenState();
}

class _ChiTietThongBaoScreenState extends State<ChiTietThongBaoScreen> with GetItStateMixin{

  TextEditingController mauSoController = TextEditingController();
  TextEditingController kyHieuController = TextEditingController();
  TextEditingController soVanBanController = TextEditingController();
  TextEditingController lyDoController = TextEditingController();
  TextEditingController ngayKyController = TextEditingController();
  TextEditingController tenNguoiMuaController = TextEditingController();
  TextEditingController diaChiNguoiMuaController = TextEditingController();
  TextEditingController ngayHDController = TextEditingController();

  String errorNgayKy;
  var dropTinhChat, dropLoaiTB;

  var controller = GetIt.I<ThongBaoController>();

  ChiTietThongBaoResponse chiTietThongBaoResponse;
  List<LstInvoiceDtlTbao> lstInvoiceDtlTbao = [];
  LapTBaoDcDinhDanhResponse lapTBaoDcDinhDanhResponse;
  ThaoTacLapTBaoXoaBoResponse thaoTacLapTBaoXoaBoResponse;
  TiepTucTBaoDcDinhDanhResponse tiepTucTBaoDcDinhDanhResponse = TiepTucTBaoDcDinhDanhResponse();

  ThongBaoXoaBoResponse thongBaoXoaBoResponse;
  String title = "";
  String sohdoncqtgoc = "";
  List<String> lstTinhChat = [
    "Giải trình",
    "Hủy có lập hóa đơn thay thế",
    "Hủy không lập hóa đơn thay thế"
  ];

  List<String> lstLoaiTB = [
    "Thông báo hủy/giải trình của NNT",
    "Thông báo hủy/giải trình của NNT theo thông báo của CQT",
  ];

  DieuChinhDinhDanhResponse dinhDanhResponse;
  HoaDonXoaBoResponse xoaBoResponse;

  String type ;
  String tenHD = "" ;
  String loaiHD ="", mstNmua = "", mauSo = '', kyHieu = '', tinhChatXoaBo = '1', loaiTBXoaBo = '', isTt68 = '';
  String typeNext = '';
  List<SpeedDialChild> lstSpeedDialChild = [];

  @override
  void initState() {
    super.initState();
    print("========type: ${widget.type}");
    if(widget.object != null && widget.type == "TB"){
      chiTietThongBaoResponse = widget.object;
      title = Utils.convertTinhChatThongBao(chiTietThongBaoResponse.thongBaoHdr.tinhChat);
      type = chiTietThongBaoResponse.thongBaoHdr.tinhChat;
      loaiHD = chiTietThongBaoResponse.thongBaoHdr.loaitbao;
      mstNmua = chiTietThongBaoResponse.thongBaoHdr.mstNmua;
      isTt68 = chiTietThongBaoResponse.thongBaoHdr.isTt68;
      print("==========isTt68: ${chiTietThongBaoResponse.thongBaoHdr.isTt68}");
      print("==========loaitbao: ${chiTietThongBaoResponse.thongBaoHdr.loaitbao}");
      print("==========tinhChat: ${chiTietThongBaoResponse.thongBaoHdr.tinhChat}");
      if(chiTietThongBaoResponse.thongBaoHdr.isTt68 == "TT78"){
        lstTinhChat.clear();
        lstTinhChat.add("Hủy");
        lstTinhChat.add("Điều chỉnh");
        lstTinhChat.add("Thay thế");
        lstTinhChat.add("Giải trình");
        int index = int.parse(chiTietThongBaoResponse.thongBaoHdr.tctbao) - 1;
        dropTinhChat = lstTinhChat[index].toString();
      }
      if(chiTietThongBaoResponse.thongBaoHdr.tinhChat == "07"){
        final objects = chiTietThongBaoResponse.thongBaoHdr;
        mauSoController.text = objects.mauso;
        mauSo = objects.mauso;
        kyHieuController.text = objects.kihieu;
        kyHieu = objects.kihieu;
        lyDoController.text = objects.lyDoXoaBo;
        tenNguoiMuaController.text = objects.tennmua;
        diaChiNguoiMuaController.text = objects.dchinmua;
        sohdoncqtgoc = objects.sohdoncqtgoc;
        ngayHDController.text = objects.ngayhdon != null ? Utils.convertTimestamp(objects.ngayhdon).toString() :
            objects.ngayhdongoc != null ? Utils.convertTimestamp(objects.ngayhdongoc).toString() : "";
        ngayKyController.text = objects.ngayhdongoc != null ? Utils.convertTimestamp(objects.ngayvban).toString() : "";
        soVanBanController.text = objects.sovban != null ? objects.sovban.toString() : '';
      }
      // else if(chiTietThongBaoResponse.thongBaoHdr.tinhChat == "10"){
      //   print("======chiTietThongBaoResponse:${chiTietThongBaoResponse.lstInvoiceDtlTbao.first.toJson()}");
      //   lstInvoiceDtlTbao = chiTietThongBaoResponse.lstInvoiceDtlTbao;
      //   mauSoController.text = lstInvoiceDtlTbao.first.mauso ;
      //   mauSo = lstInvoiceDtlTbao.first.mauso ;
      //   kyHieuController.text = lstInvoiceDtlTbao.first.kihieu;
      //   kyHieu = lstInvoiceDtlTbao.first.kihieu;
      //   lyDoController.text = lstInvoiceDtlTbao.first.lydodchinh;
      //   tenNguoiMuaController.text = lstInvoiceDtlTbao.first.tennmua;
      //   diaChiNguoiMuaController.text = lstInvoiceDtlTbao.first.dchinmua;
      //   sohdoncqtgoc = lstInvoiceDtlTbao.first.sohdoncqtgoc;
      // }
      else {
        final objects = chiTietThongBaoResponse.thongBaoHdr;
        print("========lydodchinh: ${objects.lydodchinh}");
        mauSoController.text = objects.mauso;
        mauSo = objects.mauso;
        kyHieuController.text = objects.kihieu;
        kyHieu = objects.kihieu;
        lyDoController.text = objects.lydodchinh;
        tenNguoiMuaController.text = objects.tennmua;
        diaChiNguoiMuaController.text = objects.dchinmua;
        ngayHDController.text = objects.ngayhdon != null ? Utils.convertTimestamp(objects.ngayhdon).toString() :
        objects.ngayhdongoc != null ? Utils.convertTimestamp(objects.ngayhdongoc).toString() : "";
        ngayKyController.text = objects.ngayhdongoc != null ? Utils.convertTimestamp(objects.ngayvban).toString() : '';
        soVanBanController.text = objects.sovban != null ? objects.sovban.toString() : '';
        sohdoncqtgoc = objects.sohdongoc;
      }
    }
    if(widget.object != null && widget.type == "TCHDDCDD"){
      dinhDanhResponse = widget.object;
      type = "10";
      loaiHD = dinhDanhResponse.loaihdon;
      mstNmua = dinhDanhResponse.mstNmua;
      title = Utils.convertTinhChatThongBao(type);
      mauSoController.text = dinhDanhResponse.mauhdon;
      mauSo = dinhDanhResponse.mauhdon;
      kyHieuController.text = dinhDanhResponse.khieuhdon;
      kyHieu = dinhDanhResponse.khieuhdon;
      tenNguoiMuaController.text = dinhDanhResponse.tendvinmua;
      diaChiNguoiMuaController.text = dinhDanhResponse.dchinmua;
      sohdoncqtgoc = dinhDanhResponse.sohdon;
      tenHD = dinhDanhResponse.tenhdon;
      controller.lapTBaoDCDinhDanh(LapTBaoDCDinhDanhRequest(
        idDtl: ["${dinhDanhResponse.id}"],
        loaihoadonDtl: ["$loaiHD"],
        sohdgocDtl: ["$sohdoncqtgoc"],
      ));
    }
    if(widget.object != null && widget.type == "TCHDXoBo"){

      xoaBoResponse = widget.object;
      type = "07";
      loaiHD = xoaBoResponse.loaihdon;
      mstNmua = xoaBoResponse.mstNmua;
      title = Utils.convertTinhChatThongBao(type);
      mauSoController.text = xoaBoResponse.mauhdon;
      mauSo = xoaBoResponse.mauhdon;
      kyHieuController.text = xoaBoResponse.khieuhdon;
      kyHieu = xoaBoResponse.khieuhdon;
      tenNguoiMuaController.text = xoaBoResponse.tennmua;
      ngayHDController.text = xoaBoResponse.ngayhdon;
      ngayKyController.text = new DateFormat('dd/MM/yyyy').format(new DateTime.now());
      sohdoncqtgoc = xoaBoResponse.sohdon;
      tenHD = xoaBoResponse.tenhdon;
      controller.thaoTacLapTBaoXoaBo(ThaoTacLapTBaoXoaBoRequest(
        sohdon: sohdoncqtgoc,
        loaihdon: loaiHD,
        id: xoaBoResponse.id,
        tinhChat: xoaBoResponse.tinhChat,
        khieuhdon: kyHieu,
        mauhdon: mauSo));
    }
    lstSpeedDialChild.add(
      SpeedDialChild(
        child: Icon(Icons.edit),
        backgroundColor: colorPrimary,
        label: 'Ký',
        onTap: () {
          if(widget.type == "TCHDXoBo"){
            typeNext = 'KY';
            if(thaoTacLapTBaoXoaBoResponse != null  &&
                thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT78" &&
                (lyDoController.text == null || lyDoController.text == "")){
              DialogAlert.showDialogAlertCancel(context, "Vui lòng nhập lý do");
              return;
            }else {
              controller.nextTBaoXoaBo(NextTBaoXoaBoRequest(
                soVBan: soVanBanController.text,
                lyDoXoaBo: lyDoController.text,
                ngayKyVanBan: ngayHDController.text,
                inReq: thaoTacLapTBaoXoaBoResponse.inReq,
                portalTbaoReq: thaoTacLapTBaoXoaBoResponse.portal,
                tctbao: tinhChatXoaBo,));
            }
          }else {
            controller.tiepTucTBaoDCDinhDanh(TiepTucTBaoDcDinhDanhRequest(
              dchiNMua: ["${diaChiNguoiMuaController.text}"],
              loaiHDon: "$loaiHD",
              lydodieuchinh: ["${lyDoController.text}"],
              mstNmua: ["$mstNmua"],
              ngayVBan: ["${ngayKyController.text}"],
              portalInvoiceHdrTbao: widget.type == "TB" ? chiTietThongBaoResponse.thongBaoHdr :
                tiepTucTBaoDcDinhDanhResponse.portalHdrTbao == null ? ThongBaoHdr() : tiepTucTBaoDcDinhDanhResponse.portalHdrTbao,
              portalListInvoiceHdrTbao: widget.type == "TB" ? chiTietThongBaoResponse.lstInvoiceDtlTbao :
                tiepTucTBaoDcDinhDanhResponse.portalListInvoiceHdrTbao == null ? lapTBaoDcDinhDanhResponse.portalListInvoiceHdrTbao : tiepTucTBaoDcDinhDanhResponse.portalListInvoiceHdrTbao,
              soHDonCqt: ["$sohdoncqtgoc"],
              soVBan: ["${soVanBanController.text}"],
              tendvimua: ["${tenNguoiMuaController.text}"],
              tenNMua: ["${tenNguoiMuaController.text}"],
              tinhchatgoc: ["$type"],
            ));
          }
        },
      ),
    );
    lstSpeedDialChild.add(
      SpeedDialChild(
          child: Icon(Icons.save),
          backgroundColor: colorPrimary,
          label: 'Lưu',
          onTap: () {
            if(widget.type == "TCHDXoBo"){
              typeNext = "LUU";
              if(thaoTacLapTBaoXoaBoResponse != null  &&
                  thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT78" &&
                  (lyDoController.text == null || lyDoController.text == "")){
                DialogAlert.showDialogAlertCancel(context, "Vui lòng nhập lý do");
                return;
              }else {
                controller.nextTBaoXoaBo(NextTBaoXoaBoRequest(
                  soVBan: soVanBanController.text,
                  lyDoXoaBo: lyDoController.text,
                  ngayKyVanBan: ngayHDController.text,
                  inReq: thaoTacLapTBaoXoaBoResponse.inReq,
                  portalTbaoReq: thaoTacLapTBaoXoaBoResponse.portal,
                  tctbao: tinhChatXoaBo,));
              }
            }else {
              controller.luuTBaoDCDinhDanh(TiepTucTBaoDcDinhDanhRequest(
                dchiNMua: ["${diaChiNguoiMuaController.text}"],
                loaiHDon: "$loaiHD",
                lydodieuchinh: ["${lyDoController.text}"],
                mstNmua: ["$mstNmua"],
                ngayVBan: ["${ngayKyController.text}"],
                portalInvoiceHdrTbao: widget.type == "TB" ? chiTietThongBaoResponse.thongBaoHdr : ThongBaoHdr(),
                portalListInvoiceHdrTbao: widget.type == "TB" ? chiTietThongBaoResponse.lstInvoiceDtlTbao : lapTBaoDcDinhDanhResponse.portalListInvoiceHdrTbao,
                soHDonCqt: ["$sohdoncqtgoc"],
                soVBan: ["${soVanBanController.text}"],
                tendvimua: ["${tenNguoiMuaController.text}"],
                tenNMua: ["${tenNguoiMuaController.text}"],
                tinhchatgoc: ["$type"],
              ));
            }
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    registerHandler((ThongBaoModel x) => x.dMucHoaDon, (context, List<DanhMucHoaDonResponse> list, cancel) {
    });

    registerHandler((ThongBaoModel x) => x.nextTBaoXoaBo, (context, ThongBaoXoaBoResponse response, cancel) {
      if(response != null){
        thongBaoXoaBoResponse = response;
        if(typeNext == "LUU") {
          controller.preLuuTBaoXoaBo(NextTBaoXoaBoRequest(
            soVBan: soVanBanController.text,
            lyDoXoaBo: lyDoController.text,
            ngayKyVanBan: ngayHDController.text,
            inReq: response.invHdr,
            portalTbaoReq: response.portalHdrTbao,
            tctbao: tinhChatXoaBo,
            lTBao: loaiTBXoaBo,
            pincode: "111111"));
        }else {
          print("=========isHsm: ${response.isHsm}");
          if(response.isHsm == "Y"){
            DialogAlert.showMDialogOTP("", context, (values) => {
              controller.kyTBaoApi(NextTBaoXoaBoRequest(
                  soVBan: soVanBanController.text,
                  lyDoXoaBo: lyDoController.text,
                  ngayKyVanBan: ngayHDController.text,
                  inReq: response.invHdr,
                  portalTbaoReq: response.portalHdrTbao,
                  tctbao: tinhChatXoaBo,
                  lTBao: loaiTBXoaBo,
                  pincode: values))
            });
          }else {
            controller.kyTBaoApi(NextTBaoXoaBoRequest(
                soVBan: soVanBanController.text,
                lyDoXoaBo: lyDoController.text,
                ngayKyVanBan: ngayHDController.text,
                inReq: response.invHdr,
                portalTbaoReq: response.portalHdrTbao,
                tctbao: tinhChatXoaBo,
                lTBao: loaiTBXoaBo,
                pincode: "111111"));
          }
        }
      }
    });

    registerHandler((ThongBaoModel x) => x.luuTBaoDCDinhDanh, (context, TiepTucTBaoDcDinhDanhResponse response, cancel) {
      if(response != null){
        tiepTucTBaoDcDinhDanhResponse = response;
        DialogAlert.showDialogAlertCancel(context, "Lưu thành công!", onSuccess: (){
          Navigator.of(context).pop();
        });
      }
    });

    registerHandler((ThongBaoModel x) => x.tiepTucTBaoDCDinhDanh, (context, TiepTucTBaoDcDinhDanhResponse response, cancel) {
      if(response != null){
        tiepTucTBaoDcDinhDanhResponse = response;
        controller.kyTBaoDCDDApi(TiepTucTBaoDcDinhDanhRequest(
          dchiNMua: ["${diaChiNguoiMuaController.text}"],
          loaiHDon: "$loaiHD",
          lydodieuchinh: ["${lyDoController.text}"],
          mstNmua: ["$mstNmua"],
          ngayVBan: ["${ngayKyController.text}"],
          portalInvoiceHdrTbao: widget.type == "TB" ? chiTietThongBaoResponse
              .thongBaoHdr : response.portalHdrTbao,
          portalListInvoiceHdrTbao: widget.type == "TB"
              ? chiTietThongBaoResponse.lstInvoiceDtlTbao
              : response.portalListInvoiceHdrTbao,
          soHDonCqt: ["$sohdoncqtgoc"],
          soVBan: ["${soVanBanController.text}"],
          tendvimua: ["${tenNguoiMuaController.text}"],
          tenNMua: ["${tenNguoiMuaController.text}"],
          tinhchatgoc: ["$type"],

        ));
      }
    });

    registerHandler((ThongBaoModel x) => x.kyTBaoDCDDApi, (context, BaseResponse response, cancel) {
      if(response != null){
        controller.guiTBaoDCDinhDanh(TiepTucTBaoDcDinhDanhRequest(
          dchiNMua: ["${diaChiNguoiMuaController.text}"],
          loaiHDon: "$loaiHD",
          lydodieuchinh: ["${lyDoController.text}"],
          mstNmua: ["$mstNmua"],
          ngayVBan: ["${ngayKyController.text}"],
          portalInvoiceHdrTbao: widget.type == "TB" ?  chiTietThongBaoResponse.thongBaoHdr : tiepTucTBaoDcDinhDanhResponse.portalHdrTbao,
          portalListInvoiceHdrTbao: widget.type == "TB" ?  chiTietThongBaoResponse.lstInvoiceDtlTbao : tiepTucTBaoDcDinhDanhResponse.portalListInvoiceHdrTbao,
          soHDonCqt: ["$sohdoncqtgoc"],
          soVBan: ["${soVanBanController.text}"],
          tendvimua: ["${tenNguoiMuaController.text}"],
          tenNMua: ["${tenNguoiMuaController.text}"],
          tinhchatgoc: ["$type"],
        ));
      }
    });

    registerHandler((ThongBaoModel x) => x.lapTBDCDinhDanh, (context, LapTBaoDcDinhDanhResponse response, cancel) {
      if(response != null){
        lapTBaoDcDinhDanhResponse = response;
      }
    });

    registerHandler((ThongBaoModel x) => x.thaoTacLapTBaoXoaBo, (context, ThaoTacLapTBaoXoaBoResponse response, cancel) {
      if(response != null){
        thaoTacLapTBaoXoaBoResponse = response;
        if(thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT78"){
          lstTinhChat.clear();
          lstTinhChat.add("Hủy");
          lstTinhChat.add("Điều chỉnh");
          lstTinhChat.add("Thay thế");
          lstTinhChat.add("Giải trình");
        }
      }
    });

    registerHandler((ThongBaoModel x) => x.preLuuTBaoXoaBo, (context, BaseResponse response, cancel) {
      DialogAlert.showDialogAlertCancel(context, response.message, onSuccess: (){
        Navigator.of(context).pop();
      });
    });

    registerHandler((ThongBaoModel x) => x.kyTBaoXoaBo, (context, ThongBaoXoaBoResponse response, cancel) {
      controller.GuiTBaoXoaBo(NextTBaoXoaBoRequest(
          pincode: "111111",
          soVBan: soVanBanController.text,
          lyDoXoaBo: lyDoController.text,
          ngayKyVanBan: ngayHDController.text,
          tctbao: tinhChatXoaBo,
          inReq: thongBaoXoaBoResponse.invHdr,
          portalTbaoReq: response.portalHdrTbao,
          lTBao: loaiTBXoaBo
          ));
    });

    registerHandler((ThongBaoModel x) => x.guiTBaoXoaBo, (context, BaseResponse response, cancel) {
      print("==========htmlcontent: ${response.htmlContent}");
      DialogAlert.showDialogAlertCancel(context, response.message, onSuccess: (){
        Navigator.of(context).pop();
      });
    });

    registerHandler((ThongBaoModel x) => x.guiTBaoDCDinhDanh, (context, BaseResponse response, cancel) {
      if(response != null){
        DialogAlert.showDialogAlertCancel(context, response.message, onSuccess: (){
          Navigator.of(context).pop();
        });
      }
    });
    registerHandler((ThongBaoModel x) => x.error, (context, error, cancel) {
      DialogAlert.showDialogAlertCancel(context, error == null || error == "" ? "Có lỗi xảy ra!" : error);
    });
    final loading = watchX((ThongBaoModel x) => x.loading);

    return Scaffold(
        body: Stack(
          children: [
            AppbarScreen(title: '$title', isShowHome: true, isShowBack: true,
              heightTop: EdgeInsets.only(top: 650.h),
              heightBackgroundTop: 570.h,
              childrenAppBar: [
                ItemFilterTB("Số hóa đơn:", "${sohdoncqtgoc == null ? "-" : sohdoncqtgoc}"),
                Padding(
                  padding: EdgeInsets.only(top: 10.h,),
                  child: ItemFilterTB("Ngày hóa đơn:", "Ngày ${DateTime.now().day} Tháng ${DateTime.now().month} Năm ${DateTime.now().year}"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h,),
                  child: ItemFilterTB("Mẫu số:", "$mauSo"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h,),
                  child: ItemFilterTB("Ký hiệu:", "$kyHieu"),
                ),
              ],
              children: [
                CardWidget(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.h,),
                          child: Text("Thông tin hóa đơn".toUpperCase(), style: text14OBold600,)
                        ),
                        type != "10" ?
                        Padding(
                          padding: EdgeInsets.only(top: 30.h,),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: true,
                            showCursor: false,
                            textEditingController: ngayHDController,
                            hintText: "Ngày hóa đơn(*)",
                          ),
                        )
                            : Container(),
                        isTt68 == 'TT78' ? SizedBox() :
                        widget.type != "TCHDXoBo" ? Padding(
                          padding: EdgeInsets.only(top: 30.h,),
                          child: TextInput(
                            haveBorder: true,
                            textEditingController: soVanBanController,
                            hintText: "Số văn bản thỏa thuận",
                          ),
                        ) :
                        thaoTacLapTBaoXoaBoResponse != null  && thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT68" ?
                          Padding(
                          padding: EdgeInsets.only(top: 30.h,),
                          child: TextInput(
                            haveBorder: true,
                            textEditingController: soVanBanController,
                            hintText: "Số văn bản thỏa thuận",
                          ),
                        ) : SizedBox(),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h,),
                          child: TextInput(
                            haveBorder: true,
                            textEditingController: lyDoController,
                            hintText: type == "10" ? "Lý do điều chỉnh(*)" : "Lý do(*)",
                          ),
                        ),
                        widget.type != "TCHDXoBo" && isTt68 == "TT68" ?
                        CalendarInput(
                          textDateController: ngayKyController,
                          haveBorder: true,
                          title: "Ngày ký văn bản",
                          onClickChooseDate: (selectedDate){
                            setState(() {
                              if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
                                errorNgayKy = "Ngày không hợp lệ";
                              } else {
                                errorNgayKy = null;
                                ngayKyController.text = selectedDate;
                              }
                            });
                          },
                          errorText: errorNgayKy,
                        ) :
                        thaoTacLapTBaoXoaBoResponse != null  && thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT68" ?
                        CalendarInput(
                          textDateController: ngayKyController,
                          haveBorder: true,
                          title: "Ngày ký văn bản",
                          onClickChooseDate: (selectedDate){
                            setState(() {
                              if(DateFormat("dd/MM/yyyy").parse(selectedDate).isAfter(DateTime.now())) {
                                errorNgayKy = "Ngày không hợp lệ";
                              } else {
                                errorNgayKy = null;
                                ngayKyController.text = selectedDate;
                              }
                            });
                          },
                          errorText: errorNgayKy,
                        ) : SizedBox(),
                        widget.type == "TCHDXoBo" && thaoTacLapTBaoXoaBoResponse != null  && thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT78" ?
                        Column(
                          children: [
                            DropdownInput(
                              value: dropLoaiTB,
                              onChangedCustom: (String value){
                                setState(() {
                                  dropLoaiTB = value;
                                  switch(dropLoaiTB){
                                    case "Thông báo hủy/giải trình của NNT" :
                                      loaiTBXoaBo = "1";
                                      break;
                                    case "Thông báo hủy/giải trình của NNT theo thông báo của CQT" :
                                      loaiTBXoaBo = "2";
                                      break;
                                  }
                                });
                              },
                              hint: "Loại thông báo(*)",
                              itemsDropdown: lstLoaiTB,
                            ),
                            DropdownInput(
                              value: dropTinhChat,
                              onChangedCustom: (String value){
                                setState(() {
                                  dropTinhChat = value;
                                  print("dropTinhChat: $dropTinhChat");
                                  switch(dropTinhChat){
                                    case "Giải trình" :
                                      tinhChatXoaBo = thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT78" ? "4" : "1";
                                      break;
                                    case "Hủy có lập hóa đơn thay thế" :
                                      tinhChatXoaBo = "2";
                                      break;
                                    case "Hủy không lập hóa đơn thay thế" :
                                      tinhChatXoaBo = "3";
                                      break;
                                    case "Hủy" :
                                      tinhChatXoaBo = "1";
                                      break;
                                    case "Điều chỉnh" :
                                      tinhChatXoaBo = "2";
                                      break;
                                    case "Thay thế" :
                                      tinhChatXoaBo = "3";
                                      break;
                                  // case "Giải trình" :
                                  //   tinhChatXoaBo = "4";
                                  //   break;
                                  }
                                  print("tinhChatXoaBo: $tinhChatXoaBo");
                                });
                              },
                              hint: "Tính chất thông báo(*)",
                              itemsDropdown: lstTinhChat,
                            ),
                          ],
                        ): SizedBox(),
                        isTt68 == "TT78"  ?
                          Column(
                            children: [
                              DropdownInput(
                                value: dropLoaiTB,
                                onChangedCustom: (String value){
                                  setState(() {
                                    dropLoaiTB = value;
                                    switch(dropLoaiTB){
                                      case "Thông báo hủy/giải trình của NNT" :
                                        loaiTBXoaBo = "1";
                                        break;
                                      case "Thông báo hủy/giải trình của NNT theo thông báo của CQT" :
                                        loaiTBXoaBo = "2";
                                        break;

                                    }
                                  });
                                },
                                hint: "Loại thông báo(*)",
                                itemsDropdown: lstLoaiTB,
                              ),
                              DropdownInput(
                                value: dropTinhChat,
                                onChangedCustom: (String value){
                                  setState(() {
                                    dropTinhChat = value;
                                    print("dropTinhChat: $dropTinhChat");
                                    switch(dropTinhChat){
                                      case "Giải trình" :
                                        tinhChatXoaBo = thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT78" ? "4" : "1";
                                        break;
                                      case "Hủy có lập hóa đơn thay thế" :
                                        tinhChatXoaBo = "2";
                                        break;
                                      case "Hủy không lập hóa đơn thay thế" :
                                        tinhChatXoaBo = "3";
                                        break;
                                      case "Hủy" :
                                        tinhChatXoaBo = "1";
                                        break;
                                      case "Điều chỉnh" :
                                        tinhChatXoaBo = "2";
                                        break;
                                      case "Thay thế" :
                                        tinhChatXoaBo = "3";
                                        break;
                                    // case "Giải trình" :
                                    //   tinhChatXoaBo = "4";
                                    //   break;
                                    }
                                    print("tinhChatXoaBo: $tinhChatXoaBo");
                                  });
                                },
                                hint: "Tính chất thông báo(*)",
                                itemsDropdown: lstTinhChat,
                              ),
                            ],
                          ): Container(),
                        isTt68 != "TT78" ?
                        Column(
                          children: [
                            type == "10" ?
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 30.h,),
                                  child: TextInput(
                                    haveBorder: true,
                                    // readOnly: true,
                                    // showCursor: false,
                                    textEditingController: tenNguoiMuaController,
                                    hintText: "Tên người mua sau điều chỉnh",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 30.h,),
                                  child: TextInput(
                                    haveBorder: true,
                                    // readOnly: true,
                                    // showCursor: false,
                                    textEditingController: diaChiNguoiMuaController,
                                    hintText: "Địa chỉ người mua sau điều chỉnh",
                                  ),
                                ),
                              ],
                            ): Container(),
                            type == "10" || widget.type == "TCHDXoBo" ? Container() :
                            DropdownInput(
                              value: dropTinhChat,
                              onChangedCustom: (String value){
                                setState(() {
                                  dropTinhChat = value;
                                  print("dropTinhChat: $dropTinhChat");
                                  switch(dropTinhChat){
                                    case "Giải trình" :
                                      tinhChatXoaBo = thaoTacLapTBaoXoaBoResponse.inReq.isTt68 == "TT78" ? "4" : "1";
                                      break;
                                    case "Hủy có lập hóa đơn thay thế" :
                                      tinhChatXoaBo = "2";
                                      break;
                                    case "Hủy không lập hóa đơn thay thế" :
                                      tinhChatXoaBo = "3";
                                      break;
                                    case "Hủy" :
                                      tinhChatXoaBo = "1";
                                      break;
                                    case "Điều chỉnh" :
                                      tinhChatXoaBo = "2";
                                      break;
                                    case "Thay thế" :
                                      tinhChatXoaBo = "3";
                                      break;
                                  // case "Giải trình" :
                                  //   tinhChatXoaBo = "4";
                                  //   break;
                                  }
                                  print("tinhChatXoaBo: $tinhChatXoaBo");
                                });
                              },
                              hint: "Tính chất thông báo(*)",
                              itemsDropdown: lstTinhChat,
                            ),
                          ],
                        ): Container(),
                      ],
                    ),
                  ],
                )
              ],
            ),
            loading ? LoadingWidget() : Container(),
          ],
        ),
        floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 55.sp),
        icon: Icons.add,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: colorPrimary,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: lstSpeedDialChild,
      ) ,
    );
  }

}

