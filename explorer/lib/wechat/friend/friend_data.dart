import 'package:flutter/material.dart';
import 'package:explorer/foundation/exapp.dart';

class Static {
  static List<Friend> funcs = [
    Friend("assets/单元格-新的朋友.png", "", "新的朋友", ""),
    Friend("assets/单元格-新的朋友.png", "", "仅聊天的朋友", ""),
    Friend("assets/单元格-群聊.png", "", "群聊", ""),
    Friend("assets/单元格-标签.png", "", "标签", ""),
    Friend("assets/单元格-公众号.png", "", "公众号", "")
  ];


  static List<Friend> friends = [
    Friend("", "https://randomuser.me/api/portraits/women/27.jpg", "Lina", "L"),
    Friend("", "https://randomuser.me/api/portraits/women/17.jpg", "菲儿", "F"),
    Friend("", "https://randomuser.me/api/portraits/women/16.jpg", "安莉", "A"),

    Friend("", "https://randomuser.me/api/portraits/men/31.jpg", "阿贵", "A"),
    Friend("", "https://randomuser.me/api/portraits/women/22.jpg", "贝拉", "B"),
    Friend("", "https://randomuser.me/api/portraits/women/37.jpg", "Lina", "L"),


    Friend("", "https://randomuser.me/api/portraits/women/18.jpg", "Nancy", "N"),
    Friend("", "https://randomuser.me/api/portraits/men/47.jpg", "扣扣", "K"),
    Friend("", "https://randomuser.me/api/portraits/men/3.jpg", "Jack", "J"),

    Friend("", "https://randomuser.me/api/portraits/women/5.jpg", "Emma", "E"),
    Friend("", "https://randomuser.me/api/portraits/women/24.jpg", "Abby", "A"),
    Friend("", "https://randomuser.me/api/portraits/men/15.jpg", "Betty", "B"),
    Friend("", "https://randomuser.me/api/portraits/men/13.jpg", "Tony", "T"),

    Friend("", "https://randomuser.me/api/portraits/men/26.jpg", "Jerry", "J"),
    Friend("", "https://randomuser.me/api/portraits/men/36.jpg", "Colin", "C"),
    Friend("", "https://randomuser.me/api/portraits/women/12.jpg", "Haha", "H"),
    Friend("", "https://randomuser.me/api/portraits/women/11.jpg", "Ketty", "K"),
    Friend("", "https://randomuser.me/api/portraits/women/13.jpg", "Lina", "L"),
    Friend("", "https://randomuser.me/api/portraits/women/23.jpg", "Lina", "L"),
    Friend("", "https://randomuser.me/api/portraits/women/27.jpg", "Lina", "L"),
    Friend("", "https://randomuser.me/api/portraits/women/17.jpg", "菲儿", "F"),
    Friend("", "https://randomuser.me/api/portraits/women/16.jpg", "安莉", "A"),

    Friend("", "https://randomuser.me/api/portraits/men/31.jpg", "阿贵", "A"),
    Friend("", "https://randomuser.me/api/portraits/women/22.jpg", "贝拉", "B"),
    Friend("", "https://randomuser.me/api/portraits/women/37.jpg", "Lina", "L"),


    Friend("", "https://randomuser.me/api/portraits/women/18.jpg", "Nancy", "N"),
    Friend("", "https://randomuser.me/api/portraits/men/47.jpg", "扣扣", "K"),
    Friend("", "https://randomuser.me/api/portraits/men/3.jpg", "Jack", "J"),

    Friend("", "https://randomuser.me/api/portraits/women/5.jpg", "Emma", "E"),
    Friend("", "https://randomuser.me/api/portraits/women/24.jpg", "Abby", "A"),
    Friend("", "https://randomuser.me/api/portraits/men/15.jpg", "Betty", "B"),
    Friend("", "https://randomuser.me/api/portraits/men/13.jpg", "Tony", "T"),

    Friend("", "https://randomuser.me/api/portraits/men/26.jpg", "Jerry", "J"),
    Friend("", "https://randomuser.me/api/portraits/men/36.jpg", "Colin", "C"),
    Friend("", "https://randomuser.me/api/portraits/women/12.jpg", "Haha", "H"),
    Friend("", "https://randomuser.me/api/portraits/women/11.jpg", "Ketty", "K"),
    Friend("", "https://randomuser.me/api/portraits/women/13.jpg", "Lina", "L"),
    Friend("", "https://randomuser.me/api/portraits/women/23.jpg", "Lina", "L"),
  ];


  static List<String> indexs = [
    '🔍',
    '☆',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
}

class Friend {
  String icon = "";
  String avatar = "";
  String name = "";
  String letter = "";
  bool isSeparated = false;
  bool isLettered = false;
  double topOffset = 0.0;
  double preferedOffset = 0.0;
  Friend(this.icon, this.avatar, this.name, this.letter);

  static Widget itemForRow(Friend friend) {
    return FriendViewCell(friend);
  }
}

class FriendViewCell extends StatelessWidget {
  final Friend ctxs;
  FriendViewCell(this.ctxs);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: ctxs.isLettered ? 88 : 56,
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                ctxs.isLettered ? Container(
                  color: EXApp.backgroundColor,
                  height: 32,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  alignment: Alignment.centerLeft,
                  child: Text(ctxs.letter, style: TextStyle(fontSize: 14, color: Color.fromRGBO(80, 80, 80, 1))),
                ) : Container(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: ctxs.icon.isNotEmpty ? AssetImage(ctxs.icon) : NetworkImage(ctxs.avatar) as ImageProvider,
                            //Image.network(ctxs.avatar).image,
                          )
                      ),
                    ),
                    Text(ctxs.name, style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(20, 20, 20, 1),
                    ),)
                  ],
                ),
              ],
            ),
            Positioned(
                left: 50,
                right: 0,
                bottom: 0,
                child: Container(
                  height: ctxs.isSeparated ? EXApp.pixel : 0,
                  color: EXApp.separatorColor,
                ))
          ],
        ),
      ),
    );
  }
}
