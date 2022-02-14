// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:explorer/company/enterprise_page.dart';

class EnterpriseListPage extends StatefulWidget {
  const EnterpriseListPage({Key? key}) : super(key: key);

  @override
  _EnterpriseListPageState createState() => _EnterpriseListPageState();
}

class _EnterpriseListPageState extends State<EnterpriseListPage> {
  @override
  List items = List.from([]);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
            onTapUp: (details){
              Navigator.pop(context);
            },
          ),
          title: Text("2020校园招聘精选岗位推荐",
              style: TextStyle(color: Colors.black)
          ),
          shadowColor:Color.fromRGBO(0, 0, 0, 0),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
      body: ListView.separated(
        itemBuilder: itemForRow,
        separatorBuilder: separatorForRow,
        itemCount: 4,
      )
    );
  }

  Widget itemForRow(BuildContext context, int index) {
    return GestureDetector(
      onTapUp: (detail){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EnterprisePage();
        }));
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic209.nipic.com%2Ffile%2F20190310%2F18383466_163939408907_2.jpg&refer=http%3A%2F%2Fpic209.nipic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1638069408&t=bae01053899185c979cf473f82921d13",
                      width: 58,
                      height: 58,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("武汉心动校招科技有限公司",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      Text("100-400人 B轮融资 互联网",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(100, 101, 102, 1)),
                      ),
                      Text("成都，北京 武汉 深圳",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(100, 101, 102, 1)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Wrap(
                direction: Axis.horizontal,//排列的方向,默认水平
                alignment: WrapAlignment.start,//子控件在主轴上的对齐方式
                spacing: 10,//主轴上子控件之间的间距
                //textDirection: TextDirection.ltr,//水平方向上子控件的起始位置

                runAlignment: WrapAlignment.start,//子控件在交叉轴上的对齐方式
                runSpacing: 4.0,//交叉轴上子控件之间的间距
                crossAxisAlignment: WrapCrossAlignment.start,//交叉轴上子控件的对齐方式

                verticalDirection: VerticalDirection.down,//交叉轴上子控件的起始位置
                children: createWidgets(),

                clipBehavior: Clip.none,
              )

              ,
            )
          ],
        ),
      ),
    );
  }

  Widget separatorForRow(BuildContext context, int index) {
    return Container(height: 0.5, width: 414, color: const Color.fromRGBO(234, 237, 240, 1.0));
  }

  List<Widget> createWidgets() {
    final strings = ["物联网AIOP云平台开发", "后勤管理", "客服", "品牌营销与推广", "Android系统开发"];
    List widgets = List<Widget>.empty(growable:true);
    for (var value in strings) {
      widgets.add(createWidget(value));
    }
    return widgets as List<Widget>;
  }

  Widget createWidget(String value) {
    return Container(
      color: Color.fromRGBO(247, 248, 250, 1),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Text(value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Color.fromRGBO(100, 101, 102, 1),
        ),
      ),
    );
  }

}
