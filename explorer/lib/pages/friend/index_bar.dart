import 'package:flutter/material.dart';
import '../pub/ui.dart';
import '../friend/friend_data.dart';

typedef IndexBarCallback = void Function(int index, String value);


class IndexBar extends StatefulWidget {
  final IndexBarCallback? indexBarCallback;

  IndexBar({this.indexBarCallback});

  @override
  _IndexBarState createState() => _IndexBarState();
}
class Selection {
  int index = 0;
  String value = "";
  Selection(this.index, this.value);
}

//获取选中的Item的字符！！
Selection getIndex(BuildContext context, Offset globalPosition) {
  //拿到点前小部件的盒子
  RenderBox box = context.findRenderObject() as RenderBox;
  //拿到y值，globalToLocal当前位置我部件的原点(小部件左上角)的距离（x,y）
  double y = box.globalToLocal(globalPosition).dy;
  //算出字符高度
  var itemHeight = 15;//MediaQuery.of(context).size.height / 2 / Static.indexs.length;
  // //算出第几个item
  int index = (y ~/ itemHeight).clamp(0, Static.indexs.length - 1);

  return Selection(index, Static.indexs[index]);
}

class _IndexBarState extends State<IndexBar> {
  Color _backgroundColor = const Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;
  double _centerY = 7.5;
  String _letter = "";
  bool _indicatorHidden = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> subwidgets = [];
    for (int i = 0; i < Static.indexs.length; i++) {
      subwidgets.add(
          Container(
        width: 30,
        height: 15,
        alignment: Alignment.center,
        child: Text(
          Static.indexs[i],
          style: TextStyle(fontSize: 10, color: _textColor),
        ),
      ));
    }

    Size contentSize = Size(30, 15 * Static.indexs.length.toDouble());
    return Positioned(
      right: 0.0,
      width: 110,
      top: (UI.height - UI.topOffset - 44 - 50 - 34 - contentSize.height)/2.0,
      height: contentSize.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment(0, -1.5),
            margin: EdgeInsets.only(top: _centerY-7.5),
            width: 80,
            height: 30,
            child: _indicatorHidden ? null: Stack(
              alignment: Alignment.center,
              children: [
                Image(image: AssetImage("assets/气泡.png"),
                width: 60,),
                Text(_letter, style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),)
              ],
            ),
          ),
          GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails details) {
              _indicatorHidden = false;
              Selection sel = getIndex(context, details.globalPosition);
              setState(() {
                _centerY = sel.index * 15 + 7.5;
                _letter = sel.value;
              });
              print('选的是${sel.index},${sel.value},centerY=${_centerY}');

              if (widget.indexBarCallback != null) {
                widget.indexBarCallback!(sel.index, sel.value);
              }
            },
            //手指头按下去的时候
            onVerticalDragDown: (DragDownDetails details) {
              Selection sel = getIndex(context, details.globalPosition);
              setState(() {
                _backgroundColor = Color.fromRGBO(1, 1, 1, 0.3);
                _textColor = Colors.white;
              });
              if (widget.indexBarCallback != null) {
                widget.indexBarCallback!(sel.index, sel.value);
              }
              _indicatorHidden = false;
            },
            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                _backgroundColor = Color.fromRGBO(1, 1, 1, 0.0);
                _textColor = Colors.black;
              });
              _indicatorHidden = true;
            },
            child: Container(
              color: _backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: subwidgets,
              ),
            ),
          )
        ],
      ),
    );
  }
}
