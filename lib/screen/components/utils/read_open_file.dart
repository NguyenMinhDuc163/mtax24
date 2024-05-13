import 'dart:convert';
import 'dart:io';

import 'package:mtax24/screen/components/utils/utils.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';

class ReadOpenFile {
  final String base64Data;
  final String filename;
  Future<void> readExcelFile(String base64Data,String filename) async {
    Directory directory;

    if (Platform.isAndroid) {
      directory=await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      directory=await getApplicationDocumentsDirectory();
    }
    File file = new File(directory.path + "/$filename" + ".pdf");
    await file.writeAsBytes(Base64Decoder().convert(base64Data),
        flush: true);
    OpenFile.open(file.path);
  }
  ReadOpenFile(this.base64Data,this.filename){
    // readExcelFile(base64Data,filename);
    Utils.saveAndOpenBase64ByPDF(base64Data,nameFile: filename);
  }
}