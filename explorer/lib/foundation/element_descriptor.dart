// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:explorer/foundation/exui.dart';

class EXRect {
  double x = 0;
  double y = 0;
  double width = 0;
  double height = 0;
  EXRect({this.x = 0, this.y = 0, this.width = 0, this.height = 0});
}

typedef ElementEventCallback = void Function(String operation, Object value, BuildContext context);

class ElementContexts extends EXRect {
  bool separator = false;
  ElementEventCallback? event;
  ElementContexts();
}

class ElementContainer<T> {
  final frame = EXRect();
  List<T> elements = [];
}

class ElementDescriptor {
  ElementContexts ctxs = ElementContexts();
  String icon = "";
  String title = "";
  String subtitle = "";
  String value = "";
  String markup = "";
  String operation = "";
  ElementDescriptor({this.icon = "", this.title = "", this.subtitle = "", this.value = "", this.markup = "", this.operation = ""});

  static Widget itemForRow(BuildContext context, ElementDescriptor descriptor) {
    return  ElementDescriptorView(descriptor);
  }

  static Widget separator(){
    return Container(height: 10, width: 414, color: EXUI.backgroundColor);
  }
}

class ElementDescriptorView extends StatelessWidget {
  final ElementDescriptor descriptor;

  ElementDescriptorView(@required this.descriptor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        if(this.descriptor.ctxs.event != null){
          this.descriptor.ctxs.event!("onTapUp", this.descriptor, context);
        }
      },
      child: Container(
        color: Colors.white,
        height: descriptor.ctxs.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    // child: _file == null ? Image(image:  AssetImage("assets/Hank.png"), width: 60):Image(image: FileImage(_file!), width: 60),
                    child: Image(image: AssetImage(descriptor.icon), width: 32),
                  ),
                  SizedBox(width: 10),
                  Text(descriptor.title, style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(20, 20, 20, 1),
                  ),),
                  Expanded(child: Container()),
                  descriptor.subtitle.length > 0
                      ? Text(descriptor.subtitle, style: TextStyle(fontSize: 15),)
                      : Container(),
                  descriptor.markup.length > 0
                      ? Image(image: AssetImage(descriptor.markup), width: 8)
                      : Container(),
                  Image(image: AssetImage("assets/icon_right.png"), width: 16)
                ],
              ),
            ),
            Positioned(
                left: 50,
                right: 0,
                bottom: 0,
                child: Container(
                  height: descriptor.ctxs.separator ? 1 : 0,
                  color: Color.fromRGBO(240, 240, 240, 1),
                ))
          ],
        ),
      ),
    );
  }
}