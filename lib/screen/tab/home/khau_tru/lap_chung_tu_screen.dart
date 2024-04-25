import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:mtax24/controller/controller.dart';
import 'package:mtax24/model/model.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/dropdown_input.dart';
import 'package:mtax24/screen/components/widget/input_widget/text_input.dart';
import 'package:mtax24/screen/tab/home/tra_cuu_hoa_don/component/item_filter.dart';
import 'package:mtax24/service/init.dart';

import '../../../init_view.dart';

class LapChungTuScreen extends StatefulWidget with GetItStatefulWidgetMixin{

  @override
  State<StatefulWidget> createState() => _LapChungTuScreenState();

}
class _LapChungTuScreenState extends State<LapChungTuScreen> with GetItStateMixin {

  TextEditingController nameController = TextEditingController();
  TextEditingController mstController = TextEditingController();
  TextEditingController quocTichController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController soCMNDController = TextEditingController();
  TextEditingController noiCapController = TextEditingController();
  TextEditingController khoanDongBHController = TextEditingController();
  TextEditingController tongThuNhapChiuThueKhauTruController = TextEditingController();
  TextEditingController tongThuNhapTinhThueController = TextEditingController();
  TextEditingController soThueThuNhapCaNhanKhauTruController = TextEditingController();
  TextEditingController soThueThuNhapCaNhanConNhanController = TextEditingController();


  var dropType;
  List<String> lstDropType = ["Cá nhân cư trú", "Cá nhân không cư trú"];



  var controller = GetIt.I<ThongTinNguoiMuaController>();

  String taxCode = "", fax = "", htPayment = "TM";
  CreateCustomerApiResponse createCustomerApiResponse;
  bool isPayment = false;
  bool isSaveInfo = false;
  bool fingerToggle = true;
  bool isTrangThai = false;
  UserResponse userResponse;
  List<SpeedDialChild> lstSpeedDialChild = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropType = lstDropType.first;
    getUserInfo();
    lstSpeedDialChild.add(
      SpeedDialChild(
        child: Icon(Icons.edit),
        backgroundColor: colorPrimary,
        label: 'Ký',
        onTap: () {

        },
      ),
    );
    lstSpeedDialChild.add(
      SpeedDialChild(
          child: Icon(Icons.save),
          backgroundColor: colorPrimary,
          label: 'Lưu',
          onTap: () {

          }
      ),
    );
  }

  void getUserInfo() async {
    final user = await SharePreferUtils.getUserInfo();
    setState(() {
      userResponse = user;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final loading = watchX((ThongTinNguoiMuaModel x) => x.loading);

    return Scaffold(
      body: Stack(
          children: [
            AppbarScreen(
              title: 'Lập chứng từ', isShowHome: true, isShowBack: true,
              heightTop: EdgeInsets.only(top: 700.h),
              heightBackgroundTop: 570.h,
              childrenAppBar: [
                ItemFilterTB("Tên tổ chức trả thu nhập:", "${userResponse.nick.isNotEmpty ? userResponse.nick : ""}"),
                Padding(
                  padding: EdgeInsets.only(top: 10.h,),
                  child: ItemFilterTB("Ngày lập chứng từ:", "Ngày ${DateTime.now().day} Tháng ${DateTime.now().month} Năm ${DateTime.now().year}"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h,),
                  child: ItemFilterTB("Mã số thuế:", "${userResponse.tin.isNotEmpty ? userResponse.tin : ""}"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h,),
                  child: ItemFilterTB("Địa chỉ:", "${userResponse.addr.isNotEmpty ? userResponse.addr : ""}"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h,),
                  child: ItemFilterTB("Điện thoại:", "${userResponse.tel.isNotEmpty ? userResponse.tel : ""}"),
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
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextFieldNormalInput(
                            isRequired: false,
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: nameController,
                            hintText: "Họ và tên",
                            // textInputAction: TextInputAction.done,
                            onSubmittedCustom: (value) {
                              controller.getCustomerInfoByUserId(
                                  CustomerInfoByUserIdRequest(
                                    customerCode: nameController.text,
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
                            textEditingController: quocTichController,
                            hintText: "Quốc tịch",
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: DropdownInput(
                            value: dropType,
                            onChangedCustom: (String value){
                              setState(() {
                                dropType = value;
                              });
                            },
                            hint: "Loại hình cư trú",
                            itemsDropdown: lstDropType,
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
                            textEditingController: phoneController,
                            hintText: "Số điện thoại",
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: soCMNDController,
                            hintText: "CMND/CCCD/Hộ chiếu",
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textEditingController: noiCapController,
                            hintText: "Nơi cấp",
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: true,
                            showCursor: true,

                            hintText: "Tiền lương, tiền công",
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textInputType: TextInputType.number,
                            textEditingController: khoanDongBHController,
                            hintText: "Khoản đóng bảo hiểm bắt buộc",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textInputType: TextInputType.number,
                            textEditingController: tongThuNhapChiuThueKhauTruController,
                            hintText: "Tổng thu nhập chịu thuế phải khấu trừ",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textInputType: TextInputType.number,
                            textEditingController: tongThuNhapTinhThueController,
                            hintText: "Tổng thu nhập tính thuế",
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textInputType: TextInputType.number,
                            textEditingController: soThueThuNhapCaNhanKhauTruController,
                            hintText: "Số thuế thu nhập cá nhân đã khấu trừ",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: TextInput(
                            haveBorder: true,
                            readOnly: isTrangThai,
                            showCursor: isTrangThai,
                            textInputType: TextInputType.number,
                            textEditingController: soThueThuNhapCaNhanConNhanController,
                            hintText: "Số thuế thu nhập cá nhân còn nhận được",
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
        ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 55.sp),
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
