import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class BusinessViewController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _businessViewControllerState();
}

 class _businessViewControllerState extends State<BusinessViewController> with SingleTickerProviderStateMixin {
   TabController _tabController;
   List<String> tabs = ["新闻", "游戏", "娱乐", "科普", "动漫", "搞笑"];

   @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener((){
      switch (_tabController.index) {
        case 0 : break;
        case 1 : break;
      }
    });
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: TabBar(
           indicatorColor: Colors.red,
           controller: _tabController,
           tabs: tabs.map((e)=>Tab(text: e)).toList(),
         ),
       ),
       body: TabBarView(
         controller: _tabController,
         children: tabs.map((e) {
           return Container(
             alignment: Alignment.center,
             child: Text(e,textAlign: TextAlign.center,textScaleFactor: 5),
           );
         }).toList(),
       ),
     );
   }
 }