import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {

  Widget _itemForIndex(BuildContext context, int index) {
    String url = 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn.sinaimg.cn%2Fgx%2Ftransform%2F72%2Fw527h345%2F20180523%2FtJIx-haysvix2265576.jpg&refer=http%3A%2F%2Fn.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1637504804&t=1ef00f13f22b6fa383cdfd9d7b226eee';

    return Container(
      height:100,
      color: Colors.white,
      child: Column(
          children: [
            Image.network(url, width: 390, height: 80, fit: BoxFit.fill),
            Text('$index')
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: _itemForIndex, itemCount:60);
  }
}