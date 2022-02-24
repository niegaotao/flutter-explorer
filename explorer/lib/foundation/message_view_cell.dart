import 'package:explorer/foundation/exui.dart';
import 'package:flutter/material.dart';
import 'package:explorer/remote/remoteapp.dart';

class Message {
  int id = 0;
  String avatar = "";
  String name = "";
  String message = "";
  String createAt = "";
  bool isBlocked = false;

  Message({this.id = 0, this.avatar = "", this.name = "", this.message = "", this.createAt = "", this.isBlocked = false});

  factory Message.fromMap(Map map){
    return Message(
        createAt: "2018-12-01",
        name:map["name"] as String,
        message: map["message"] as String,
        avatar: map["avatar"] as String);
  }

  static Widget itemForRow(BuildContext context, Message message) {
    return  MessageViewCell(message, (ctxs){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return RemoteApp();
      }));
    });
  }
}

typedef MessageCallback = void Function(Message ctxs);

class MessageViewCell extends StatelessWidget {
  final Message ctxs;
  final MessageCallback cb;

  MessageViewCell(@required this.ctxs, this.cb);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (detail){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return RemoteApp();
        }));
      },
      child: Container(
        color: Colors.white,
        height: 56,
        width: EXUI.width,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16),

                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image(image: NetworkImage(ctxs.avatar), width: 44,height: 44,),//AssetImage("assets/Hank.png")
                ),

                SizedBox(width: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: EXUI.width-70-16,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(ctxs.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(50, 50, 50, 1)),),
                            Text(ctxs.createAt, style: TextStyle(fontSize: 13, color: Color.fromRGBO(120, 120, 120, 1)),)
                          ]),
                    ),
                    Container(
                      width: EXUI.width-70-16,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(ctxs.message,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 13, color: Color.fromRGBO(120, 120, 120, 1)),
                                  overflow: TextOverflow.ellipsis)),
                            if(ctxs.isBlocked)Image(image: AssetImage("assets/其它-免打扰.png"), width: 16),
                          ]),
                    )

                  ],
                ),
              ],
            ),
            Positioned(
                left: 70,
                right: 0,
                bottom: 0,
                child: Container(
                  height: EXUI.pixel,
                  color: EXUI.separatorColor,
                ))
          ],
        ),
      ),
    );
  }
}
