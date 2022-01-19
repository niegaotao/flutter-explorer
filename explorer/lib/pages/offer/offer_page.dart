import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
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
          title: Text("Offer页面",
              style: TextStyle(color: Colors.black)
          ),
          shadowColor:Color.fromRGBO(0, 0, 0, 0),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
      body: Text("Offer页面"),
    );
  }
}
