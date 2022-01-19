

import 'package:flutter/material.dart';
import '../offer/enterprise_list_page.dart';


class Record {
  String icon = "";
  String title = "";
  String subtitle = "";
  String markup = "";
  String operation = "";
  bool isSeparated = true;
  Record({this.icon = "", this.title = "", this.subtitle = "", this.markup = "", this.operation = ""});

  static Color _themeColor = Color.fromRGBO(235, 235, 235, 1.0);

  static Widget itemForRow(BuildContext context, Record record) {
    return  RecordViewcell(record, (ctxs){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return EnterpriseListPage();
      }));
    });
  }

  static Widget separatorForRow(){
    return Container(height: 10, width: 414, color: _themeColor);
  }
}

typedef RecordCallback = void Function(Record ctxs);


class RecordViewcell extends StatelessWidget {
  final Record ctxs;
  final RecordCallback cb;

  RecordViewcell(@required this.ctxs, this.cb);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        print("onTapUp:$ctxs");

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EnterpriseListPage();
        }));

      },
      child: Container(
        color: Colors.white,
        height: 56,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: AssetImage(ctxs.icon), width: 20),
                  SizedBox(width: 10),
                  Text(ctxs.title, style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(20, 20, 20, 1),
                  ),),
                  Expanded(child: Container()),
                  ctxs.subtitle.length > 0
                      ? Text(ctxs.subtitle, style: TextStyle(fontSize: 15),)
                      : Container(),
                  ctxs.markup.length > 0
                      ? Image(image: AssetImage(ctxs.markup), width: 8)
                      : Container(),
                  Image(image: AssetImage("assets/icon_right.png"), width: 16)
                ],
              ),
            ),
            Positioned(
                left: 50,
                right: 0,
                bottom: 0,
                child: Container(
                  height: ctxs.isSeparated ? 1 : 0,
                  color: Color.fromRGBO(240, 240, 240, 1),
                ))
          ],
        ),
      ),
    );
  }
}
