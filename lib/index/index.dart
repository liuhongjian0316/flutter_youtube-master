/**
 * 底部导航栏
 */
import 'package:flutter/material.dart';
import 'package:flutteryoutube/explore/explore_page.dart';
import 'package:flutteryoutube/global_config.dart';
import 'package:flutteryoutube/home/home_page.dart';
import 'navigation_icon_view.dart';


class Index extends StatefulWidget{

  @override
  State<Index> createState() =>new _IndexState();

}

class _IndexState extends State<Index> with TickerProviderStateMixin {

  int _currentIndex = 0; //当前索引
  List<NavigationIconView> _navigationViews; //底部导航栏
  List<StatefulWidget> _pageList; // 页面列表存放底部导行对应的页面
  StatefulWidget _currentPage; //当前页面

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.home),
        title: new Text("首页"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.explore),
        title: new Text("探索"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.subscriptions),
        title: new Text("订阅内容"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.inbox),
        title: new Text("收件箱"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.video_library),
        title: new Text("媒体库"),
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      new HomePage(),
      new ExplorePage(),
      new ExplorePage(),
      new ExplorePage(),
      new ExplorePage(),
    ];
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState((){});
  }

@override
  void dispose() {
    super.dispose();
    for(NavigationIconView view in _navigationViews){
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationIconView) => navigationIconView.item)
          .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.red,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage =_pageList[_currentIndex];
        });
      },
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: GlobalConfig.themeData,
    );
  }
}

