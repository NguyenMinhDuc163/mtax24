import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/service/api_service/request/lap_hoa_don/create_customer_api_request.dart';
import 'package:mtax24/service/api_service/request/lap_hoa_don/get_info_customer_by_code_request.dart';
import 'package:mtax24/service/init.dart';

import '../../../init_view.dart';

class ThongTinNguoiMuaScreen extends StatefulWidget with GetItStatefulWidgetMixin{
  final String maKH;
  final String mst;
  final String trangThai;
  final String flag;
  final String idHD;
  final CreateCustomerApiResponse thongTinUser;
  final TraCuuHoaDonChiTietResponse chiTietResponse;


  ThongTinNguoiMuaScreen({this.maKH, this.mst, this.trangThai, this.flag, this.idHD, this.thongTinUser, this.chiTietResponse});

  @override
  State<StatefulWidget> createState() => _ThongTinNguoiMuaState();

}
class _ThongTinNguoiMuaState extends State<ThongTinNguoiMuaScreen> with GetItStateMixin {

  TextEditingController maKHController = TextEditingController();
  TextEditingController mstController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController unitNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController exchangeRateController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();

  var dropTypePayment, dropTypeMoney;
  List<String> lstDropTypePayment = [];
  List<String> lstDropTypeMoney = [];
  List<LstPaymentWay> lstPaymentWay = [];



  var controller = GetIt.I<ThongTinNguoiMuaController>();

  String taxCode = "", fax = "", htPayment = "TM";
  CreateCustomerApiResponse createCustomerApiResponse;
  bool isPayment = false;
  bool isSaveInfo = false;
  bool fingerToggle = true;
  bool isTrangThai = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exchangeRateController.text = "1";
    print("trangThai: ${widget.trangThai}");
    if(widget.trangThai != null){
      if(widget.trangThai == "NEWR"){
        isTrangThai = false;
      }else{
        isTrangThai = true;

      }
    }
    print("isTrangThai : $isTrangThai");
    if(widget.mst != null && widget.mst != ""){
      initDataUser();
      controller.getInfoCustomerByCode(GetInfoCustomerByCodeRequest(
        taxCode: widget.mst,
        flag: widget.flag,
        idHD: widget.idHD,
      ));
      controller.getDMucNHangTTe(DMucNHangTTeRequest(
        isTraCuu: "isTraCuu",
        mstNban: widget.mst,
      ));
    }else if(widget.maKH != null && widget.maKH != ""){
      if(widget.thongTinUser != null){
        createCustomerApiResponse = widget.thongTinUser;
        maKHController.text = createCustomerApiResponse.maKH != null ? createCustomerApiResponse.maKH : "";
        mstController.text = createCustomerApiResponse.customerTaxcode != null ? createCustomerApiResponse.customerTaxcode : "";
        nameController.text = createCustomerApiResponse.tenNguoiMua != null ? createCustomerApiResponse.tenNguoiMua : "";
        unitNameController.text = createCustomerApiResponse.customerCompany != null ? createCustomerApiResponse.customerCompany : "";
        addressController.text = createCustomerApiResponse.customerAddress != null ? createCustomerApiResponse.customerAddress : "";
        emailController.text = createCustomerApiResponse.customerEmail != null ? createCustomerApiResponse.customerEmail : "";
        phoneController.text = createCustomerApiResponse.customerTelephone != null ? createCustomerApiResponse.customerTelephone : "";
      }else {
        maKHController.text = widget.maKH;
        controller.getCustomerInfoByUserId(CustomerInfoByUserIdRequest(
          customerCode: widget.maKH,
        ));
      }
      SharePreferUtils.getUserInfo().then((value) {
        taxCode = value.tin;
        controller.getDMucNHangTTe(DMucNHangTTeRequest(
          isTraCuu: "isTraCuu",
          mstNban: taxCode,
        ));
      });
    }else {
      initDataUser();
      SharePreferUtils.getUserInfo().then((value) {
        taxCode = value.tin;
        controller.getDMucNHangTTe(DMucNHangTTeRequest(
          isTraCuu: "isTraCuu",
          mstNban: taxCode,
        ));
      });
    }
  }

 void initDataUser(){
   if(widget.chiTietResponse != null && widget.thongTinUser != null){
     // TODO khoi tao gia tri ban dau neu co thong tin
     createCustomerApiResponse = widget.thongTinUser;
     TraCuuHoaDonChiTietResponse chiTietResponse= widget.chiTietResponse;
     maKHController.text = createCustomerApiResponse.maKH != null ? createCustomerApiResponse.maKH : "";
     mstController.text =  (createCustomerApiResponse.customerTaxcode != null) ? createCustomerApiResponse.customerTaxcode : chiTietResponse.mstnmua;
     nameController.text = createCustomerApiResponse.tenNguoiMua != null ? createCustomerApiResponse.tenNguoiMua : chiTietResponse.tennmua;
     unitNameController.text = chiTietResponse.dchinmua != null ? chiTietResponse.dchinmua : "";
     addressController.text = (createCustomerApiResponse.customerAddress != null) ? createCustomerApiResponse.customerAddress : chiTietResponse.dchinmua;
     emailController.text = chiTietResponse.emailnmua != null ? chiTietResponse.emailnmua : "";
     phoneController.text = createCustomerApiResponse.customerTelephone != null ? createCustomerApiResponse.customerTelephone : "";
   }
 }
  String getInitials(String text) {
    // Xóa các ký tự đặc biệt và loại bỏ khoảng trắng thừa
    String cleanedText = text.replaceAll(RegExp(r'[^a-zA-Z\s]'), '').trim();

    // Tách các từ dựa trên khoảng trắng
    List<String> words = cleanedText.split(RegExp(r'\s+'));

    // Lấy ký tự đầu tiên của mỗi từ và chuyển thành chữ hoa
    String initials = words.map((word) => word[0].toUpperCase()).join();

    return initials;
  }

  @override
  Widget build(BuildContext context) {
    TraCuuHoaDonChiTietResponse chiTietResponse= widget.chiTietResponse;
    // TODO: implement build
    registerHandler((ThongTinNguoiMuaModel x) => x.lstDMucNH, (context, DMucNHangTTeResponse response, cancel) {
      if(response != null){
        if(response.dmucTTe.isNotEmpty){
          lstDropTypeMoney = response.dmucTTe;
        }
        if(response.lstPaymentWay.isNotEmpty){
          lstPaymentWay = response.lstPaymentWay;
          response.lstPaymentWay.forEach((element) {
            setState(() {
              lstDropTypePayment.add(element.displayName);
            });
          });
          // Todo test gan tien
          dropTypePayment = "Tiền mặt";
          lstDropTypePayment.forEach((element) {
            if(getInitials(element) == chiTietResponse.hthuctoan){
              dropTypePayment = element;
            }
          });
        }
        if(createCustomerApiResponse != null){
          for(int i =0; i< lstPaymentWay.length; i++){
            if(createCustomerApiResponse.typePayment == lstPaymentWay[i].code){
              dropTypePayment = lstDropTypePayment[i].toString();
            }
          }
          // dropTypeMoney = createCustomerApiResponse.typeMoney;
          dropTypeMoney = (createCustomerApiResponse.typeMoney == null) ? chiTietResponse.matte : createCustomerApiResponse.typeMoney;
        }else{
          dropTypePayment = lstDropTypePayment.first.toString();
          dropTypeMoney = lstDropTypeMoney.first.toString();
        }
      }
    });

    registerHandler((ThongTinNguoiMuaModel x) => x.lstCustomerInfoByUserId, (context, CustomerInfoByUserIdResponse list, cancel) {
      if(list != null){
        print("################## da di vao 2");
        fax = list.customerFax;
        unitNameController.text = list.customerCompany;
        mstController.text = list.customerTaxcode;
        maKHController.text = list.customerCode;
        addressController.text = list.customerAddress;
        emailController.text = list.customerEmail;
        phoneController.text = list.customerTelephone;
        accountNumberController.text = list.bankAccount;
        accountNameController.text = list.bankName;
        nameController.text = list.customerName != null ? list.customerName : "";
      }
    });
    registerHandler((ThongTinNguoiMuaModel x) => x.lstCreateCustomer, (context, CreateCustomerApiResponse object, cancel) {
      if(object != null){
        createCustomerApiResponse = object;
        isSaveInfo = true;
        createCustomerApiResponse.maKH = maKHController.text;
        createCustomerApiResponse.typePayment = htPayment;
        createCustomerApiResponse.typeMoney = dropTypeMoney;
        createCustomerApiResponse.soTk = accountNumberController.text;
        createCustomerApiResponse.tenNguoiMua = nameController.text;
        createCustomerApiResponse.customerTaxcode = mstController.text;
        createCustomerApiResponse.customerEmail = emailController.text;
        createCustomerApiResponse.customerAddress = addressController.text;
        createCustomerApiResponse.customerTelephone = phoneController.text;
        // TODO test
        // createCustomerApiResponse.typePayment = dropTypePayment;
        // createCustomerApiResponse.typeMoney = dropTypeMoney;
        // DialogAlert.showDialogAlertCancel(context, "Lưu thông tin thành công");
        Toast.showLongTop("Lưu thông tin thành công");
        if (!isSaveInfo) {

          createCustomerApiResponse = CreateCustomerApiResponse(
              maKH: maKHController.text,
              typePayment: htPayment,
              // typePayment: dropTypePayment,
              typeMoney: dropTypeMoney,
              soTk: accountNumberController.text,
              tenNH: accountNameController.text,
              tenNguoiMua: nameController.text,
              customerTaxcode: mstController.text,
              customerCompany: unitNameController.text,
              customerAddress: addressController.text,
              customerEmail: emailController.text,
              customerTelephone: phoneController.text
          );
        }
        Navigator.pop(context, createCustomerApiResponse);
      }
    });
    registerHandler((ThongTinNguoiMuaModel x) => x.getInfoCustomerByCode, (context, GetInfoCustomerByCodeResponse response, cancel) {
      if(response != null){
        //luu thong tin.
        if(widget.mst != null && widget.mst != ""){
          // TODO chua biet y nghia -> thay
          // mstController.text = widget.mst;
          // nameController.text = widget.tenNMua ;
        }
        fax = response.fax;
        unitNameController.text = response.tenNnt;
        addressController.text = response.motaDiachi;
        emailController.text = response.email;
        phoneController.text = response.dienThoai;
      }
    });
    final loading = watchX((ThongTinNguoiMuaModel x) => x.loading);

    return Scaffold(
        body: Stack(
          children: [
            CustomerAppbarScreen(title: 'Thông tin người mua', isShowBack: true, isShowHome: false, isCreate: false, isSave: !isTrangThai,
              onSave: (){
                if(fingerToggle){
                  if(maKHController.text == null && maKHController.text == ""){
                    DialogAlert.showDialogAlertCancel(context, "Vui lòng nhập mã khách hàng!");
                  }else if(mstController.text == null && mstController.text == ""){

                    DialogAlert.showDialogAlertCancel(context, "Vui lòng nhập mã số thuế!");
                  } else {
                    controller.createCustomerAPI(
                        CreateCustomerApiRequest(
                          idHDon: (widget.idHD != "0") ? widget.idHD: "",
                          // taxCode: taxCode,
                          taxCode: mstController.text,
                          customerAddress: addressController
                              .text,
                          customerCode: maKHController.text,
                          customerCompany: unitNameController
                              .text,
                          customerEmail: emailController
                              .text,
                          customerFax: fax,
                          customerName: nameController.text,
                          customerTaxcode: mstController
                              .text,
                          customerTelephone: phoneController
                              .text,
                        ));

                  }
                }else {
                  if (!isSaveInfo) {
                    createCustomerApiResponse = CreateCustomerApiResponse(
                        maKH: maKHController.text,
                        typePayment: htPayment,
                        typeMoney: dropTypeMoney,
                        soTk: accountNumberController.text,
                        tenNH: accountNameController.text,
                        tenNguoiMua: nameController.text,
                        customerTaxcode: mstController.text,
                        customerCompany: unitNameController.text,
                        customerAddress: addressController.text,
                        customerEmail: emailController.text,
                        customerTelephone: phoneController.text

                    );
                  }
                  Navigator.pop(context, createCustomerApiResponse);
                }
              },
              children: [
                CardWidget(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextFieldNormalInput(
                            isRequired: false,
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: maKHController,
                            hintText: "Mã khách hàng",
                            // textInputAction: TextInputAction.done,
                            onSubmittedCustom: (value) {
                              controller.getCustomerInfoByUserId(
                                  CustomerInfoByUserIdRequest(
                                    customerCode: maKHController.text,
                                  ));
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFieldNormalInput(
                                  isRequired: false,
                                  haveBorder: true,
                                  readOnly: isTrangThai,
                                  showCursor: isTrangThai,
                                  textEditingController: mstController,
                                  hintText: "Mã số thuế",
                                  onSubmittedCustom: (values){
                                    if(!Utils.validateMst(mstController.text)){
                                      DialogAlert.showDialogAlertCancel(context, "Mã số thuế sai cấu trúc!");
                                    }else {
                                      controller.getInfoCustomerByCode(GetInfoCustomerByCodeRequest(
                                        taxCode: values,
                                        flag: widget.flag,
                                        idHD: widget.idHD,
                                      ));
                                    }

                                  },

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: nameController,
                            hintText: "Tên người mua",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: unitNameController,
                            hintText: "Tên đơn vị",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: addressController,
                            hintText: "Địa chỉ",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: emailController,
                            hintText: "Email",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: phoneController,
                            hintText: "Số điện thoại",
                            textInputType: TextInputType.phone,
                            maxLength: 16,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: DropdownInput(
                            value: dropTypePayment,
                            onChangedCustom: (String value){
                              setState(() {
                                dropTypePayment = value;
                                for(int i = 0; i < lstDropTypePayment.length; i++){
                                  if(dropTypePayment == lstDropTypePayment[i].toString()){
                                    htPayment = lstPaymentWay[i].code;
                                  }
                                }
                                if(dropTypePayment == lstDropTypePayment[1].toString() || dropTypePayment == lstDropTypePayment[2].toString()){
                                  isPayment = true;
                                }else{
                                  isPayment = false;
                                }
                              });
                            },
                            hint: "Hình thức thanh toán",
                            itemsDropdown: lstDropTypePayment,
                            trangThai: widget.trangThai,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: DropdownInput(
                            value: dropTypeMoney,
                            onChangedCustom: (String value){
                              setState(() {
                                dropTypeMoney = value;
                              });
                            },
                            hint: "Loại tiền",
                            itemsDropdown: lstDropTypeMoney,
                            trangThai: widget.trangThai,
                          ),
                        ),

                        // Padding(
                        //   padding: EdgeInsets.only(top: 40.h),
                        //   child: TextInput(
                        //     haveBorder: true,
                        //     readOnly: true,
                        //     showCursor: false,
                        //     textEditingController: exchangeRateController,
                        //     hintText: "Tỉ giá",
                        //   ),
                        // ),
                        isPayment ?
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: TextInput(
                                haveBorder: true,
                                readOnly: isTrangThai,
                                showCursor: isTrangThai,
                                textEditingController: accountNumberController,
                                hintText: "Số tài khoản người mua",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: TextInput(
                                haveBorder: true,
                                readOnly: isTrangThai,
                                showCursor: isTrangThai,
                                textEditingController: accountNameController,
                                hintText: "Tên ngân hàng người mua",
                              ),
                            ),
                          ],
                        ): Container(),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text("Lưu vào danh sách thông tin người mua", style: text14Bold400,)
                              ),
                              CupertinoSwitch(
                                activeColor: color_background,
                                value: fingerToggle,
                                onChanged: (value) {
                                  setState(() {
                                    fingerToggle = value;
                                    print("fingerToggle: $fingerToggle");
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                  ],
                ),
              ],
            ),
            loading ? LoadingWidget() : Container()
          ],
        )
    );
  }
}
