import 'dart:ui';
import 'package:flutter/material.dart';

class SchoolViewController extends StatefulWidget {
  @override
  _schoolViewControllerState createState() => _schoolViewControllerState();
}

class _schoolViewControllerState extends State<SchoolViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My School"),
        leading: Icon(Icons.verified_user),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings),onPressed: (){}),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("School Content", textScaleFactor: 5,textAlign: TextAlign.center),
      ),
    );
  }
}