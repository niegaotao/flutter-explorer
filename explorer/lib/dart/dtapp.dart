import 'package:flutter/material.dart';
import 'package:explorer/widgets/state_manager.dart';
import 'package:explorer/foundation/exui.dart';


class DTApp extends StatefulWidget {
  const DTApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DTAppState();
  }
}
class DTAppState extends State<DTApp> {

  //在widget中我们重载Widget build(BuildContext context)函数，返回创建的widget
  @override
  Widget build(BuildContext context) {
    //UI.initialzie(context);
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(44),
            child: AppBar(
                title: Text('Flutter App')
            ),
          ),
          body: const StateManagerWidget()
      ),
      builder: (context, widget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!);
      },
    );
  }
}