import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {

  //在widget中我们重载Widget build(BuildContext context)函数，返回创建的widget
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(44),
      color: Colors.yellow,
      child: Text(
          "Hello Flutter",
          textAlign:TextAlign.center,
          textDirection:TextDirection.ltr,
          style: TextStyle(
          color: Colors.red,
          fontSize: 40,
        )
      )
    );
  }
}