import 'dart:ui';
import 'package:flutter/material.dart';

class BasicWidgetsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold, AppBar 是Material中主要的布局组件.
    return Scaffold(
      appBar: AppBar(
        title: Text('BasicWidgetsView'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Column(
            children: <Widget>[
              _textWidgets('基础控件 Text Widget'),
              _getDivider(),//分割线
              _richTextWidgets('基础控件 Text'),
              _getDivider(),
              _rowWidgets(),
              _getDivider(),
              _columnWidgets(),
              _getDivider(),
              _containerWidgets(Colors.blue[600],Size(100, 100)),
              _getDivider(),
              _stackWidgets(),
              _getDivider(),
              _iconWidgets(),
              _getDivider(),
              _imageWidges_url(),
              _getDivider(),
              _imageWidges_bundle(),
              _getDivider(),
              _placeholderWidget(),
              _getDivider(),
              _raisedButtonWidget(),
              _getDivider(),
              _flatButtonWidget(),
              _getDivider(),
              _outlineButtonWidget(),
              _getDivider(),
              _switchAndCheckBoxTestRoute(),
              _getDivider(),
              _textFieldWidget(),
              _getDivider(),
              _linearProgressIndicatorWidgr(),
              _getDivider(),
              _wrapWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Wrap _wrapWidget() {
    return Wrap(
      direction: Axis.horizontal, // 布局方向
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.center, //沿主轴方向居中
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: Text('Hamilton - Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
          label: Text('Laurens'),
        ),
      ],
    );
  }

  Column _linearProgressIndicatorWidgr() {
    return Column(
      children: <Widget>[
        // 模糊进度条(会执行一个动画)
        LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        //进度条显示50%
        LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),
        // 模糊进度条(会执行一个旋转动画)
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
//进度条显示50%，会显示一个半圆
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),
      ],
    );
  }

  Column _textFieldWidget() {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: false,
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              hintStyle: TextStyle(fontSize: 12),
              prefixIcon: Icon(Icons.person)
          ),
        ),
        TextField(
          autofocus: false,
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              hintStyle: TextStyle(fontSize: 12),
              prefixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
        ),
      ],
    );
  }

  SwitchAndCheckBoxTestRoute _switchAndCheckBoxTestRoute() {
    return SwitchAndCheckBoxTestRoute();
  }

  OutlineButton _outlineButtonWidget() {
//    return OutlineButton.icon(onPressed: (){}, icon: Icon(Icons.add,color: Colors.red,), label: Text("添加",style: TextStyle(color: Colors.red)));
    return OutlineButton(
//      padding: const EdgeInsets.all(103), // 按钮外部填充区域大小
      textColor: Colors.red,
      disabledTextColor: Colors.grey,
      color: Colors.green,
      borderSide: BorderSide(width: 5,color: Colors.yellow),
      disabledBorderColor: Colors.blue,
      highlightColor: Colors.orange, // 按钮按下时的背景颜色,高亮颜色
      splashColor: Colors.blue, //点击时的水波颜色
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //外形
      child: Text('FlatButton'),
      onPressed: (){},
    );
  }

  // 即扁平按钮，默认背景透明并不带阴影
  FlatButton _flatButtonWidget() {
//    return FlatButton.icon(onPressed: (){}, icon: Icon(Icons.send,color: Colors.red,), label: Text("发送",style: TextStyle(color: Colors.red)));
    return FlatButton(
//      padding: const EdgeInsets.all(103),
      textColor: Colors.red,
      disabledTextColor: Colors.grey,
      color: Colors.green,
      disabledColor: Colors.blue,
      colorBrightness:  Brightness.light,//按钮主题，默认是浅色主题
      child: Text('FlatButton'),
      onPressed: (){},
    );
  }

  // 即"漂浮"按钮，它默认带有阴影和灰色背景，按下后，阴影会变大。
  RaisedButton _raisedButtonWidget() {
    return RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.search,color: Colors.red,), label: Text("查找",style: TextStyle(color: Colors.red)));
    return RaisedButton(
//      padding: const EdgeInsets.all(103),
      textColor: Colors.red,
      disabledTextColor: Colors.grey,
//      color: Colors.green,
//      disabledColor: Colors.blue,
      child: Text('RaisedButton'),
      onPressed: (){}, // (){}匿名函数

    );
  }

  Placeholder _placeholderWidget() {
    return Placeholder(
      color: Colors.grey,
      strokeWidth: 5.0, // 占位灰线宽度px
      fallbackWidth: 100, // 如果父试图无边界,则宽度为100
      fallbackHeight: 100, // 如果父试图无边界,则高度为100
    );
  }

  // 本地图片 - 需要1.把图片拖动到某个文件中 2.在配置文件pubspec.yaml中做相应的路径配置
  Image _imageWidges_bundle() {
    return Image.asset('images/15762202645802.png',
        width: 200,
        fit: BoxFit.fitWidth,
    );
  }

  // 网络图片
  Image _imageWidges_url() {
    return Image(
      width: 200,
      fit: BoxFit.fitWidth,
      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    );
  }

  // 图标 Icon
  Container _iconWidgets() {
    return Container(
      width: 200,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // 弹簧均匀布局
        children: const <Widget>[
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes', // 语意标签
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 30.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 36.0,
          ),
        ],
      ),
    );
  }
  //堆叠器 - Stack 允许子 widget 堆叠
  Stack _stackWidgets() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _containerWidgets(Colors.blue, Size(150, 150)),
        _containerWidgets(Colors.red, Size(120, 120)),
        _containerWidgets(Colors.green, Size(100, 100)),
      ],
    );
  }

  // 容器 - 可设定大小,背景色,阴影等
  Container _containerWidgets(Color color, Size size) {
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.topCenter, // 对齐方式
      color: color,//背景色
      margin: const EdgeInsets.all(10),//内边距
      transform: Matrix4.rotationZ(0.1), // 位置变换
        //constraints:,约束
    );
  }

  // 纵向布局 - 内容放在children参数数组中
  Column _columnWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlutterLogo(),
        FlutterLogo(),
        FlutterLogo(),
      ],
    );
  }

  // 横向布局 - 内容放在children参数数组中
  Row _rowWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlutterLogo(size: 50),
        FlutterLogo(size: 50),
        FlutterLogo(size: 50),
        FlutterLogo(size: 50),
      ],
    );
  }

  // 普通Text
  Text _textWidgets(String title) {
    return Text(
      title, // 文本内容
      textAlign: TextAlign.center, // 文本对齐方式
      overflow: TextOverflow.ellipsis, // 超区域渲染模式
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25, wordSpacing : 20 , letterSpacing: 5), // 字体属性 wordSpacing单词间隔 letterSpacing字符间隔
      textDirection: TextDirection.ltr, // ltr 做导游  rtl 右到左
    );
  }

  // 富文本
  Text _richTextWidgets(String title) {
    return Text.rich(
      TextSpan(
        text: '富文本',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),
        children: <TextSpan>[
          TextSpan(
              text: title.substring(0, 3),
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 30)),
          TextSpan(
              text: title.substring(4),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 30)),
        ],
      ),
    );
  }

  // 分割线
  Divider _getDivider() {
    return Divider(
      height: 2.0,
      color: Colors.grey,
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _switchSelected,//当前状态
              onChanged:(value){
                //重新构建页面
                setState(() {
                  _switchSelected=value;
                });
              },
            ),
            Switch(
              value: !_switchSelected,//当前状态
              onChanged:(value){
                //重新构建页面
                setState(() {
                  _switchSelected=!value;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged:(value){
                setState(() {
                  _checkboxSelected=value;
                });
              } ,
            ),
            Checkbox(
              value: !_checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged:(value){
                setState(() {
                  _checkboxSelected=!value;
                });
              } ,
            )
          ],
        ),
      ],
    );
  }
}
