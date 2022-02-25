import 'package:explorer/foundation/exapp.dart';
import 'package:flutter/material.dart';
import 'package:explorer/company/company.dart';
import 'package:explorer/company/offer_page.dart';


class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<CompanyPage> {
  Company company = Company();

  @override
  Widget build(BuildContext context) {
    return EXApp.View(
        navigationBar:
        AppBar(
            leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
              onTapUp: (details){
                Navigator.pop(context);
                },
            ),
            title: Text("2020校园招聘精选岗位推荐",
                style: TextStyle(color: Colors.white)
            ),
            shadowColor:Color.fromRGBO(0, 0, 0, 0),
            backgroundColor: EXApp.mainColor),
        body:
        Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            createBody(),
            createFooter(),
      ],
    ));
  }

  Widget createBody(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            color: Colors.white,
            child: Column(

              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: Row(
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: [
                          Text(company.name, style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(50, 50, 50, 1.0),
                          ),),
                          Text("100-499人   B轮融资   互联网", style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(100, 100, 100, 1.0),
                          ),),
                        ],
                      ),),

                      ClipRRect(

                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(company.avatar,
                          width: 58,
                          height: 58,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 4,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Icon(Icons.phone, size: 16, color: Color.fromRGBO(50, 50, 50, 1)), Text(company.phone, style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),)]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Icon(Icons.mail_outline, size: 16, color: Color.fromRGBO(50, 50, 50, 1)), Text(company.mail, style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),)]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Icon(Icons.location_on, size: 16, color: Color.fromRGBO(50, 50, 50, 1)), Text(company.address, style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),)])
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("官方网站", style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),),
                      Text("企业介绍", style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),),
                      Text("发展历程", style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),),
                      Text("企业宣传", style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),)
                    ],
                  ),
                )

              ],
            ),
          ),

          Container(
            height: 10,
            color: Color.fromRGBO(240, 240, 240, 1),
          ),

          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [Text("招聘简章", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black),),],
                ),
                Container(height: 10,),
                Text(company.profile, style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(50, 50, 50, 1),
                ),),
                Container(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("查看更多", style: TextStyle(fontSize: 14, color: Color.fromRGBO(100, 100, 100, 1)),),
                    Icon(Icons.keyboard_arrow_down_sharp, color: Color.fromRGBO(100, 100, 100, 1),)
                  ],
                )
              ],
            ),
          ),

          Container(
            height: 10,
            color: Color.fromRGBO(240, 240, 240, 1),
          ),

          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("招聘专业", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black),),
                    Container(width: 5,),
                    Text("与该公司职位匹配度较高的专业", style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),)
                  ],
                ),
                Container(height: 10,),
                Text(company.magir, style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(50, 50, 50, 1),
                ),)],
            ),
          ),

          Container(
            height: 10,
            color: Color.fromRGBO(240, 240, 240, 1),
          ),

          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(0, 16, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    children: [
                      Text("校招岗位", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black),)
                    ],
                  ),
                ),
                Column(
                  children: createWidgets(),
                ),
              ],
            ),
          ),

          Container(
            height: 10,
            color: Color.fromRGBO(240, 240, 240, 1),
          ),

          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("其他信息", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black),)
                  ],
                ),
                Container(height: 10,),
                Text(company.other, style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(50, 50, 50, 1),
                ),),
                Container(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("查看更多", style: TextStyle(fontSize: 14, color: Color.fromRGBO(100, 100, 100, 1)),),
                    Icon(Icons.keyboard_arrow_down_sharp, color: Color.fromRGBO(100, 100, 100, 1),)
                  ],
                )],
            ),
          ),

          Container(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget createFooter() {
    return Positioned(
        left: 16,
        right: 14,
        bottom: 34,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: 40,
            height: 40,
            color: EXApp.mainColor,
            child: Center(
              child: Text("投递简历",style: TextStyle(color: Colors.white),),
            ),
          ),
        )
    );
  }

  Widget itemForRow(BuildContext context, int index) {
    Offer offer = company.offers[index];
    return GestureDetector(
      onTapUp: (detail){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return CompanyPage();
        }));
      },
      child: createWidget(offer)
    );
  }

  Widget separatorForRow(BuildContext context, int index) {
    return Container(height: 0.5, width: 414, color: const Color.fromRGBO(234, 237, 240, 1.0));
  }

  List<Widget> createWidgets() {
    List widgets = List<Widget>.empty(growable:true);
    for (var offer in company.offers) {
      widgets.add(createWidget(offer));
    }
    return widgets as List<Widget>;
  }

  Widget createWidget(Offer offer) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: GestureDetector(
                onTapUp: (details){
                  print("点击了左侧");
                  //offer.isExpand = !offer.isExpand;
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(offer.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(50, 50, 50, 1),
                    ),
                  ),Text(offer.address,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(100, 101, 102, 1),
                    ),
                  ),Text(offer.other,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(100, 101, 102, 1),
                    ),
                  ),],
                ),
              )
              ),
              GestureDetector(
                onTapUp: (detail){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return OfferPage();
                  }));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: 100,
                    height: 32,
                    color: EXApp.mainColor,
                    alignment: Alignment.center,
                    child: Text("投递简历", style: TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                ),
              )
            ],
          ),
          Container(height:16),
          Container(height: 0.5, width: 414, color: const Color.fromRGBO(234, 237, 240, 1.0))
        ],
      )
    );
  }
}
