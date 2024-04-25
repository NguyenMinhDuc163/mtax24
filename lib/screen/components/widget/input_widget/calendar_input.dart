import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class CalendarInput extends StatefulWidget {
  final String title, errorText;
  final bool haveBorder, canSelectDate;
  final TextEditingController textDateController;
  final Function onClickChooseDate;

  const CalendarInput(
      {Key key,
        this.title,
        @required this.textDateController,
        this.errorText,
        this.haveBorder,
        @required this.onClickChooseDate, this.canSelectDate})
      : super(key: key);

  @override
  _CalendarInputState createState() => _CalendarInputState();
}

class _CalendarInputState extends State<CalendarInput> {
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();
  bool isErrorDate = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      widget.onClickChooseDate(DateFormat("dd/MM/yyyy").format(selectedDate).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height_32),
          child: TextField(
            controller: widget.textDateController,
            readOnly: true,
            decoration: InputDecoration(
                isDense: true,
                suffixIcon: Icon(Icons.calendar_today_outlined,
                    color: widget.errorText == null
                        ? Colors.grey.shade600
                        : Colors.red.shade800),
                errorText: widget.errorText,
                labelText: widget.title,
                labelStyle: TextStyle(color: Colors.grey.shade800),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorPrimaryLogin, width: 0.5,)),
                border: widget.haveBorder == null || widget.haveBorder == false
                    ? null
                    : OutlineInputBorder()),
            onTap: () {
              if(widget.canSelectDate == null || widget.canSelectDate) {
                _selectDate(context);
              }
            },
          ),
        )
      ],
    );
  }
}
