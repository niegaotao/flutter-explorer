// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:explorer/foundation/record_view_cell.dart';
import 'package:explorer/wechat/profile/profile_page.dart';
import 'package:explorer/company/enterprise_list_page.dart';
import 'package:explorer/foundation/record_view_cell.dart';
import 'package:explorer/foundation/exui.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class OwnerPage extends StatefulWidget {
  const OwnerPage({Key? key}) : super(key: key);

  @override
  _OwnerPageState createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage>  with AutomaticKeepAliveClientMixin<OwnerPage> {
  Color _themeColor = Color.fromRGBO(235, 235, 235, 1.0);
  MethodChannel mc = MethodChannel("pages/owner");
  List records = List.from([
    Record(
        icon: "assets/单元格-支付.png",
        title: "支付",
        subtitle: "",
        markup: "",
        operation: ""),
    Record(
        icon: "assets/单元格-收藏.png",
        title: "收藏",
        subtitle: "",
        markup: "",
        operation: ""),
    Record(
        icon: "assets/单元格-相册.png",
        title: "朋友圈",
        subtitle: "",
        markup: "",
        operation: ""),
    Record(
        icon: "assets/单元格-卡包.png",
        title: "卡包",
        subtitle: "",
        markup: "",
        operation: ""),
    Record(
        icon: "assets/单元格-表情.png",
        title: "表情",
        subtitle: "",
        markup: "",
        operation: ""),
    Record(
        icon: "assets/单元格-设置.png",
        title: "设置",
        subtitle: "",
        markup: "",
        operation: ""),
  ]);

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  //File? _file = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mc.setMethodCallHandler((call) {
      if(call.method == "image") {
        print(call.arguments);
        String str = call.arguments.toString().substring(7);
        setState(() {
          //_file = File(str);
        });
      }
      return Future((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    for (int index = 0; index < records.length; index++){
      Record record = records[index];
      record.isSeparated = [1,2,3].contains(index);
    }


    return EXUI.viewController(
        navigationBar:null,
        body:Container(
      color: _themeColor,
      child: Stack(
        children: [
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: [
                  headerWidget(),
                  Record.separatorForRow(),
                  Record.itemForRow(context, records[0]),
                  Record.separatorForRow(),
                  Record.itemForRow(context, records[1]),
                  Record.itemForRow(context, records[2]),
                  Record.itemForRow(context, records[3]),
                  Record.itemForRow(context, records[4]),
                  Record.separatorForRow(),
                  Record.itemForRow(context, records[5])
                ],
              )),
          Positioned(
              top: 48,
              right: 20,
              child: Image(image: AssetImage("assets/其它-相机.png"), width: 24))
        ],
      ),
    ));
  }

  Widget headerWidget() {
    return GestureDetector(
      onTapUp: (details) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EnterpriseListPage();
        }));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16, 120, 16, 30),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    mc.invokeMapMethod("choosePicture");
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    // child: _file == null ? Image(image:  AssetImage("assets/Hank.png"), width: 60):Image(image: FileImage(_file!), width: 60),
                    child: Image(image:  AssetImage("assets/Hank.png"), width: 60),

                  ),
                ),
                Container(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flutter 软件开发",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 5,
                    ),
                    Text(
                      "微信号:1234",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                Expanded(child: Container()),
                Container(
                    child: Image(
                        image: AssetImage("assets/其它-我的二维码.png"), width: 28)),
                Container(
                    child: Image(
                        image: AssetImage("assets/icon_right.png"), width: 16))
              ],
            ),
            Row(children: [
              Container(width: 70),
              Container(
                height: 24,
                width: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  border: Border.all(width: 1, color: Colors.grey)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.add, size: 20, color: Colors.grey,), Text("添加", style: TextStyle(fontSize: 12, color: Colors.grey),)],),
              ),
              Container(width: 10),
              Container(
                height: 24,
                width: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    border: Border.all(width: 1, color: Colors.grey)
                ),
                child: Image(
                    image: AssetImage("assets/微信-更多.png"), width: 16),
              )
            ])
          ],
        )
      ),
    );
  }
}
