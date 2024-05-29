import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/utils/share_prefer_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  String _savedPIN = "";

  @override
  void initState() {
    super.initState();
    _loadSavedPIN();
  }

  // Lấy dữ liệu đã lưu từ SharedPreferences
  _loadSavedPIN() async {
    String pin = await SharePreferUtils.getPIN();
    setState(() {
      _savedPIN = pin ?? "No PIN saved";
    });
  }

  // Lưu dữ liệu vào SharedPreferences
  _savePIN() async {
    await SharePreferUtils.savePIN(_controller.text);
    _loadSavedPIN(); // Cập nhật giao diện sau khi lưu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter PIN"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _savePIN();
              },
              child: Text("Save PIN"),
            ),
            SizedBox(height: 20),
            Text("Saved PIN: $_savedPIN"),
          ],
        ),
      ),
    );
  }
}
