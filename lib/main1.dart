import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/main.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

//void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter  test'),
        ),
//        body: new Center(
//          child: new RandomWords(),
//
//        ),
        body: new Container(
//            height: 500,
          child: new Column(
//            mainAxisAlignment:MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
//            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Icon(Icons.star, color: Colors.green[500]),
                  new Icon(Icons.star, color: Colors.green[500]),
                  new Icon(Icons.star, color: Colors.green[500]),
                  new Icon(Icons.star, color: Colors.black),
                  new Icon(Icons.star, color: Colors.black),
                  new Text("SDFSDF"),
                  new BackButton(),
                ],
              ),
              new Expanded(child: new Text("frist View ")),
              new Row(
                children: <Widget>[
                  new Icon(Icons.kitchen, color: Colors.green[500]),
                  new Text('PREP:'),
                  new Text('25 min'),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen, color: Colors.green[500]),
                  new Text('PREP:'),
                  new Text('25 min'),
                ],
              ),
              new Expanded(
//                 flex: 3,
                  child: new Text("中间键 ")),
              new Expanded(child: new Text("右侧按钮 ")),
              new Card(
                child: new Text("CARDSSS"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
