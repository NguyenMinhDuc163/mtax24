import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class SearchDateWidget extends StatelessWidget {
  final String fromDate, toDate;
  final Function onSearchFunction;
  const SearchDateWidget({Key key, @required this.fromDate, @required this.toDate, @required this.onSearchFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  color: colorF2F2F2,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              padding: const EdgeInsets.all(16),
              child: Text("$fromDate - $toDate", style: text16Bold400,),
            )
        ),
        Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () => onSearchFunction(),
                icon: Icon(Icons.filter_alt_outlined, size: 45,)
            )
        )
      ],
    );

    //   Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Row(
    //       children: [
    //         Text("Từ: ", style: text45sp,),
    //         Text(fromDate, style: text45sp),
    //       ],
    //     ),
    //     Row(
    //       children: [
    //         Text("Đến: ", style: text45sp),
    //         Text(toDate, style: text45sp),
    //       ],
    //     ),
    //     InkWell(
    //         onTap: () => onSearchFunction(),
    //         child: Icon(Icons.search)
    //     )
    //   ],
    // );
  }
}
