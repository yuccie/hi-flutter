// 1、需要在加强下 ts
// 2、需要了解基本的 flutter 组件及dart 语法

import 'package:flutter/material.dart';
import 'list.dart';

void main() => runApp(MyApp());

// Widget，flutter提供很多默认的组件，而每个组件的都继承自widget ，一切都是widget。 
// 这句看起来是不是很熟悉？ 还记得在webpack里，一切都是module吗？ 
// 类似的还有java的一切都是对象。貌似任何一个技术，最后都是用哲学作为指导思想。
// widget，作为可视化的UI组件，包含了显示UI、功能交互两部分。
// 大的widget，也可以由多个小的widget组合而成。


// StatelessWidget，无状态变更，UI静态固化的Widget，页面渲染性能更高
// StatefulWidget，因状态变更导致UI变更的Widget
// 在小程序里，会强烈建议减少setData的使用，但在flutter里更加激进，直接推出了StatelessWidget，并直接在该Widget里砍掉了setState的使用。

// flutter里严格使用分号，逗号，减少了对eslint的依赖

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

// 增加页面状态，点击按钮，改变文字
// StatefulWidget 是有状态的
class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

// @override只是指出函数也在祖先类中定义，但正在重新定义以在当前类中执行其他操作。
// 其实就是子类重写超类的方法时，要用@override

class MyHomePageState extends State<MyHomePage> {
  var msg = "hi flutter";

  @override
  Widget build(BuildContext context) {
    // Scaffold是flutter的页面脚手架，相当于html
    return Scaffold(
      appBar: AppBar(
        title: Text('Home title'),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Text(msg),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,

              // 点击按钮事件
              onPressed: () {
                print('点击了');
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ListPage();
                }));
              },
              child: Text(
                'click me',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      )
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("我是Title"),
//       ),

//       body: Center(
//         child: Text('hello world')
//       ),

//       bottomNavigationBar: BottomAppBar(
//         child: Text('button'),
//       )
//     );
//   }
// }