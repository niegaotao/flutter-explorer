import 'dart:async';
import 'dart:convert';

import 'package:explorer/foundation/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:explorer/foundation/message_view_cell.dart';
import 'package:explorer/foundation/toast.dart';
import 'package:http/http.dart' as http;
import '../../future/http_manager.dart';
import '../chat/search_page.dart';
import 'package:explorer/company/enterprise_list_page.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin<ChatPage> {
  Color _themeColor = Color.fromRGBO(235, 235, 235, 1.0);
  List<Message> _messages = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  Timer? _timer;
  int _count = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    if(_timer != null && _timer!.isActive){
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   _count = _count + 1;
    //   print(_count);
    //   if(_count >= 100){
    //     timer.cancel();
    //   }
    // });

    //获取网络数据
    getHistory().then((value){
      var messages = _messages;
      messages.addAll(value);
      setState(() {
        _messages = messages;
      });
    });
  }

  Future<List<Message>> getHistory() async {
    //map => json
    //final mapValue = { 'name':"1234", 'age':12,};
    //final jsonValue = json.encode(mapValue)

    //json => map
    //final mapValue = json.decode(jsonValue)



    //final url = Uri.parse("http://rap2api.taobao.org/app/mock/293419/startup/index");
    //final url = Uri.parse("http://rap2api.taobao.org/app/mock/256798/api/chat_list");
    final String string = "http://rap2api.taobao.org/app/mock/293419/im/records";
    final url = Uri.parse(string);
    //final response = await http.get(url);
    final response = await HTTPManager.get(string, null);

    //print(response.statusCode);
    //print(response.body);
    //print(response.data);

    if (response.statusCode == 200){
      //final responseBody = json.decode(response.body);
      final responseBody = response.data;
      List messageMaps = responseBody["messages"];
      List<Message> chatList = messageMaps.map<Message>((value) => Message.fromMap(value)).toList();
      return chatList;
    }
    else {
      throw Exception("statusCode:${response.statusCode}");
    }
  }

  Widget buildPopupMenuItem(String image, String name){
    return Row(children: [Image(image: AssetImage(image), width: 20, height: 20,),
    SizedBox(width: 10,)
    ,Text(name, style: TextStyle(fontSize: 15, color: Colors.white),)]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    EXUI.initialzie(context);
    return EXUI.viewController(
        navigationBar:AppBar(
      centerTitle: true,
      title: Text("微信", style: TextStyle(color: EXUI.naviForegroundColor)),
      shadowColor:Color.fromRGBO(0, 0, 0, 0),
      backgroundColor: EXUI.naviBackgroundColor,
      actions: [
        Container(margin: EdgeInsets.only(right: 16),
        child: PopupMenuButton(
            color: Color.fromRGBO(0, 0, 0, 0.65),
            offset: Offset(0, 44),
            child: Image(image: AssetImage("assets/菜单-添加.png"),width: 22,height: 22,),
            itemBuilder: (BuildContext context){
              return <PopupMenuItem<String>>[
                PopupMenuItem(child: buildPopupMenuItem("assets/菜单-发起群聊.png", "发起群聊"),onTap:(){
                  print("----");
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SearchPage();
                  }));
                }),
                PopupMenuItem(child: buildPopupMenuItem("assets/菜单-添加朋友.png", "添加朋友"),),
                PopupMenuItem(child: buildPopupMenuItem("assets/菜单-扫一扫.png", "扫一扫"),),
                PopupMenuItem(child: buildPopupMenuItem("assets/菜单-收付款.png", "收付款"),)];
            }),),
      ],
    ),
        body:Container(
            child: _messages.isEmpty ? Center(child:Text("正在加载")):
            ListView.builder(itemCount:_messages.length,
                itemBuilder:(BuildContext context,int index){
                  return Message.itemForRow(context, _messages[index]);
            }),
    ));
  }
}


// FutureBuilder(
// future: getHistory(),
// builder: (BuildContext context, AsyncSnapshot snapshot){
// if (snapshot.connectionState == ConnectionState.waiting){
// return Center(child: Text("正在加载"),);
// }
// else {
// return ListView(
// children: snapshot.data.map<Widget>((Message message){
// return Message.itemForRow(context, message);
// }),
// );
// }
// },
// )