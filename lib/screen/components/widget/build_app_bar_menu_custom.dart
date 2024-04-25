import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mtax24/screen/components/styles/style.dart';
import '../../init_view.dart';
import 'marquee_widget.dart';

Widget buildAppBarMenuCustom(
  BuildContext context,
  String title,
  {
    showLogOut = false,
    showHome = false,
    bool showBack,
    isSave = false,
    numberNotification = 0,
    isCreate = false,
    showSearch = false,
    Function onBack,
    Function onSearch,
    Function onCreate,
    Function onSave,
    IconData icon,
    GlobalKey<ScaffoldState> key,
}) {
  return AppBar(
    actionsIconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
    iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
    flexibleSpace: Container(
      // color: Colors.white,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: <Color>[color_background, color406BAC])),
    ),

    leading: key == null || showBack == true
        ? IconButton(
            icon: Icon(icon == null ? Icons.arrow_back : icon),
            color: Theme.of(context).primaryColorLight,
            onPressed: () {
              if (onBack == null) {
                Navigator.pop(context);
              } else {
                onBack();
              }
            })
        : Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: InkWell(
                onTap: () {
                  // GetIt.I<UserController>().userInfo();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => ThayDoiThongTinScreen()),
                  // );
                },
                child: SizedBox()
            ),
          ),
    elevation: 0,
    title: MarqueeWidget(
            child: Text(title ?? "", style: text20Bold500White),
          ),
    centerTitle: true,
    actions: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 0),
          child: showLogOut
              ? InkWell(
                  onTap: () {
                    DialogAlert.logOut(context);
                  },
                  child: IconButton(icon: Icon(Icons.logout, color: Colors.white,), onPressed: (){})
                )
              : showHome == true
                  ? IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => MenuPage()));
                      })
              : showSearch == true ?
                  IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () => onSearch)
              : isCreate ? InkWell(
            child: IconButton(icon: Icon(Icons.add_circle_outline, color: Colors.white,), onPressed: (){},),
            onTap: onCreate,
          ) : isSave ? InkWell(
            child: IconButton(icon: Icon(Icons.check_circle, color: Colors.white,), onPressed: (){
              onSave();
            }),
            onTap: (){
              onSave();
            },
          ) :
          Container()
      ),


    ],

  );
}
