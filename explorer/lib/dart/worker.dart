

class Worker {
  //定义静态变量：格式：类型 变量名 = 初始值
  //在外部通过 = Worker.key; Worker.key = "22"进行读写 （类似于swift的 static var key = "worker"）
  //在内不通过 = key;key = ""进行读写
  //static String _i = "111";如果带下划线将不能被外部访问
  static String key = 'Worker';

  //定义成员变量：格式：类型 变量名 = 初始值
  //如果成员变量不给初始值，那么需要指定该成员变量是空安全（null-safety,跟swift的可选类型类似）
  //如果成员边量带下划线，表示该成员变量尽在该文件内可以访问。（跟swift的fileprivate类似）
  //const不可变的常量，：在编译期确定变量测值，不可用运行态的内容来赋值，如时间戳/随机数；赋值后不可修改
  //final最终不可变的常量：赋值一次后不可以改变，可以赋值为时间戳和随机数等。
  String name = '';
  String _nickname = '';
  int? height;////未初始化的变量指向null
  int? age;//未初始化的变量指向null

  //构造函数
  //同名的参数（可以简写成如下方式，私有成员变量不可以）
  Worker(this.name,this.height, String _nickname){
    this._nickname = _nickname;
  }

  //函数:返回值 函数名 (参数列表)
  //带前置下划线的函数不能被外部访问，与带下划线的的成员变量相同
  int printAll() {
    print(
        'printAll:key=$key, name=$name, _nickname=$_nickname, height=$height, age=$age');
    return 8;
  }

  int _printAll(){
    print('_printAll:key=$key, name=$name, _nickname=$_nickname, height=$height, age=$age');
    return 9;
  }
}