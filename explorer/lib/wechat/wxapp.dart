
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:explorer/wechat/chat/chat_page.dart';
import 'package:explorer/wechat/friend/friend_page.dart';
import 'package:explorer/wechat/discover/discover_page.dart';
import 'package:explorer/wechat/owner/owner_page.dart';

class WXApp extends StatefulWidget {
  const WXApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WXAppState();
  }
}

class WXAppState extends State<WXApp> {
  int _currentIndex = 0;
  final _pages = [const ChatPage(), const FriendPage(), const DiscoverPage(), const OwnerPage()] ;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0),
        ),
        home: Scaffold(
          body: PageView(
            controller: _controller,
            children: _pages,
            physics: NeverScrollableScrollPhysics(),/*可以禁止左右拖拽*/
            onPageChanged: (index){
              print("index");
              setState(() {
                _currentIndex = index;
              });
            }/*拖拽后页面变动+ _controller.jumpToPage也会触发该变动*/,
          ),
          bottomNavigationBar: PreferredSize(
              preferredSize: const Size.fromHeight(30.0),
              child:BottomNavigationBar(
                backgroundColor:Colors.white,/*整个底部导航的背景色*/
                selectedFontSize: 12,/*选中的字号大小*/
                selectedItemColor: Colors.green,/*选中的文字颜色*/
                unselectedFontSize: 12,/*未选中的字号大小*/
                unselectedItemColor: Colors.grey,/*选中的字号大小*/
                //fixedColor: Colors.yellowAccent,/*不能和selectedItemColor同时出现*/
                type: BottomNavigationBarType.fixed,/*固定在页面的底部*/
                currentIndex: _currentIndex,//当前选中的索引
                enableFeedback: false,
                onTap: (index){
                  setState(() {
                    _currentIndex = index;
                    _controller.jumpToPage(_currentIndex);
                  });
                },/*点击回调*/
                items: const [
                  //icon:Image(width:24, height:24, image:AssetImage('images/tab.png'))
                  BottomNavigationBarItem(
                      icon: Image(image: AssetImage("assets/tabbar_chat.png"), width: 24, height:24),
                      activeIcon: Image(image: AssetImage("assets/tabbar_chat_hl.png"), width: 24, height:24),
                      label: "微信"),
                  BottomNavigationBarItem(
                      icon: Image(image: AssetImage("assets/tabbar_friends.png"), width: 24, height:24),
                      activeIcon: Image(image: AssetImage("assets/tabbar_friends_hl.png"), width: 24, height:24),
                      label: "通讯录"),
                  BottomNavigationBarItem(
                      icon: Image(image: AssetImage("assets/tabbar_discover.png"), width: 24, height:24),
                      activeIcon: Image(image: AssetImage("assets/tabbar_discover_hl.png"), width: 24, height:24),
                      label: "发现"),
                  BottomNavigationBarItem(
                      icon: Image(image: AssetImage("assets/tabbar_mine.png"), width: 24, height:24),
                      activeIcon: Image(image: AssetImage("assets/tabbar_mine_hl.png"), width: 24, height:24),
                      label: "我")
                ],
              )
          ),
        ),
        builder: (context, widget) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!);
        }
    );
  }
}