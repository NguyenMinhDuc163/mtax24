import 'package:flutter/cupertino.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:mtax24/screen/components/widget/input_widget/calendar_input.dart';

class SelectDateWidget extends StatelessWidget {
  final TextEditingController fromDateController, toDateController;
  final Function onFromDateSelect, onToDateSelect;
  final bool canSelectDate;
  const SelectDateWidget({Key key, @required this.fromDateController, @required this.toDateController, @required this.onFromDateSelect, @required this.onToDateSelect, this.canSelectDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height_24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: CalendarInput(
                haveBorder: true,
                title: "Từ ngày",
                textDateController: fromDateController,
                onClickChooseDate: (_){
                  print('=========vao day');
                  onFromDateSelect(_);
                },
                canSelectDate: canSelectDate,
              )),
          SizedBox(width: width_100,),
          Expanded(
              child: CalendarInput(
                haveBorder: true,
                title: "Đến ngày",
                textDateController: toDateController,
                onClickChooseDate: (_) {
                  onToDateSelect(_);
                },
                canSelectDate: canSelectDate,
              )),
        ],
      ),
    );
  }
}
