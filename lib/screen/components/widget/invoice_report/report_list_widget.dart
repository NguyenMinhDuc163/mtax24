import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

class ReportListWidget extends StatelessWidget {
  final List reportList;
  final bool loading;
  const ReportListWidget({Key key, @required this.reportList, @required this.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return reportList != null && reportList.isNotEmpty
        ? Padding(
        padding: EdgeInsets.only(top: height_24),
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: reportList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(top: height_16),
                child: Container(
                  color: (index + 1) % 2 == 0 ? colorGrey.withOpacity(.3) : Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(height_16),
                    child: Column(
                      children: [
                        ...Iterable.generate(reportList[index].length).map((i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: height_16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(reportList[index].keys.toList()[i].toString(), style: text45sp),
                                Text(reportList[index].values.toList()[i].toString(), style: text45sp),
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    ) : loading ? Container() : Padding(
      padding: EdgeInsets.symmetric(vertical: height_120, horizontal: width_40),
      child: Text("Không có dữ liệu nào thỏa mãn điều kiện", style: text50spBold700Red, textAlign: TextAlign.center),
    );
  }
}
