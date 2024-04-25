import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import 'package:easy_localization/easy_localization.dart';

double widgetBottomHeight = 120.h;

class DialogTwoButtonCustom extends StatelessWidget {
  final String title;
  final String content;
  final Function onClickSubmit;
  final Function onClickCancel;
  final String textSubmit;
  final String textCancel;
  final BuildContext contextDialog;
  final bool isTranslateContent;

  const DialogTwoButtonCustom({
    Key key,
    this.title,
    this.content,
    this.onClickSubmit,
    this.onClickCancel,
    this.textSubmit,
    this.textCancel,
    this.contextDialog,
    this.isTranslateContent = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
                child: Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize_48sp,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 32.h, bottom: 64.h, left: 56.w, right: 56.w),
            child: Center(
                child: Text(
                  "${content}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize_40sp,
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
          Container(
            height: 2.h,
            color: Colors.black26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (onClickCancel != null) {
                        onClickCancel();
                      }
                      Navigator.pop(contextDialog);
                    },
                    child: Container(
                        height: widgetBottomHeight,
                        child: Center(
                            child: Text(
                              "${textCancel != null ? textCancel : "${"media.skip".tr()}"}",
                              style: TextStyle(
                                color: colorlabelInputCombobox,
                                fontSize: fontSize_48sp,
                              ),
                            ))),
                  ),
                ),
              ),
              Container(
                height: widgetBottomHeight,
                color: Colors.black26,
                width: 2.w,
              ),
              Expanded(
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (onClickSubmit != null) {
                        onClickSubmit();
                      }
                      Navigator.pop(contextDialog);
                    },
                    child: Container(
                        height: widgetBottomHeight,
                        child: Center(
                            child: Text(
                              "${textSubmit != null ? textSubmit : "${"logOut.ok".tr()}"}",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: fontSize_48sp,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DialogOneButtonCustom extends StatelessWidget {
  final String title;
  final String content;
  final Function onClickSubmit;
  final String textSubmit;
  final BuildContext contextDialog;
  final bool isTranslateContent;

  const DialogOneButtonCustom(
      {Key key,
        this.title,
        this.content,
        this.onClickSubmit,
        this.textSubmit,
        this.contextDialog,
        this.isTranslateContent = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width_24),
      ),
      backgroundColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: height_40),
            child: Center(
                child: Text(
                  "$title",
                  style: text18Bold500,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height_32, bottom: height_64, left:width_56 , right: width_56),
            child: Center(
                child: Text(
                  "${content}",
                  style: text16Bold400,
                  textAlign: TextAlign.justify,
                )),
          ),
          Container(
            height: height_2,
            color: Colors.black26,
          ),
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: InkWell(
              onTap: () {
                if (onClickSubmit != null) {
                  onClickSubmit();
                }else{
                  Navigator.pop(contextDialog);
                }
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width_40),
                  height: widgetBottomHeight,
                  child: Center(
                      child: Text(
                        "${textSubmit != null ? textSubmit : "${"logOut.yes".tr()}"}",
                        style: text_action_font18,
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
