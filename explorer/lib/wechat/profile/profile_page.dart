import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
            onTapUp: (details){
              Navigator.pop(context);
            },
          ),
          title: Text("我的资料",
              style: TextStyle(color: Colors.black)
          ),
          shadowColor:Color.fromRGBO(0, 0, 0, 0),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
      body: Text("Profile"),
    );
  }
}
