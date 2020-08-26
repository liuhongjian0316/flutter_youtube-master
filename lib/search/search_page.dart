/**
 * 索索界面
 */
import 'package:flutter/material.dart';
import 'package:flutteryoutube/user/user_page.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => new _SearchPageState();

}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: 25.0,),
          child: Container(
            height: 60.0,
            child: new Padding(
                padding: const EdgeInsets.all(6.0),
                child: new Card(
                    child: new Container(
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              IconButton(
                                icon: new Icon(Icons.keyboard_backspace, color: Colors.grey,),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                          SizedBox(width: 15.0,),
                          Icon(Icons.search, color: Colors.grey,),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: TextField(
                                controller: controller,
                                decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.only(top: -10.0),
                                    hintText: 'Search', border: InputBorder.none),
                                // onChanged: onSearchTextChanged,
                              ),
                            ),
                          ),
                          new IconButton(
                            icon: new Icon(Icons.cancel),
                            color: Colors.grey,
                            iconSize: 18.0,
                            onPressed: () {
                              controller.clear();
                              //onSearchTextChanged('');
                            },
                          ),
                        ],
                      ),
                    )
                )
            ),
          ),
        ),
      ),
    );
  }

}