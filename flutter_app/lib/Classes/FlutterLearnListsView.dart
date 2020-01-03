import 'dart:ui';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/Routes.dart';


class FlutterLearnListsView extends StatelessWidget {
  @override
  LearnListsView build(BuildContext context) => LearnListsView();
}

class LearnListsView extends StatefulWidget {
  @override
  LearnListsViewState createState() => LearnListsViewState(); // createState方法返回一个LearnListsViewState实例
}

class LearnListsViewState extends State<LearnListsView> {
  //final：用于修饰变量，表示单赋值（single-assignment），使用final修饰的变量必须进行初始化，一旦被赋值之后，不能够再次被赋值,否则编译会报错。
  final _learnLists =  Routes.learnLists;
  final _saved = Set<Map>(); // 实例化一个去重的无序的Set

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航栏
        title: Text("Flutter 学习课程表"),
        actions: <Widget>[
          // 导航栏右侧菜单
          IconButton(icon: Icon(Icons.scanner), onPressed: () {}),
        ],
        leading: Builder(builder: (content) { // 自定义导航栏左键
          return IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // 打开抽屉效果,其中Scaffold.of含义为获取附近最近的State对象
              });
        }),
      ),
      body: _buildSuggestions(), // body的内容为私有方法返回的Widget对象_buildSuggestions
    );
  }

  // 文本样式获取 alreadySaved 是否点击查看过
  TextStyle _suggestionsTextStyle(bool alreadySaved, bool isSub) {
    return TextStyle(
      fontSize: isSub ? 20.0 : 15,
      color: alreadySaved ? Colors.grey : Colors.black,
    ); // 实例化TextStyle
  }

  // 列表构建方法
  Widget _buildSuggestions() {
    return ListView.builder(
        itemCount: _learnLists.length * 2,
        padding: const EdgeInsets.all(15.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd)
            return Divider(
              height: 2.0,
              color: Colors.grey,
            ); // 奇数,即不能被2整除

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          return _buildRow(_learnLists[index]);
        });
  }

  // 行标签构建方法
  Widget _buildRow(Map learnClass) {
    final alreadySaved = _saved.contains(learnClass); // 保存的数组中存在该字典,则表示已经点击过
    return ListTile(
      title: Text(
        learnClass['title'],
        style: _suggestionsTextStyle(alreadySaved, true), // 根据是否点击过来取得文本样式
      ),
      subtitle: Text(
        learnClass['detail'],
        style: _suggestionsTextStyle(alreadySaved, false),
      ),
      trailing: Text(
        alreadySaved ? '已学习' : '',
        style: _suggestionsTextStyle(alreadySaved, false),
      ),
      onTap: () {
        setState(() {
          !alreadySaved ? _saved.add(learnClass) : {}; // 点击过就标识已看过,颜色置灰
          _pushSaved(learnClass['title']);
        });
      },
    );
  }

  // 跳转
  void _pushSaved(String widgetName) {
//    Navigator.pushNamed(context,'/'+widgetName); // 原生路由跳转 - 原生可配合fluro使用
    // 手动设定
    Routes.router.navigateTo(context,'${widgetName}?message=${widgetName}',transition: TransitionType.native);
  }
  
}

