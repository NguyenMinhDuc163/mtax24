// import 'package:flutter/material.dart';
//
// class Test extends StatefulWidget {
//   const T({super.key});
//
//   @override
//   State<T> createState() => _TState();
// }
//
// class _TState extends State<T> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(right: 20.h),
//                 child: Icon(Icons.assignment_outlined, color: color_background, size: 88.sp,),
//               ),
//
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     list[index].mstNgMua.isEmpty && list[index].tendvinmua.isEmpty ?
//                     SizedBox() :
//                     list[index].mstNgMua.isEmpty ?
//                     Text("${list[index].tendvinmua}", textAlign: TextAlign.start, style: text_action_Bold600) :
//                     list[index].tendvinmua.isEmpty ?
//                     Text("${list[index].mstNgMua}", textAlign: TextAlign.start, style: text_action_Bold600) :
//                     Text("${list[index].mstNgMua} - ${list[index].tendvinmua}", textAlign: TextAlign.start, style: text_action_Bold600),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10.h),
//                       child: Text(list[index].ngayLapHoaDon, textAlign: TextAlign.start, style: text12OpacityBold400),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10.h),
//                       child: list[index].tinhChat == "04" ?
//                       Text("${list[index].adjustType == "-" ? list[index].adjustType : ""} ${list[index].tongTienThanhToan == null || list[index].tongTienThanhToan == "" ? "0" : Utils.covertToMoney(double.parse(list[index].tongTienThanhToan))} ${list[index].matte}", style: text14Red400, textAlign: TextAlign.start,):
//                       Text("${list[index].tongTienThanhToan == null || list[index].tongTienThanhToan == "" ? "0" : Utils.covertToMoney(double.parse(list[index].tongTienThanhToan))} ${list[index].matte}", style: text14Red400, textAlign: TextAlign.start,),
//                     ),
//                   ],
//                 ),
//                 flex: 2,
//               ),
//
//               Expanded(
//
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text("Số hóa đơn", style: text12OpacityBold400,),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10.h),
//                       child: Text("${list[index].soHoaDonDoanhNghiep}", style: text16Bold600,),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10.h),
//                       child: Text("${Utils.convertStatusThongBao(list[index].trangThai)}",
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: list[index].trangThai == "NEWR" ? color2981DA :
//                           list[index].trangThai == "CKNG" || list[index].trangThai == "CCQT" ? colorYellow100 :
//                           list[index].trangThai == "SUCC" ? color219653 : colorD12129,
//                           fontWeight: FontWeight.w400,
//                         ),
//
//                       ),
//                     ),
//                   ],
//                 ),
//                 flex: 1,
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
//             child: Divider(),
//           )
//         ],
//       ),
//     );
//   }
// }
