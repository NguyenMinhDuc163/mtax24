import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';

import '../button_bottom_not_stack_widget.dart';

class DropdownInput extends StatelessWidget {
  final String title, hint, value;
  final List<String> itemsDropdown;
  final bool haveBorder, haveNotUnderline;
  final Function onChangedCustom;
  final String trangThai;

  const DropdownInput(
      {Key key,
      this.title,
      this.hint,
      this.value,
      @required this.itemsDropdown,
      this.haveBorder,
      this.onChangedCustom, this.haveNotUnderline,
      this.trangThai
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height_32),
      child: InputDecorator(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                right: width_24, left: width_24, top: height_24),
            border: haveBorder != null && haveBorder == false
                ? null
                : OutlineInputBorder(),
            labelText: hint ?? "",
            labelStyle: TextStyle(color: Colors.grey.shade800)),
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          underline: haveNotUnderline == null || haveNotUnderline ? Container() : null,
          items: itemsDropdown.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value == null ? "" : value,
                  overflow: TextOverflow.visible),
            );
          }).toList(),
          onChanged: (trangThai == 'SUCC') ? null : (_) {
            FocusScope.of(context).requestFocus(new FocusNode());
            onChangedCustom(_);
          },
        ),
      ),
    );
  }
}


class DropDownDialog extends StatelessWidget {
  final String title, value;
  final List<String> itemsDropdown;
  final bool haveBorder;
  final Function onChangedCustom;

  const DropDownDialog(
      {Key key,
      this.title,
      @required this.value,
      @required this.itemsDropdown,
      this.haveBorder,
      @required this.onChangedCustom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height_38),
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          showModalBottomSheet<void>(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width_32, vertical: height_24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        itemsDropdown.isNotEmpty
                            ? Expanded(
                              child: Align(
                                alignment: Alignment(0, 1),
                                child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: ListView.builder(
                                          padding: EdgeInsets.symmetric(vertical: height_40),
                                          shrinkWrap: true,
                                          itemCount: itemsDropdown.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return InkWell(
                                              onTap: () {
                                                onChangedCustom(itemsDropdown[index].toString());
                                                Navigator.of(context).pop();
                                              },
                                              child: Column(
                                                children: [
                                                  Center(
                                                      child: Padding(
                                                          padding: EdgeInsets.only(
                                                              top: index == 0
                                                                  ? 0
                                                                  : height_24,
                                                              bottom: index ==
                                                                      itemsDropdown
                                                                              .length -
                                                                          1
                                                                  ? 0
                                                                  : height_24,
                                                              right: width_40,
                                                              left: width_40),
                                                          child: Text(
                                                            itemsDropdown[index],
                                                            style: value ==
                                                                    itemsDropdown[index]
                                                                        .toString()
                                                                ? text45spBold700ColorBackground
                                                                : text45spColorBackground,
                                                            textAlign: TextAlign.center,
                                                          ))),
                                                  index == itemsDropdown.length - 1
                                                      ? Container()
                                                      : Divider(
                                                          thickness: 1,
                                                        ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                              ),
                            )
                            : Container(),
                        ButtonBottomNotStackWidget(
                          marginTop: height_24,
                          radius: 10,
                          color: Colors.white,
                          title: "Bỏ qua",
                          onPressed: () => Navigator.pop(context),
                          textStyle: text45spBold700ColorBackground,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width_38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(title ?? "", style: text45sp)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Text(
                          value ?? itemsDropdown[0].toString(),
                          style: text45sp,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                        )),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          size: icon_60sp,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height_24,
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
