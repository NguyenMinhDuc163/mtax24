import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Horizontal Layout Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: HorizontalLayout(),
        ),
      ),
    );
  }
}

class HorizontalLayout extends StatefulWidget {
  @override
  _HorizontalLayoutState createState() => _HorizontalLayoutState();
}

class _HorizontalLayoutState extends State<HorizontalLayout> {
  String dropdownValue = '1';
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              hint: Text("Loại tiền"),
              items: <String>['1', '2'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(width: 16), // Khoảng cách giữa Dropdown và TextField
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Số điện thoại',
              ),
              keyboardType: TextInputType.phone,
              maxLength: 16,
            ),
          ),
        ),
      ],
    );
  }
}
