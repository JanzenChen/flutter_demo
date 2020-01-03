import 'dart:ui';
import 'package:flutter/material.dart';

class HelloFlutterDemo extends StatelessWidget {
  @override
  HelloFlutterView build(BuildContext context) => HelloFlutterView(title: 'HelloFlutter');
}

class HelloFlutterView extends StatefulWidget {
  HelloFlutterView({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HelloFlutterViewState createState() => _HelloFlutterViewState();
}

class _HelloFlutterViewState extends State<HelloFlutterView> {
  int _counter = 0;

  void _incrementCounter() {
     // 热重载状态绑定
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment Count',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor, // 使用全局颜色
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


