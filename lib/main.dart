/**
 * 程序入口
 */
import 'package:flutter/material.dart';
import 'index/index.dart';

void main() => runApp(new YouTube());

class YouTube extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "YouTube 仿照",
      home: new Index()
    );
  }

}