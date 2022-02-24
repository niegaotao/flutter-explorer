

import 'dart:async';

import 'dart:io';
import 'dart:isolate';

void future_start() {
  test0();
}

void test0() async {
  /*
  * 没有await：代码执行顺序：开始 -> 结束 -> for循环结束
  * 有await：代码执行顺序：开始 -> for循环结束 -> 结束
  * */
  print("开始");
  await Future((){
    for (int i = 0; i < 1000000000; i++){}
    return "for循环";
  }).then((value) => print("$value 完毕"));
  print("结束");
}

void test1() {
  /*
  * 这种链式的写法,then会顺序执行，最终走到whenComplete或者catchError
  * flutter: 异步任务1
  * flutter: 异步任务1异步任务2
  * flutter: 异步任务1异步任务2异步任务3
  * flutter: 任务结束
  * catchError一定要放在最后，否则catchError的之后的,then还会继续执行
  * */
  Future future = Future(() {
    String s = "异步任务1";
    print(s);
    return s;
  }).then((value)  {
    String s = value + "异步任务2";
    print(s);
    return s;
  }).then((value)  {
    String s = value + "异步任务3";
    print(s);
    return s;
  }).whenComplete(() {
    print("任务结束");
  }).catchError((e){
    print("出错了");
  });
}

void test2() {
  /*
  这种写法，中间的会顺序执行？但是只能接收到第一个return值，最终走到whenComplete或者catchError
  flutter: 异步任务1
  flutter: 异步任务1异步任务2
  flutter: 异步任务1异步任务3
  flutter: 异步任务1异步任务4
  flutter: 异步任务1异步任务5
  flutter: 任务结束
  * */
  Future future = Future(() {
    String s = "异步任务1";
    print(s);
    return s;
  });

  future.then((value)  {
    String s = value + "异步任务2";
    print(s);
    return s;
  });

  future.then((value)  {
    String s = value + "异步任务3";
    print(s);
    return s;
  });

  future.then((value)  {
    String s = value + "异步任务4";
    print(s);
    return s;
  });

  future.then((value)  {
    String s = value + "异步任务5";
    print(s);
    return s;
  });

  future.whenComplete(() {
    print("任务结束");
  });

  /*
  * catchError一定得用链式否则报错
  * */
  future.catchError((e){
    print("出错了");
  });
}

void test3(){
  /*
  * 按任务加入的顺序执行，then相当于微任务会紧接着future执行
  * flutter: 任务1结束
  * flutter: 任务2结束
  * flutter: 任务3结束
  * flutter: 任务4结束
  * */
  Future((){
    sleep(Duration(microseconds: 10));
    return "任务1";
  }).then((value) => print("$value结束"));

  Future((){
    sleep(Duration(microseconds: 10));
    return "任务2";
  }).then((value) => print("$value结束"));

  Future((){
    sleep(Duration(microseconds: 10));
    return "任务3";
  }).then((value) => print("$value结束"));

  Future((){
    sleep(Duration(microseconds: 10));
    return "任务4";
  }).then((value) => print("$value结束"));
}

void test4(){
  /*
  * 按任务加入的顺序执行，类似与dispatch-group
  * flutter: [任务1, 任务2, 任务3, 任务4]
  * */

  Future.wait([
    Future((){
      sleep(Duration(microseconds: 10));
      return "任务1";
    }),

    Future((){
      return "任务2";
    }),

    Future((){
      sleep(Duration(microseconds: 10));
      return "任务3";
    }),

    Future((){
      return "任务4";
    })
  ]).then((value) => print("$value"));
}


void test5() {
  /*
  * 每次执行则检查是否有微任务需要，有则先执行微任务，其余任务按加入的顺序执行
  * flutter: 任务7
  * flutter: 任务4
  * flutter: 任务0
  * flutter: 任务3
  * flutter: 任务6
  * flutter: 任务1
  * flutter: 任务2
  * flutter: 任务5
  * */
  Future x = Future(() {
    print("任务0");
    scheduleMicrotask((){
      print("任务1");
    });
    scheduleMicrotask((){
      print("任务2");
    });
  }).then((value) => print("任务3"));

  scheduleMicrotask((){
    print("任务4");
  });

  Future((){
    print("任务5");
  });

  x.then((value) => print("任务6"));

  print("任务7");
}

void test6(){
    Future((){
      print("1");
      scheduleMicrotask((){
        print("1-Micro-task");
      });
    }).then((value){
      print("2");
      scheduleMicrotask((){
        print("2-Micro-task");
      });
    }).then((value){
      print("3");
      scheduleMicrotask((){
        print("3-Micro-task");
      });
    }).then((value){
      print("4");
      scheduleMicrotask((){
        print("4-Micro-task");
      });
    }).then((value){
      print("5");
      scheduleMicrotask((){
        print("5-Micro-task");
      });
    });
}

void func7() {

}