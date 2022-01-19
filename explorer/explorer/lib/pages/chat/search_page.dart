import 'package:flutter/material.dart';
import '../pub/ui.dart';


class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Color _themeColor = Color.fromRGBO(235, 235, 235, 1.0);

  Widget build(BuildContext context) {

    return UI.viewController(navigationBar:AppBar(title: Text("通讯录", style: TextStyle(color: Colors.black)),
      shadowColor:Color.fromRGBO(0, 0, 0, 0),
      backgroundColor: _themeColor,
      actions: [GestureDetector(
        onTapUp: (detail){
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
      children: [],
    ));
  }
}
