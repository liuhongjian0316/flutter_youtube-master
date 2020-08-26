import 'package:flutter/cupertino.dart';
/**
 *  首页
 */
import 'package:flutter/material.dart';
import 'package:flutteryoutube/search/search_page.dart';
import 'package:flutteryoutube/user/user_page.dart';
import '../global_config.dart';
import 'video_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

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
              FlatButton(
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "张三",
                      style: new TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return  UserPage();
                      }));
                }
              ),
            ],
          ),
          body:ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            return new Column(
              children: <Widget>[
                //广告位置
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return SizedBox(         //二：返回一个有高度的SizedBox，对话框高度就是此高度
                                height: 620,
                                child: new MaterialApp(
                                  home: new Scaffold(
                                    appBar: PreferredSize(
                                      preferredSize: Size.fromHeight(30),
                                      child: new AppBar(
                                        leading:  Image.network(
                                          'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1652181915,2401887699&fm=26&gp=0.jpg',
                                        ),
                                        brightness: Brightness.light,
                                        backgroundColor: Colors.white,
                                        title: Text('Google Play',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: new Icon(Icons.close),
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((val) {
                            print(val);
                          });
                        },
                        child: new Container(
                          width: 400.0,
                          height: 400.0,
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                'assets/images/ad.jpg',
                                fit: BoxFit.fitWidth,
                              ),
                              new Container(
                                width: 375.0,
                                child: new FlatButton(
                                  child: new Row(
                                    children: <Widget>[
                                      new Text('下载',style: TextStyle(color: Colors.blue[900]),),
                                      new Text('                                                                            '),
                                      new Icon(Icons.vertical_align_bottom,color: Colors.blue[900],),
                                    ],
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return SizedBox(         //二：返回一个有高度的SizedBox，对话框高度就是此高度
                                            height: 620,
                                            child: new MaterialApp(
                                              home: new Scaffold(
                                                appBar: PreferredSize(
                                                  preferredSize: Size.fromHeight(30),
                                                  child: new AppBar(
                                                    leading:  Image.network(
                                                      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1652181915,2401887699&fm=26&gp=0.jpg',
                                                    ),
                                                    brightness: Brightness.light,
                                                    backgroundColor: Colors.white,
                                                    title: Text('Google Play',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: new Icon(Icons.close),
                                                        onPressed: (){
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  color: Colors.blue[100],
                                ),
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    '人中之龍Online                                   ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //为什么显示广告按钮
                                  new FlatButton(
                                      onPressed: (){
                                        showDialog<Null>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return new SimpleDialog(
                                              children: <Widget>[
                                                new SimpleDialogOption(
                                                  child: new Text('分享'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                new SimpleDialogOption(
                                                  child: new Text('为什么显示该广告？'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                new SimpleDialogOption(
                                                  child: new Text('停止显示此广告'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        ).then((val) {
                                          print(val);
                                        });
                                      },
                                      child: new Icon(Icons.more_vert)
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    '灌篮高手全国大赛今日开赛 湖北五虎再次聚首',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    '有你带领他们征战全国大赛',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    '广告',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.white,
                                        backgroundColor: Colors.orange
                                    ),
                                  ),
                                  new Text(
                                    '   4.0  ',
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Icon(Icons.star,size: 14.0,),
                                      new Icon(Icons.star,size: 14.0,),
                                      new Icon(Icons.star,size: 14.0,),
                                      new Icon(Icons.star,size: 14.0,),
                                      new Icon(Icons.star_half,size: 14.0,),
                                      new Text(' 免费'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 0),
                      ),
                      //分割线
                      Divider(
                        height: 10.0,
                        indent: 0.0,
                        color: Colors.grey[900]
                      ),
                      //视频位置
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
                      //分割线
                      Divider(
                          height: 10.0,
                          indent: 0.0,
                          color: Colors.grey[900]
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(height: .0),
        ),
        ),
        theme: GlobalConfig.themeData
    );
  }

}