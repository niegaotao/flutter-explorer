import 'package:flutter/material.dart';
import 'offer_page.dart';


class EnterprisePage extends StatefulWidget {
  const EnterprisePage({Key? key}) : super(key: key);

  @override
  _EnterprisePageState createState() => _EnterprisePageState();
}

class Enterprise {
  String name = "武汉心动校招科技责任公司";
  String avatar = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic209.nipic.com%2Ffile%2F20190310%2F18383466_163939408907_2.jpg&refer=http%3A%2F%2Fpic209.nipic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1638069408&t=bae01053899185c979cf473f82921d13";
  String phone = "027-82823749";
  String mail = "xindongxiaozhao@xdxz.com";
  String address = "安徽省合肥市二仙桥区华成大道99号101-10456 ";
  String profile = "麦田房产集团成立15周年，目前已经成长为中国本土最具影响力和发展潜力的经纪房产服务商之一；全国直营连锁，定位中高端市场。";
  String magir = "计算机专业、电子商务、网络工程专业";
  List<Offer> offers = List.from([Offer(), Offer(), Offer(), Offer()]);
  String other = "公司始建于2000年10月19日，总部位于北京。是一家专业从事经营各类型住宅、写字楼及商铺等物业买卖居间及金融业务担保服务的民营企业，成立以来一直秉承“持续发展，同享丰收”的经营理念，不断引领行业向健康发展，在行业内首先掀起“不赚差价，不炒楼”的诚信服务宣言，不仅开创了中国本土房产经纪行业独树一帜的商业模式，而且创建了房产经纪行业的优质服务标准，成为房产经纪业中规范、专业的代名词。";
  bool isExpand = false;
}

class Offer {
  String name = "NVH性能开发工程师";
  String address = "成都 武汉 北京 杭州 西安 深圳 广州";
  String other = "8～14k | Java/PHP | 五险一金";
  String description = "任职资格（全北京400多家门店就近安排）\n1.年龄21-35周岁,热爱销售，勇于挑战；\n2.**大专及以上学历，可接受应届毕业生(必须全职)；\n3.具备良好的心理素养，具备团队合作精神，对营销管理岗感兴趣，想往管理岗位发展";
}

class _EnterprisePageState extends State<EnterprisePage> {
  Enterprise enterprise = Enterprise();

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
            title: Text("2020校园招聘精选岗位推荐",
                style: TextStyle(color: Colors.black)
            ),
            shadowColor:Color.fromRGBO(0, 0, 0, 0),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            createBody(),
            createFooter(),
          ],
        )
    );
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
                          Text(enterprise.name, style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(50, 50, 50, 1.0),
                          ),),
                          Text("100-499人   B轮融资   互联网", style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(100, 100, 100, 1.0),
                          ),),
                        ],
                      ),),

                      ClipRRect(

                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(enterprise.avatar,
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
                          children: [Icon(Icons.phone, size: 16, color: Color.fromRGBO(50, 50, 50, 1)), Text(enterprise.phone, style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),)]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Icon(Icons.mail_outline, size: 16, color: Color.fromRGBO(50, 50, 50, 1)), Text(enterprise.mail, style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),)]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Icon(Icons.location_on, size: 16, color: Color.fromRGBO(50, 50, 50, 1)), Text(enterprise.address, style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1)),)])
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
                Text(enterprise.profile, style: TextStyle(
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
                Text(enterprise.magir, style: TextStyle(
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
                Text(enterprise.other, style: TextStyle(
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
        child: Container(
          width: 40,
          height: 40,
          color: Colors.red,
        ));
  }

  Widget itemForRow(BuildContext context, int index) {
    Offer offer = enterprise.offers[index];
    return GestureDetector(
      onTapUp: (detail){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EnterprisePage();
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
    for (var offer in enterprise.offers) {
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
                    color: Color.fromRGBO(6, 183, 180, 1),
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
