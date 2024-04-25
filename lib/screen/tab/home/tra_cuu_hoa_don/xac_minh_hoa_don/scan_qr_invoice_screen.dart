import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mtax24/controller/tra_cuu_hoa_don/verify_invoice_controller.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/utils/dialog_alert.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRInvoiceScreen extends StatefulWidget {
  static const String routeName = "/ScanQRInvoiceScreen";
  const ScanQRInvoiceScreen({Key key}) : super(key: key);

  @override
  _ScanQRInvoiceScreenState createState() => _ScanQRInvoiceScreenState();
}

class _ScanQRInvoiceScreenState extends State<ScanQRInvoiceScreen> {
  QRViewController controller;
  var verifyInvoiceController = GetIt.I<VerifyInvoiceController>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? width_600
        : width_800;
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            alignment: Alignment(0, 0),
            children: [
              QRView(
                key: GlobalKey(debugLabel: 'QR'),
                onQRViewCreated: (controller) {
                  this.controller = controller;
                  controller.scannedDataStream.listen((scanData) {
                    List<String> qrCodeDecode = scanData.code.split("|");
                    if(scanData.code == null || scanData.code.split("|").length < 7 || qrCodeDecode[8] == null || qrCodeDecode[8].isEmpty) {
                      Navigator.of(context).pop();
                      DialogAlert.showDialogAlert(context, "Mã QR không hợp lệ");
                    } else {
                      verifyInvoiceController.verifyInvoice(context, qrCode: qrCodeDecode[8]);
                    }
                    controller.pauseCamera();
                  });
                },
                overlay: QrScannerOverlayShape(
                    overlayColor: Colors.transparent,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: size
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width_40),
                child: Container(
                  height: size,
                  width: size,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size / 8,
                            width: size / 8,
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.red, width: width_8),
                                    left: BorderSide(color: Colors.red, width: width_8)
                                )
                            ),
                          ),
                          Container(
                            height: size / 8,
                            width: size / 8,
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.red, width: width_8),
                                  right: BorderSide(color: Colors.red, width: width_8),
                                )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size / 8,
                            width: size / 8,
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.red, width: width_8),
                                  left: BorderSide(color: Colors.red, width: width_8),
                                )
                            ),
                          ),
                          Container(
                            height: size / 8,
                            width: size / 8,
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.red, width: width_8),
                                  right: BorderSide(color: Colors.red, width: width_8),
                                )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width_56, vertical: height_50),
                    child: Text("Vui lòng cho mã QR vào khung hình. Tiến trình quét sẽ diễn ra tự động", style: text43spWhite, textAlign: TextAlign.center,),
                  ))
          )
        ],
      ),
    );
  }
}
