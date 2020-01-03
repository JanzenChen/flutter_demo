import 'dart:developer';
import 'dart:math';

import 'package:fluro/fluro.dart';

import 'Classes/FlutterLearnListsView.dart';
import 'Classes/HelloFluterView.dart';
import 'Classes/FirstFluterAppView.dart';
import 'Classes/BasicWidgetsView.dart';
import 'Classes/TabbarViewController.dart';

class Routes {
  static Router router;
  static String classLists = '/';
  static String class_1 = '/HelloFluter';
  static String class_2 = '/FirstFluterAppView';
  static String class_3 = '/BasicWidgetsView';

  static var learnLists =  <Map>[
    {'title':class_1.substring(1),'detail':'体验Flutter热重载'},
    {'title':class_2.substring(1),'detail':'编写第一个 Flutter App'},
    {'title':class_3.substring(1),'detail':'基础控件的使用'},
  ];

  static void configureRoutes(Router router) {
    router.define(classLists, handler: Handler(handlerFunc: (context, params) => TabbarViewController()));
    router.define(class_1, handler: Handler(handlerFunc: (context, params){
      var message = params['message']?.first;//取出传参  params = {message: [HelloFluter]}
      print('params.message = ' + message);
      return HelloFlutterDemo();
    }));
    router.define(class_2, handler: Handler(handlerFunc: (context, params) => FirstFluterAppView()));
    router.define(class_3, handler: Handler(handlerFunc: (context, params) => BasicWidgetsView()));
    Routes.router = router;
  }
}
