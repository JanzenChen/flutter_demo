import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart';
import 'Routes.dart';


//启动 - fluro路由
void main() {
  ///初始化并配置路由
  final router = Router();
  Routes.configureRoutes(router);
  runApp(
//      CupertinoApp(onGenerateRoute: Routes.router.generator,debugShowCheckedModeBanner: false,theme: CupertinoThemeData(
//        primaryColor: Colors.blue,
//      ))
      MaterialApp(onGenerateRoute: Routes.router.generator,debugShowCheckedModeBanner: false,theme: ThemeData(
        primaryColor: Colors.green, // 全局颜色
      ))
  );
}

// 原生路由
//void main() => runApp(MyApp());
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Fluter学习日记',
//      initialRoute:"/", //如果注册了名为"/"的路由,home参数可不传,home就是指向"/"指向的路由页面
//      theme: ThemeData(
//        primaryColor: Colors.red, // 全局颜色
//      ),
//      home: FlutterLearnListsView(), // 学习课程列表
//      routes: {
//        '/HelloFluter':(context) => HelloFlutter(),
//      },//原生路由注册
//    );
//  }
//}

