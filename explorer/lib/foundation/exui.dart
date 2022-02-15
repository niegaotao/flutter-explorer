import 'package:flutter/material.dart';

class EXUI {
  static double width = 0;
  static double height = 0;
  static double topOffset = 0;
  static double bottomOffset = 0;
  static double pixel = 0.5;


  static Color backgroundColor = Color.fromRGBO(247, 247, 247, 1.0);
  static Color naviBackgroundColor = Color.fromRGBO(255, 255, 255, 1.0);
  static Color naviForegroundColor = Color.fromRGBO(22, 22, 22, 1.0);
  static Color mainColor = Color.fromRGBO(233, 64, 0, 1);

  static Color separatorColor = Color.fromRGBO(240, 240, 240, 1);

  static initialzie(BuildContext context){
    var mq = MediaQuery.of(context);
    width = mq.size.width;
    height = mq.size.height;
    topOffset = mq.padding.top;
    bottomOffset = mq.padding.bottom;
    // ignore: avoid_print
    print("width=$width,height=$height,topOffset=$topOffset,bottomOffset=$bottomOffset");
  }

  static viewController({PreferredSizeWidget? navigationBar, Widget? body, bool separator = true}) {
    return Scaffold(
      appBar: navigationBar != null ? PreferredSize(preferredSize: const Size.fromHeight(44), child:
      Stack(children: [
        navigationBar,
        if(separator)Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: EXUI.pixel,
              color: EXUI.separatorColor,
            )
        )
      ])):null,
      body: body,
    );
  }
}