import 'package:explorer/foundation/exui.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return EXUI.View(navigationBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
          onTapUp: (details){
            Navigator.pop(context);
          },
        ),
        title: Text("Offer页面",
            style: TextStyle(color: Colors.white)
        ),
        shadowColor:Color.fromRGBO(0, 0, 0, 0),
        backgroundColor: EXUI.mainColor),
    separator: false,
    body: Text("Offer2222")
    );
  }
}
