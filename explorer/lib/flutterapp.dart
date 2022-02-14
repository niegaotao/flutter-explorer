import 'package:explorer/foundation/exui.dart';
import 'package:explorer/foundation/element_descriptor.dart';
import 'package:flutter/material.dart';
import 'package:explorer/widgets/wdapp.dart';
import 'package:explorer/jianshu/jsapp.dart';
import 'package:explorer/wechat/wxapp.dart';
import 'package:explorer/company/enterprise_list_page.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FlutterAppState();
  }
}


class FlutterAppState extends State<FlutterApp> {
  final container = ElementContainer<ElementDescriptor>();

  @override
  void initState() {
    container.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "UI学习", subtitle: "", markup: "", operation: "widgets"));
    container.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "Future学习", subtitle: "", markup: "", operation: "future"));

    container.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "简书", subtitle: "", markup: "", operation: "jianshu"));
    container.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "企业列表", subtitle: "", markup: "", operation: "company"));
    container.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "微信", subtitle: "", markup: "", operation: "wechat"));

    for (int index = 0; index < container.elements.length; index++){
      ElementDescriptor descriptor = container.elements[index];
      descriptor.ctxs.separator = [0, 2, 3].contains(index);
      descriptor.ctxs.height = 56.0;
      descriptor.ctxs.event = (operation, value, context){
        print("operation=$operation, value=$value");

        if(operation == "onTapUp"){
          if(value is ElementDescriptor){
            if(value.operation == "widgets"){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return WDApp();
              }));
            }
            else if(value.operation == "future"){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return WDApp();
              }));
            }
            else if(value.operation == "jianshu") {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return JSApp();
              }));
            }
            else if(value.operation == "company"){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return EnterpriseListPage();
              }));
            }
            else if(value.operation == "wechat"){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return WXApp();
              }));
            }
          }
        }
      };
    }
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  Color _themeColor = Color.fromRGBO(235, 235, 235, 1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0),
        ),
        home: EXUI.viewController(
            navigationBar: AppBar(
                title: Text("Explorer", style: TextStyle(color: EXUI.naviForegroundColor)),
                shadowColor:Color.fromRGBO(0, 0, 0, 0),
                backgroundColor: EXUI.naviBackgroundColor),
            body:Container(
              color: EXUI.backgroundColor,
              child: ListView(
                children: [
                  ElementDescriptor.itemForRow(context, container.elements[0]),
                  ElementDescriptor.separator(),
                  ElementDescriptor.itemForRow(context, container.elements[1]),
                  ElementDescriptor.itemForRow(context, container.elements[2]),
                  ElementDescriptor.itemForRow(context, container.elements[3]),
                ],
              ),
            )
        ),
        builder: (context, widget) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!);
        }
    );
  }
}






