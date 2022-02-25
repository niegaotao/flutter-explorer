
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:explorer/foundation/exapp.dart';
import 'package:explorer/foundation/element_descriptor.dart';

import 'package:explorer/education/eduapp.dart';
import 'package:explorer/dart/dtapp.dart';
import 'package:explorer/widgets/wdapp.dart';
import 'package:explorer/jianshu/jsapp.dart';
import 'package:explorer/wechat/wxapp.dart';
import 'package:explorer/company/companyapp.dart';

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
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "10以内加法", operation: "edu+10"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "20以内加法", operation: "edu+20"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "100以内加法", operation: "edu+100"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "10以内减法", operation: "edu-10"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "20以内减法", operation: "edu-20"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "100以内减法", operation: "edu-100"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "10以内加减法", operation: "edu+-10"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "20以内加减法", operation: "edu+-20"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "100以内加减法", operation: "edu+-100"));
      array.elements.add(ElementDescriptor(icon: "assets/Appicon-60@2x.png", title: "识字大王", operation: "word"));
      wrapper.elements.add(array);
    }

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
        if(["edu+10","edu+20","edu+100"].contains(value.ctxs.operation)){
          String operation = value.ctxs.operation.substring(3);
          String title = value.ctxs.operation.substring(4) + "以内的加法";
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EDUApp(ctxs: EXAction(operation: operation, data: EDUAppValue(title: title), completion: null));
          }));
        }
        else if(["edu-10","edu-20","edu-100",].contains(value.ctxs.operation)){
          String operation = value.ctxs.operation.substring(3);
          String title = value.ctxs.operation.substring(4) + "以内的减法";
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EDUApp(ctxs: EXAction(operation: operation, data: EDUAppValue(title: title), completion: null));
          }));
        }
        else if(["edu+-10","edu+-20","edu+-100",].contains(value.ctxs.operation)){
          String operation = value.ctxs.operation.substring(5);
          String title = value.ctxs.operation.substring(5) + "以内的加减法";
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EDUApp(ctxs: EXAction(operation: operation, data: EDUAppValue(title: title), completion: null));
          }));
        }
        else if(value.ctxs.operation == "word"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EDUApp(ctxs: EXAction(operation: "word", data: EDUAppValue(title: "识字大王"), completion: null));
          }));
        }
        else if(value.ctxs.operation == "dart"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DTApp();
          }));
        }
        else if(value.ctxs.operation == "widgets"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return WDApp();
          }));
        }
        else if(value.ctxs.operation == "future"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return WDApp();
          }));
        }
        else if(value.ctxs.operation == "jianshu") {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return JSApp();
          }));
        }
        else if(value.ctxs.operation == "company"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CompanyApp();
          }));
        }
        else if(value.ctxs.operation == "wechat"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return WXApp();
          }));
        }
        else if(value.ctxs.operation == "image-picker"){
          mc.invokeMapMethod("UIImagePickerController");
        }
        else if(value.ctxs.operation == "album"){
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
    // Icon;StatelessWidget;
    // StatelessElement;
    //
    // Container;StatefulWidget;
    // StatefulElement;
    //
    // Row;Flex;MultiChildRenderObjectWidget;RenderObjectWidget;
    // MultiChildRenderObjectElement;RenderObjectElement;
    // RenderBox;RenderObject;


    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          highlightColor: const Color.fromRGBO(0, 0, 0, 0),
          splashColor: const Color.fromRGBO(0, 0, 0, 0),
        ),
        home: EXApp.View(
            navigationBar: AppBar(
                title: Text("Explorer", style: TextStyle(color: EXApp.naviForegroundColor)),
                shadowColor:const Color.fromRGBO(0, 0, 0, 0),
                backgroundColor: EXApp.naviBackgroundColor),
            body:Container(
              color: EXApp.backgroundColor,
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

  @override
  void dispose() {
    super.dispose();
  }
}






