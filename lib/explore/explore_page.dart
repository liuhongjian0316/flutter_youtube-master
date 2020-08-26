/***
 * 探索界面
 */
import 'package:flutter/material.dart';
import 'package:flutteryoutube/home/video_page.dart';
import 'package:flutteryoutube/search/search_page.dart';
import 'package:flutteryoutube/user/user_page.dart';

class ExplorePage extends StatefulWidget {

  @override
  _ExplorePageState createState() => new _ExplorePageState();

}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading:  Image.asset('assets/images/logo.jpg',width: 800,height: 800,),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text('YouTube',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.videocam), onPressed: null),
            new IconButton(icon: new Icon(Icons.search,color: Colors.grey,), onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return  SearchPage();
                  }));
            }),
            ClipOval(
              child: new IconButton(
                  icon: new Image.asset('assets/images/touxiang.jpg',width: 24.0,),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return  UserPage();
                        }));
                  }),
            ),
          ],
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new SizedBox(
                child: new Flow(
                  delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                  children: <Widget>[
                    new Container(
                      width: 80.0,
                      height:90.0,
                      color: Colors.red[400],
                      child: new FlatButton(
                        onPressed: null,
                        child: new Icon(Icons.music_note),
                      ),
                    ),
                    new Container(width: 80.0, height:80.0, color: Colors.green,),
                    new Container(width: 80.0, height:80.0, color: Colors.blue,),
                    new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
                    new Container(width: 80.0, height:80.0, color: Colors.brown,),
                    new Container(width: 80.0, height:80.0,  color: Colors.pink,),
                    new Container(width: 80.0, height:80.0,  color: Colors.lightGreen,),
                    new Container(width: 80.0, height:80.0,  color: Colors.purple,),
                  ],
                ),
              ),
              new Column(
                children: <Widget>[
                  new FlatButton(
                    child: new Column(
                      children: <Widget>[
                        Image.asset("assets/images/cover.jpg"),
                        Row(
                          children: <Widget>[
                            new ClipOval(
                              child: new Image.asset('assets/images/header.jpg',fit: BoxFit.fill,width: 40,height: 40,),
                            ),
                            Expanded(
                              child: new Text(
                                '     人类永生，人类清零计划                                              '
                                    '@AiJiu . 1370次观看 . 7个月前',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => VideoPage())
                      );
                    },
                  ),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
