import 'package:flutter/material.dart';

class StateManagerWidget extends StatefulWidget {
  const StateManagerWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SMWState();
  }
}

class _SMWState extends State<StateManagerWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    //return Center(child: Chip(label: Text("$count")));
    return FloatingActionButton(child: Text("$count"), onPressed: (){
      setState(() {
        count++;
      });
    });
  }
}

