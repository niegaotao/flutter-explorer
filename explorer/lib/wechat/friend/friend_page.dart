import 'package:explorer/wechat/friend/friend_data.dart';
import 'package:explorer/wechat/discover/discover_page.dart';
import 'package:explorer/wechat/friend/index_bar.dart';
import 'package:flutter/material.dart';
import 'package:explorer/foundation/exui.dart';


class FriendPage extends StatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> with AutomaticKeepAliveClientMixin<FriendPage> {
  Color _themeColor = Color.fromRGBO(235, 235, 235, 1.0);


  final List<Friend> array = [];
  final List<Friend> cells = [];

  final ScrollController _scrollController = ScrollController();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    if(array.isEmpty){
      for (int index = 0; index < Static.funcs.length; index++){
        Friend friend = Static.funcs[index];
        friend.isSeparated = index != Static.funcs.length-1;
      }

      Static.friends.sort((l, r) => l.letter.compareTo(r.letter));
      String letter = "";
      for (int index = 0; index < Static.friends.length; index++) {
        Friend friend = Static.friends[index];
        friend.isLettered = letter != friend.letter;
        if (index + 1 < Static.friends.length) {
          Friend next = Static.friends[index + 1];
          friend.isSeparated = friend.letter == next.letter;
        }
        else {
          friend.isSeparated = false;
        }
        letter = friend.letter;
      }

      array.addAll(Static.funcs);
      array.addAll(Static.friends);

      //每一个cell的偏移，依次累加
      double topOffset = 0;
      for (int index = 0; index < array.length; index++){
        Friend friend = array[index];
        friend.topOffset = topOffset;
        if(friend.isLettered){
          cells.add(friend);
        }
        topOffset = topOffset +  (friend.isLettered ? 88 : 56);
      }

      double space = EXUI.height - EXUI.topOffset - 44 - 50 - 34;
      for (int index = 0; index < array.length; index++){
        Friend friend = array[index];
        double bottomOffset = topOffset - friend.topOffset;//cell距离底部的高度
        if (bottomOffset < space) {
          friend.preferedOffset = friend.topOffset - (space - bottomOffset);
        }
        else {
          friend.preferedOffset = friend.topOffset;
        }
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Size contentSize = Size(30, 15 * Static.indexs.length.toDouble());
    EXUI.initialzie(context);

    return EXUI.viewController(navigationBar:AppBar(title: Text("通讯录", style: TextStyle(color: Colors.black)),
      shadowColor:Color.fromRGBO(0, 0, 0, 0),
      backgroundColor: _themeColor,
      actions: [GestureDetector(
        onTapUp: (detail){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DiscoverPage();
          }));
        },
        child: Container(
          width: 40, height: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 16),
          child: Image(image: AssetImage("assets/菜单-添加好友.png"),width: 22,height: 22,)
          ,),
      )
      ],
    ), body:Stack(
      children: [
        Container(
          color: EXUI.backgroundColor,
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index){
            return Friend.itemForRow(array[index]);
          }, itemCount: array.length,
          ),
        ),

        Positioned(
            right: 0,
            top: 2,
            height: (EXUI.height - EXUI.topOffset - 44 - 50 - 34 - contentSize.height)/2.0,
            child: Container(
              width: 10,
              color: Colors.red,
            )
        ),


        IndexBar(indexBarCallback:(index, value){
          print("选中了${index},${value}");

          for (int __index = 0; __index < cells.length; __index++){
            Friend friend = cells[__index];
            if (friend.letter == value){
              _scrollController.animateTo(friend.preferedOffset, duration: Duration(microseconds: 100), curve: Curves.easeIn);
              break;
            }
          }
        }),

        Positioned(
            right: 0,
            bottom: 2,
            height: (EXUI.height - EXUI.topOffset - 44 - 50 - 34 - contentSize.height)/2.0,
            child: Container(
              width: 10,
              color: Colors.red,
            )
        ),
      ],
    ));
  }
}