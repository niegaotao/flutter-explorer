import 'package:flutter/material.dart';
import 'dart:math';
import 'package:explorer/foundation/exapp.dart';

class EXCalculatorValue {
  int value = 0;
  String description = "";
}

class EXCalculator {
  final random = Random();
  EXCalculatorValue value = EXCalculatorValue();
  EXCalculatorValue otherValue = EXCalculatorValue();
  EXCalculatorValue operator = EXCalculatorValue();
  EXCalculatorValue returnValue = EXCalculatorValue();
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
  final EXAction<EDUAppValue> ctxs;
  const EDUApp({Key? key, required this.ctxs}) : super(key: key);

  @override
  _EDUAppState createState() => _EDUAppState();
}

class _EDUAppState extends State<EDUApp> {
  final EXCalculator calculation = EXCalculator();

  @override
  void initState() {
    action(this.widget.ctxs.operation, null, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EXApp.initialize(context);
    String value = calculation.description + (calculation.isSecurity ? "__" : "${calculation.returnValue.value}");
    if(widget.ctxs.operation == "word"){
      value = calculation.description;
    }
    return EXApp.View(
      navigationBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: EXApp.naviForegroundColor),
          onTapUp: (details) {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(widget.ctxs.data?.title ?? "",
            style: TextStyle(color: EXApp.naviForegroundColor)),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
        backgroundColor: EXApp.naviBackgroundColor,
      ),
      body: Stack(
        children: [
          Container(
            height: EXApp.height - EXApp.topOffset - 44,
            width: EXApp.width,
            padding: EdgeInsets.fromLTRB(0, 0, 0, EXApp.bottomOffset + 44),
            child: Center(
              child: Text(
                  value,
                style: const TextStyle(fontSize: 60, color: Colors.black),
                  textAlign: TextAlign.center
              ),
            ),
            color: EXApp.foregroundColor,
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
                        width: (EXApp.width - 32 - 10)/2.0,
                        color: EXApp.mainColor,
                        child: Center(child: Text(calculation.isSecurity ? "显示答案":"隐藏答案", style:TextStyle(color: Colors.white)),)
                    ),
                  ),
                  onTapUp: (detail){
                    setState(() {
                      calculation.isSecurity = !calculation.isSecurity;
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
                        width: (EXApp.width - 32 - 10)/2.0,
                        color: EXApp.mainColor,
                        child: Center(child: Text("换一题", style:TextStyle(color: Colors.white)),)
                    ),
                  ),
                  onTapUp: (detail){
                    action(widget.ctxs.operation, null, null);
                  },
                )
              ],)
          )
        ],
      ),
    );
  }

  void action(String operation, dynamic data, EXActionHandler? completion){
    if(["10", "20", "100"].contains(operation)){
      calculation.operator.value = calculation.createValue(0, 2);// 0,1
      if(calculation.operator.value == 1){
        action("+" + operation, data, completion);
      }
      else if(calculation.operator.value == 0){
        action("-" + operation, data, completion);
      }
      else {
        print("程序出错了");
      }
    }
    else if (["+10", "+20", "+100"].contains(operation)) {
      calculation.isSecurity = true;
      int maxValue = 10;
      if (operation == "+20") {
        maxValue = 20;
      } else if (operation == "+100") {
        maxValue = 100;
      }
      //生成被加数
      //0...11 ==> 0...10
      calculation.value.value = calculation.createValue(0, maxValue + 1);

      //生成加数
      //4 ==> 0...6  <== 0...7
      calculation.otherValue.value = calculation.createValue(0, maxValue - calculation.value.value + 1);

      //结果处理
      calculation.returnValue.value = calculation.value.value + calculation.otherValue.value;
      calculation.description = "${calculation.value.value} + ${calculation.otherValue.value} = ";
      setState(() {});
    }
    else if(["-10", "-20", "-100"].contains(operation)){
      calculation.isSecurity = true;

      int maxValue = 10;
      if (operation == "-20") {
        maxValue = 20;
      } else if (operation == "-100") {
        maxValue = 100;
      }
      //生成被加数
      //0...11 ==> 0...10
      calculation.value.value = calculation.createValue(0, maxValue + 1);

      //生成加数
      //4 ==> 0...6  <== 0...7
      calculation.otherValue.value = calculation.createValue(0, calculation.value.value + 1);

      //结果处理
      calculation.returnValue.value = calculation.value.value - calculation.otherValue.value;
      calculation.description = "${calculation.value.value} - ${calculation.otherValue.value} = ";
      setState(() {});
    }
    else if(widget.ctxs.operation == "word"){
      int maxValue = 234;
      calculation.isSecurity = true;

      //生成被加数
      //0...11 ==> 0...10
      calculation.value.value = calculation.createValue(0, maxValue);

      //生成加数
      //4 ==> 0...6  <== 0...7
      calculation.otherValue.value = 0;

      //结果处理
      calculation.returnValue.value = 0;
      calculation.description = EXApp.words[calculation.value.value];
      setState(() {});
    }
  }
}
