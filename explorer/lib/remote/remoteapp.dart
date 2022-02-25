import 'package:flutter/material.dart';
import 'package:explorer/foundation/exapp.dart';

class RemoteApp extends StatefulWidget {
  const RemoteApp({Key? key}) : super(key: key);

  @override
  _RemoteAppState createState() => _RemoteAppState();
}

class _RemoteAppState extends State<RemoteApp> {
  @override
  Widget build(BuildContext context) {
    return EXApp.View(
        navigationBar:AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios, color: EXApp.naviForegroundColor),
            onTapUp: (details){
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text("RemoteApp", style: TextStyle(color: EXApp.naviForegroundColor)),
          shadowColor:Color.fromRGBO(0, 0, 0, 0),
          backgroundColor: EXApp.naviBackgroundColor,
        ),
        body:Container(
          child: Center(child: Text("RemoteApp", style: TextStyle(fontSize: 20),),)));
  }
}
