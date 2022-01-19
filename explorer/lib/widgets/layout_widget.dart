import 'package:flutter/material.dart';


class LayoutWidget extends StatelessWidget {
  static const type = "AspestRatio";
  @override
  Widget build(BuildContext context) {
    /*Row，Column, Stack*/
    /*主轴：MainAxisAlignment----
    * start:
    * center:
    * end:
    * spaceBetween:剩余的空间分配到控件之间
    * spaceAround:剩下的空间平均分配都小部件周围
    * spaceEvenly:剩下的空间和小部件一起分
    **/

    /*交叉轴：CrossAxisAlignment
    start:
    center:
    end:
    baseline:文本对齐
    stretch：拉满
    * */

    /*Row： Expanded平分宽度，设置容器宽度无效*/
    /*Column: Expanded平分高度，设置容器高度不小*/
    if (type == "Row") {
      return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: 400,
        height: 400,
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(color: Colors.red, child: Text("Xyz",style: TextStyle(fontSize: 100))),
            Container(color: Colors.blue, child: Text("Xyz",style: TextStyle(fontSize: 50))),
            Container(color: Colors.white, child: Text("Xyz",style: TextStyle(fontSize: 25))),
            // Container(color: Colors.red, child: Icon(Icons.add, size:80)),
            // Container(color: Colors.blue, child: Icon(Icons.ac_unit, size:40)),
            // Container(color: Colors.white, child: Icon(Icons.alarm, size:20)),
          ],
        ),
      );
    }
    else if (type == "Column") {
      return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: 400,
        height: 400,
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(color: Colors.red, child: Text("Xyz",style: TextStyle(fontSize: 100))),
            Container(color: Colors.blue, child: Text("Xyz",style: TextStyle(fontSize: 50))),
            Container(color: Colors.white, child: Text("Xyz",style: TextStyle(fontSize: 25))),
            // Container(color: Colors.red, child: Icon(Icons.add, size:80)),
            // Container(color: Colors.blue, child: Icon(Icons.ac_unit, size:40)),
            // Container(color: Colors.white, child: Icon(Icons.alarm, size:20)),
          ],
        ),
      );
    }
    else if (type == "Stack") {
      return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: 400,
        height: 400,
        color: Colors.yellow,

        alignment: Alignment(0, -1),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(color: Colors.red, child: Icon(Icons.add, size:80)),
            Container(color: Colors.blue, child: Icon(Icons.ac_unit, size:40)),
            Container(color: Colors.white, child: Icon(Icons.alarm, size:20)),
          ],
        ),
      );
    }
    else if (type == "Expanded") {

    }
    else if(type == "Positioned"){
      //margin:相对于父视图
      //padding:约束自身子组件
      //

    }
    else if(type == "AspestRatio") {
      return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: 400,
        height: 400,
        color: Colors.yellow,
        alignment: Alignment(0, 0),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: AspectRatio(aspectRatio:1/2, child: Container(color: Colors.red)),
        ),
      );
    }
    return Container(
        width: 400,
        height: 400,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        color: Colors.yellow,
    );
  }
}