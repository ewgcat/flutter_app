import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'net/DioUtil.dart';

final logger = Logger();

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    DioUtil().post("gdata/newPoint", data: {
      "sessionId": "3D88CD8BC0E83F57DF4BC8E8C205384A",
      "platform": 1,
      "appVersion": "3.0.9",
      "ter": "MI 9 Transparent Edition",
      "terv": "android10 29",
      "userId": 40,
      "token": "c079014e1ccb49eba8cf51344d18028c",
      "eventType": 1,
      "page": "index"
    }, errorCallback: (msg) {
      logger.d('msg : $msg');
    }).then((data) {
      logger.d('Http response: $data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('这是首页'),
        ),
      ),
    );
  }
}
