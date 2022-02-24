import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


typedef EXActionHandler = void Function(String operation, Object? data);

class EXAction<Data>{
  String operation;
  Data? data;
  EXActionHandler? completion;
  EXAction({required this.operation, this.data, this.completion});
}

class EXUI {
  static double x = 0;
  static double y = 0;
  static double width = 0;
  static double height = 0;
  static double topOffset = 0;
  static double bottomOffset = 0;
  static double pixel = 0.5;

  static Color backgroundColor = Color.fromRGBO(247, 247, 247, 1.0);
  static Color foregroundColor = Color.fromRGBO(255, 255, 255, 1.0);

  static Color naviBackgroundColor = Color.fromRGBO(255, 255, 255, 1.0);
  static Color naviForegroundColor = Color.fromRGBO(22, 22, 22, 1.0);
  static Color mainColor = Color.fromRGBO(233, 64, 0, 1);

  static Color separatorColor = Color.fromRGBO(240, 240, 240, 1);

  static EXUI center = EXUI();
  final MethodChannel router = MethodChannel("explorer");

  static BuildContext? entry = null;

  static initialzie(BuildContext context){
    var query = MediaQuery.of(context);
    width = query.size.width;
    height = query.size.height;
    topOffset = query.padding.top;
    bottomOffset = query.padding.bottom;
    // ignore: avoid_print
    print("width=$width,height=$height,topOffset=$topOffset,bottomOffset=$bottomOffset");
  }

  static View({PreferredSizeWidget? navigationBar, Widget? body, bool separator = true}) {
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

  static StackView({PreferredSizeWidget? navigationBar, Widget? contentView, Widget? footerView,bool separator = true}) {
    return Scaffold(
      appBar: navigationBar != null ? PreferredSize(preferredSize: const Size.fromHeight(44), child:
      Stack(children: [
        navigationBar,
        if(separator) Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: EXUI.pixel,
              color: EXUI.separatorColor,
            )
        )
      ])):null,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          if(contentView != null) contentView,
          if(footerView != null) footerView
        ]
      ),
    );
  }
}