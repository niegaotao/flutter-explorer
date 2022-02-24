import 'package:flutter/material.dart';
import 'dart:math';
import 'package:explorer/foundation/exui.dart';

class Calculation {
  final random = Random();
  int lhsValue = 0;
  int rhsvalue = 0;
  int value = 0;
  String description = "";
  bool isSecurity = true;
  int createValue(int minValue, int maxValue) {
    if (maxValue > minValue) {
      return minValue + random.nextInt(maxValue - minValue);
    }
    return 0;
  }
}

class EDUAppValue {
  String title = "";
  EDUAppValue({this.title = ""});
}

class EDUApp extends StatefulWidget {
  final EXAction<EDUAppValue> action;
  const EDUApp({Key? key, required this.action}) : super(key: key);

  @override
  _EDUAppState createState() => _EDUAppState();
}

class _EDUAppState extends State<EDUApp> {
  final Calculation calculation = Calculation();

  @override
  void initState() {
    print("operation:${widget.action.operation}");
    this.createCalculation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EXUI.initialzie(context);
    return EXUI.View(
      navigationBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: EXUI.naviForegroundColor),
          onTapUp: (details) {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(widget.action.data?.title ?? "",
            style: TextStyle(color: EXUI.naviForegroundColor)),
        shadowColor: Color.fromRGBO(0, 0, 0, 0),
        backgroundColor: EXUI.naviBackgroundColor,
      ),
      body: Stack(
        children: [
          Container(
            height: EXUI.height - EXUI.topOffset - 44,
            width: EXUI.width,
            padding: EdgeInsets.fromLTRB(0, 0, 0, EXUI.bottomOffset + 44),
            child: Center(
              child: Text(
                this.calculation.description + (this.calculation.isSecurity ? "__" : "${this.calculation.value}"),
                style: TextStyle(fontSize: 60, color: Colors.black),
              ),
            ),
            color: EXUI.foregroundColor,
          ),
          Positioned(
              left: 16,
              right: 16,
              bottom: 34,
              child: Row(children: [
                GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                        height: 40,
                        width: (EXUI.width - 32 - 10)/2.0,
                        color: EXUI.mainColor,
                        child: Center(child: Text(this.calculation.isSecurity ? "显示答案":"隐藏答案", style:TextStyle(color: Colors.white)),)
                    ),
                  ),
                  onTapUp: (detail){
                    this.setState(() {
                      this.calculation.isSecurity = !this.calculation.isSecurity;
                    });
                  },
                ),
                Container(
                  width: 10,
                ),
                GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                        height: 40,
                        width: (EXUI.width - 32 - 10)/2.0,
                        color: EXUI.mainColor,
                        child: Center(child: Text("换一题", style:TextStyle(color: Colors.white)),)
                    ),
                  ),
                  onTapUp: (detail){
                    this.createCalculation();
                  },
                )
              ],)
          )
        ],
      ),
    );
  }

  void createCalculation() {
    if (["+10", "+20", "+100"].contains(widget.action.operation)) {
      calculation.isSecurity = true;
      int maxValue = 10;
      if (widget.action.operation == "+20") {
        maxValue = 20;
      } else if (widget.action.operation == "+100") {
        maxValue = 100;
      }
      //生成被加数
      //0...11 ==> 0...10
      calculation.lhsValue = calculation.createValue(0, maxValue + 1);

      //生成加数
      //4 ==> 0...6  <== 0...7
      calculation.rhsvalue =
          calculation.createValue(0, maxValue - calculation.lhsValue + 1);

      //结果处理
      calculation.value = calculation.lhsValue + calculation.rhsvalue;
      calculation.description =
          "${calculation.lhsValue} + ${calculation.rhsvalue} = ";
      setState(() {});
    }
    else if(["-10", "-20", "-100"].contains(widget.action.operation)){
      calculation.isSecurity = true;

      int maxValue = 10;
      if (widget.action.operation == "-20") {
        maxValue = 20;
      } else if (widget.action.operation == "-100") {
        maxValue = 100;
      }
      //生成被加数
      //0...11 ==> 0...10
      calculation.lhsValue = calculation.createValue(0, maxValue + 1);

      //生成加数
      //4 ==> 0...6  <== 0...7
      calculation.rhsvalue =
          calculation.createValue(0, calculation.lhsValue + 1);

      //结果处理
      calculation.value = calculation.lhsValue - calculation.rhsvalue;
      calculation.description =
      "${calculation.lhsValue} - ${calculation.rhsvalue} = ";
      setState(() {});
    }
  }
}
