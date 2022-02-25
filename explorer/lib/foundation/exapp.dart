import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


typedef EXActionHandler = void Function(String operation, Object? data);

class EXAction<Data>{
  String operation;
  Data? data;
  EXActionHandler? completion;
  EXAction({required this.operation, this.data, this.completion});
}

class EXApp {
  static EXApp center = EXApp();
  static double x = 0;
  static double y = 0;
  static double width = 0;
  static double height = 0;
  static double topOffset = 0;
  static double bottomOffset = 0;
  static double pixel = 0.5;

  static Color backgroundColor = const Color.fromRGBO(247, 247, 247, 1.0);
  static Color foregroundColor = const Color.fromRGBO(255, 255, 255, 1.0);

  static Color naviBackgroundColor = const Color.fromRGBO(255, 255, 255, 1.0);
  static Color naviForegroundColor = const Color.fromRGBO(22, 22, 22, 1.0);
  static Color mainColor = const Color.fromRGBO(233, 64, 0, 1);
  static Color separatorColor = const Color.fromRGBO(240, 240, 240, 1);
  final MethodChannel router = const MethodChannel("explorer");
  final List<EXAction> actions = [];

  static fetchAction<T>(String operation) {
    EXAction<T> action = EXAction(operation: operation);
    EXApp.center.actions.add(action);
    return action;
  }

  static initialize(BuildContext context){
    var query = MediaQuery.of(context);
    width = query.size.width;
    height = query.size.height;
    topOffset = query.padding.top;
    bottomOffset = query.padding.bottom;
    // ignore: avoid_print
    print("width=$width,height=$height,topOffset=$topOffset,bottomOffset=$bottomOffset");
  }

  static View({PreferredSizeWidget? navigationBar, Widget? body, bool separator = true}) {
    return Scaffold(
      appBar: navigationBar != null ? PreferredSize(preferredSize: const Size.fromHeight(44), child:
      Stack(children: [
        navigationBar,
        if(separator)Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: EXApp.pixel,
              color: EXApp.separatorColor,
            )
        )
      ])):null,
      body: body,
    );
  }

  static StackView({PreferredSizeWidget? navigationBar, Widget? contentView, Widget? footerView,bool separator = true}) {
    return Scaffold(
      appBar: navigationBar != null ? PreferredSize(preferredSize: const Size.fromHeight(44), child:
      Stack(children: [
        navigationBar,
        if(separator) Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: EXApp.pixel,
              color: EXApp.separatorColor,
            )
        )
      ])):null,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          if(contentView != null) contentView,
          if(footerView != null) footerView
        ]
      ),
    );
  }


  static List<String> words = [
    "一二三四五六",
    "七八九十百千",
    "上下左右前后",
    "里外东西南北",
    "大小多少长短",
    "粗细远近高低",
    "来去有无出入",
    "开关天地日月",
    "风云雷电雨雪",
    "冰沙山石士木",
    "水火金光人身",
    "体头发目眼睛",
    "眉毛鼻耳口舌",
    "牙齿唇嘴巴胡",
    "须脸嬉肤手足",
    "指甲脖颈拳掌",
    "肩膀腕臂胸背",
    "肚腰膝腿脚趾",

    "胳肢肌屁泪汗",
    "血骨脑心脏胃",
    "肝胆肺肠男女",
    "老幼父母爸妈",
    "爷奶爹娘哥弟",
    "姐妺兄侄孙宝",
    "公婆叔伯婶姑",
    "舅姨孩童婴娃",
    "朋友伙伴你我",
    "他她它自己您",
    "宾客谁们正反",
    "快慢胖瘦美丑",
    "好坏新旧轻重",
    "薄厚宽窄方圆",
    "扁尖弯直冷热",
    "明暗软硬干湿",
    "炎寒暖凉空满",
    "真假对错优差",

    "酸甜䒷辣咸淡",
    "香臭丰熟净污",
    "广阔亮晶深浅",
    "缓急安危死灭",
    "往回问答升降",
    "起落进退动静",
    "伸缩扩张悲欢",
    "离合喜怒哀乐",
    "哭笑忧伤愁思",
    "惊吓注视尝闫",
    "叫喊说听吵闹",
    "哈呼告诉吃喝",
    "呆愣羞怕看见",
    "望盯品吞吐咬",
    "吸唤味饮坐走",
    "爬跑步跳玩滚",
    "睡觉醒梦读记",
    "认写唱歌声音",

//2==========================
    "话语文字言词",
    "想念忘志恩爱",
    "早晚晨夜朝暮",
    "夕午旦昏阴晴",
    "春夏秋冬岁年",
    "时季古今昨昔",
    "黑白红绿橙黄",
    "青蓝紫粉灰褐",
    "棕颜色彩鲜艳",
    "亲丽江河海洋",
    "波涛浪潮湖池",
    "潭洞岸流汽浑",
    "泉溪沟汉洪港",
    "渡滩浩洁泡涨",
    "沉汪泥浆谷峰",
    "岩岭崖峦冈岗",
    "野坡坪堤景秀",
    "壮观宇宙星辰",
    "陡岔岳崩岛川",
    "森林平原匠田",

    "霜雾露雹虹霞",
    "尘阳温度节气",
    "令候烈钻戏曲",
    "剧诗京都户华",
    "乡村影像拿打",
    "把抓拍摸提扔",
    "捉挑举拉拔找",
    "扎搭推拄擦扫",
    "招拥挥拾抄扣",
    "扬抬抖护拦捕",
    "接掉抗碰扭甩",
    "摇查披捡躺盖",
    "奔蹦跺跃跨跌",
    "跟跛赶超越趁",
    "迟到停靠送还",
    "迷达运返迎连",
    "踢踏踩趴距跪",
    "扑追过孵迈迹",
    "觅选造争逃边",
    "留迁穿带戴脱",

    "砍装救请谢躲",
    "藏放切烧炒烤",
    "煮炖煎炸骑登",
    "钓滑办给结约",
    "做敢清洗漂浇",
    "游泳飘浮坠照",
    "划摔泼洒淋治",
    "理刷鸡鸭鹅兔",
    "牛羊马驴猪狗",
    "鼠猫虎象鹿羚",
    "狮熊豹狼猩猴",
    "狐狸刺猬豚鲸",
    "龙蛇鱼虾虫尾",
    "羽椰飞鸟燕雀",
    "鹰鸥鹃雁鹊莺",
    "鸦鸽蛙蚁蜂蝶",
    "蚊蝇蛾瓢花草",
    "树植枝叶棵根",
    "茎脉杈梢农园",
    "场禾芽苗果实",

//3=====================
    "庄市粮食瓜皮",
    "核种豆物蛋乳",
    "米面饭肉汤汁",
    "茶油糖盐醋酱",
    "糕点饼饺粥烟",
    "酒料葱姜蒜椒",
    "稻麦粱薯菜蔬",
    "芹茄卜角葫芦",
    "萝菇杮菠笋藕",
    "苔药松柳竹梅",
    "杨榆槐榕桐桂",
    "乔李杉杜桑棉",
    "桦栗朵蕾苞蓉",
    "莲丹玫葵兰菊",
    "荷仙苹莓梨橘",
    "桃樱蕉杳枣葡",
    "竿材桩柱梁",
    "枫株杠栏板柴",
    "笔墨纸砚团组",
    "课习学校师生",

    "楼家房问屋室",
    "墙顶座罩舍牢",
    "桌椅凳门窗帘",
    "床被窝枕巾衣",
    "服裙裤帽鞋袜",
    "套袋加减乘除",
    "布仔绒丝碗锅",
    "盘盆刀叉勺筷",
    "剪瓶罐灶箱桶",
    "镜钟数英史化",
    "姓名班级书本",
    "图章画信作业",
    "铅钢盒包计算",
    "绘描报尺扇旗",
    "灯杯伞玉柜缸",
    "壁架棍枪球台",
    "网排棒篮两几",
    "每次丈条只束",
    "个辆匹具双份",
    "倍块串副遍层",

    "片件圈颗是让",
    "些和分许很太",
    "得的这那没当",
    "奏但比用知从",
    "能向会要现在",
    "为不旁参成王",
    "样又也再可更",
    "最就力格始故",
    "另永至末已刚",
    "才而并介互相",
    "末确虽然应该",
    "特别忽即渐终",
    "便余共突必由",
    "因着此于其如",
    "什怎吗呢哪吧",
    "啊呀劳工医商",
    "众群事全病休",
    "交通道路车船",
    "铁机桥航孔坑",
    "堆响礼国城住",

//4==================

    "周围困建珍贵",
    "奇妙甘巧专乱",
    "鸟苍坚楚难险",
    "容易整齐斜绝",
    "稳衡势准骄傲",
    "简单善良凶恶",
    "舒勇强颃孤独",
    "幸福瞎聋肥爽",
    "健康疼痛肃诚",
    "敏透愉懒勤奋",
    "严厉烦暴恐痒",
    "渴闲茂盛浓密",
    "趣微适糟枯固",
    "娇柔贫穷富灿",
    "唐宋陈吴世际",
    "部局万半元斤",
    "钱款票币案规",
    "则命武艺价位",
    "首司任务仗功",
    "夫央界区魔术",

    "貌题谜谎标页",
    "句号形状符法",
    "零费序腊情怀",
    "惯劲嗓澡糊模",
    "怪精灵妖笼冠",
    "牌操珠项链売",
    "秒表夹秤琴棋",
    "笛箫管弦筝铃",
    "鼓锣喇剑箭矛",
    "斧钩锤银铜钉",
    "锁席纹翅斑膏",
    "砖厅鬼神佛丛",
    "餐厨壶蜜街处",
    "旅馆祆针线衫",
    "绳缆漆瓦货屯",
    "仓库翁皇帝官",
    "宫殿辉堂营所",
    "矿巢士兵邻居",
    "卫丁党员警将",
    "帅敌科技环境",

    "舰队弹帆梯阵",
    "坦克轮垃横竖",
    "轿期秘郊雄祸",
    "毒況蚪蚯蜻蜗",
    "蛛蝈龟兽芝麻",
    "秧菌茅藤蕨蔓",
    "采系联产引印",
    "求夺失败止考",
    "免复延借取丢",
    "集希冒充含封",
    "站行转养存付",
    "烂补培育陪赔",
    "偷谈捣吹活闯",
    "避隔挡择折扮",
    "拎挤拼撞抹投",
    "摘挺捞挖托挣",
    "捧按摆扶抢换",
    "插拒挠拨临列",
    "仿防纺织缝估",
    "肯定搬撕握敲"
  ];
}