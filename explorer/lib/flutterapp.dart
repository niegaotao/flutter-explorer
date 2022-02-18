import 'package:explorer/foundation/exui.dart';
import 'package:explorer/foundation/element_descriptor.dart';
import 'package:flutter/material.dart';

import 'package:explorer/dart/dtapp.dart';
import 'package:explorer/widgets/wdapp.dart';
import 'package:explorer/jianshu/jsapp.dart';
import 'package:explorer/wechat/wxapp.dart';
import 'package:explorer/company/enterprise_list_page.dart';
import 'package:flutter/services.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FlutterAppState();
  }
}

class FlutterAppState extends State<FlutterApp> {
  final wrapper = ElementWrapper<ElementArray<ElementDescriptor>>();
  MethodChannel mc = MethodChannel("pages/owner");

  @override
  void initState() {
    if(true){
      ElementArray<ElementDescriptor> array = ElementArray<ElementDescriptor>();
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "Dart", operation: "dart"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "Widgets", operation: "widgets"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "Future", operation: "future"));
      wrapper.elements.add(array);
    }

    if(true){
      ElementArray<ElementDescriptor> array = ElementArray<ElementDescriptor>();
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "企业列表", operation: "company"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "简书", operation: "jianshu"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "微信", operation: "wechat"));
      wrapper.elements.add(array);
    }

    if(true){
      ElementArray<ElementDescriptor> array = ElementArray<ElementDescriptor>();
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "打开UIImagePickerController", operation: "image-picker"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "打开NXAssetsViewController", operation: "album"));
      wrapper.elements.add(array);
    }

    updateElements();

    mc.setMethodCallHandler((call) {
      if(call.method == "image") {
        print(call.arguments);
        String str = call.arguments.toString().substring(7);
        setState(() {
          //_file = File(str);
        });
      }
      return Future((){});
    });

    super.initState();
  }

  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void updateElements(){
    for (int i = 0; i < wrapper.elements.length; i++){
      ElementArray array = wrapper.elements[i];
      for (int j = 0; j < array.elements.length; j++){
        ElementDescriptor descriptor = array.elements[j];
        descriptor.ctxs.separator = j != array.elements.length-1;
        descriptor.ctxs.height = 56.0;
        descriptor.ctxs.event = (operation, value, context){
          print("operation=$operation, value=$value");
          disposeEvent(operation, value, context);
        };
      }
    }
  }

  void disposeEvent(String operation, Object value, BuildContext context){
    if(operation == "onTapUp"){
      if(value is ElementDescriptor){
        if(value.operation == "dart"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DTApp();
          }));
        }
        else if(value.operation == "widgets"){
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
        else if(value.operation == "image-picker"){
          mc.invokeMapMethod("UIImagePickerController");
        }
        else if(value.operation == "album"){
          mc.invokeMapMethod("NXAssetsViewController");
        }
      }
    }
  }

  List<Widget> createWidgets(BuildContext context){
    List<Widget> widgets = [];
    for(int i = 0; i < wrapper.elements.length; i++){
      ElementArray<ElementDescriptor> array = wrapper.elements[i];
      for(int j = 0; j < array.elements.length; j++){
        ElementDescriptor descriptor = array.elements[j];
        widgets.add(ElementDescriptor.itemForRow(context, descriptor));
      }
      if(array.elements.isNotEmpty && i != wrapper.elements.length-1){
        widgets.add(ElementDescriptor.separator());
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          highlightColor: const Color.fromRGBO(0, 0, 0, 0),
          splashColor: const Color.fromRGBO(0, 0, 0, 0),
        ),
        home: EXUI.viewController(
            navigationBar: AppBar(
                title: Text("Explorer", style: TextStyle(color: EXUI.naviForegroundColor)),
                shadowColor:const Color.fromRGBO(0, 0, 0, 0),
                backgroundColor: EXUI.naviBackgroundColor),
            body:Container(
              color: EXUI.backgroundColor,
              child: ListView(
                children: createWidgets(context),
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






