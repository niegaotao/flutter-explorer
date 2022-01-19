import 'package:flutter/material.dart';

class UI {
  static double width = 0;
  static double height = 0;
  static double topOffset = 0;
  static double bottomOffset = 0;

  static final Color mainColor = Color.fromRGBO(235, 235, 235, 1);

  static initialzie(BuildContext context){
    var mq = MediaQuery.of(context);
    width = mq.size.width;
    height = mq.size.height;
    topOffset = mq.padding.top;
    bottomOffset = mq.padding.bottom;
    // ignore: avoid_print
    print("width=$width,height=$height,topOffset=$topOffset,bottomOffset=$bottomOffset");
  }

  static viewController({PreferredSizeWidget? navigationBar, Widget? body}) {
    return Scaffold(
      appBar: navigationBar != null ? PreferredSize(preferredSize: const Size.fromHeight(44), child: navigationBar):null,
      body: body,
    );
  }
}