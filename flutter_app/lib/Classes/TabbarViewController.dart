import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'FlutterLearnListsView.dart';
import 'BusinessViewController.dart';
import 'SchoolViewController.dart';

class TabbarViewController extends StatefulWidget {
  @override
  _tabbarViewControllerState createState() => _tabbarViewControllerState();
}

class _tabbarViewControllerState extends State<TabbarViewController> {
  int _selectedIndex = 0;
  var title = "Flutter 学习";
  var _selectedViewController;

  final List<Widget> _tabViewControllers = [
    FlutterLearnListsView(),
    BusinessViewController(),
    SchoolViewController(),
  ];

  @override
  void initState() {
    super.initState();
    _onItemTapped(0); // 默认第一个,为了主动刷新显示title
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerViewController(), // 左侧抽屉 - 默认图标
//      bottomNavigationBar: BottomNavigationBar(
//        // 底部的分类导航按钮
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
//          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Business")),
//          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("School")),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.only(top: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MyTabbarItem(img:Icons.home, title:"首页", itemThemeColor:0 == _selectedIndex ? Colors.red : Colors.grey, onPassed:(){_onItemTapped(0);}),
              SizedBox(),
              MyTabbarItem(img:Icons.home, title:"发布", itemThemeColor:1 == _selectedIndex ? Colors.red : Colors.grey, onPassed:(){_onItemTapped(1);}),
              SizedBox(),
              MyTabbarItem(img:Icons.home, title:"校园", itemThemeColor:2 == _selectedIndex ? Colors.red : Colors.grey, onPassed:(){_onItemTapped(2);}),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabViewControllers,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: 1 == _selectedIndex ? Colors.red : Colors.grey,
        // 悬浮按钮
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTapped(int index) {
    setState(() { // 状态切换
      _selectedIndex = index;
      _selectedViewController = _tabViewControllers[index];
      switch (index) {
        case 0 : {title = "Flutter学习课程表"; break;}
        case 1 : {title = "Business 页面"; break;}
        case 2 : {title = "School 页面"; break;}
      }
    });
  }

  void _onAdd() {
    _onItemTapped(1);
  }
}

class MyTabbarItem extends StatelessWidget {
  MyTabbarItem({Key key, this.img, this.title, this.itemThemeColor, this.onPassed}) : super(key : key);
  final IconData img;
  final String title;
  final VoidCallback onPassed;
  final Color itemThemeColor;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: this.onPassed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(this.img, color: this.itemThemeColor),
            Text(this.title, style: TextStyle(color: this.itemThemeColor))
          ],
        ));
  }
}

class DrawerViewController extends StatelessWidget {
  const DrawerViewController({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/15762202645802.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

