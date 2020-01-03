import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FirstFluterAppView extends StatefulWidget {
  @override
  FirstFluterAppViewState createState() => FirstFluterAppViewState(); // createState方法返回一个FirstFluterAppViewState实例
}

class FirstFluterAppViewState extends State<FirstFluterAppView> {
  //final：用于修饰变量，表示单赋值（single-assignment），使用final修饰的变量必须进行初始化，一旦被赋值之后，不能够再次被赋值,否则编译会报错。
  final _suggestions = <WordPair>[]; // 实例化一个装着WordPair的数组
  final _saved = Set<WordPair>(); // 实例化一个去重的无序的Set
  final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstFluterApp'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(), // body的内容为私有方法返回的Widget对象_buildSuggestions
    );
  }

  // 导航右键点击响应
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _suggestionsTextStyle(true),
                ),
              );
            },
          );

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: 0 != divided.length ? ListView(children: divided) : Center(child: Text('Saved Suggestions Is Empty')),
          );
        },
      ),
    );
  }

  TextStyle _suggestionsTextStyle(bool alreadySaved) {
    return TextStyle(
      fontSize: 18.0,
      color: alreadySaved ? Colors.red : Colors.black,
    ); // 实例化TextStyle
  }

  Widget _buildSuggestions() {
    return ListView.builder(
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
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _suggestionsTextStyle(alreadySaved),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          alreadySaved ? _saved.remove(pair) : _saved.add(pair);
        });
      },
    );
  }
}
