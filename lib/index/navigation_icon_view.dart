/**
 * 底部导航栏
 */
import 'package:flutter/material.dart';

class NavigationIconView{
  final BottomNavigationBarItem item; //底部
  final AnimationController controller;

  NavigationIconView({
    Widget icon,
    Widget title,
    TickerProvider vsync
  }):
  item = new BottomNavigationBarItem(
    icon: icon,
    title: title,
  ),
  controller = new AnimationController(
    duration: kThemeAnimationDuration,
    vsync: vsync
  );
}