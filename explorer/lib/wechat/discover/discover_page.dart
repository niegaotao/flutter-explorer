

import 'package:explorer/wechat/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:explorer/wechat/profile/profile_page.dart';
import 'package:explorer/company/enterprise_list_page.dart';
import 'package:explorer/foundation/record_view_cell.dart';
import 'package:explorer/foundation/exui.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with AutomaticKeepAliveClientMixin<DiscoverPage> {
  Color _themeColor = Color.fromRGBO(235, 235, 235, 1.0);

  List records = List.from([
    Record(icon: "assets/单元格-朋友圈.png", title: "朋友圈", subtitle: "新的消息", markup: "assets/badge.png", operation: ""),
    Record(icon: "assets/单元格-朋友圈.png", title: "视频号", subtitle: "", markup: "", operation: ""),/*!*/
    Record(icon: "assets/单元格-扫一扫.png", title: "扫一扫", subtitle: "", markup: "", operation: ""),
    Record(icon: "assets/单元格-摇一摇.png", title: "摇一摇", subtitle: "", markup: "", operation: ""),
    Record(icon: "assets/单元格-朋友圈.png", title: "看一看", subtitle: "", markup: "", operation: ""),/*!*/
    Record(icon: "assets/单元格-搜一搜.png", title: "搜一搜", subtitle: "", markup: "", operation: ""),
    Record(icon: "assets/单元格-附近的人.png", title: "直播和附近", subtitle: "", markup: "", operation: ""),
    Record(icon: "assets/单元格-购物.png", title: "购物", subtitle: "", markup: "", operation: ""),
    Record(icon: "assets/单元格-游戏.png", title: "游戏", subtitle: "", markup: "", operation: ""),
    Record(icon: "assets/单元格-小程序.png", title: "小程序", subtitle: "", markup: "", operation: ""),

  ]);

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    for (int index = 0; index < records.length; index++){
      Record record = records[index];
      record.isSeparated = [2, 4,7].contains(index);
    }
    EXUI.initialzie(context);

    return EXUI.viewController(navigationBar:
        AppBar(title: Text("发现", style: TextStyle(color: Colors.black)),
            shadowColor:Color.fromRGBO(0, 0, 0, 0),
            backgroundColor: _themeColor),
        body:Container(
          color: _themeColor,
          child: ListView(
            children: [
              Record.itemForRow(context, records[0]),
              Record.separatorForRow(),
              Record.itemForRow(context, records[1]),
              Record.separatorForRow(),
              Record.itemForRow(context, records[2]),
              Record.itemForRow(context, records[3]),
              Record.separatorForRow(),
              Record.itemForRow(context, records[4]),
              Record.itemForRow(context, records[5]),
              Record.separatorForRow(),
              Record.itemForRow(context, records[6]),
              Record.separatorForRow(),
              Record.itemForRow(context, records[7]),
              Record.itemForRow(context, records[8]),
              Record.separatorForRow(),
              Record.itemForRow(context, records[9]),
            ],
          ),
        )
    );
  }
}