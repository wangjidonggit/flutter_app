import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() {
//  debugPaintSizeEnabled = true;
  //runApp(MyApp());
  runApp(_MyHomePageState());
}

class MyApp extends StatelessWidget {
  String get title => null;

  @override
  Widget build(BuildContext context) {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: new Column(
        children: [
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 1.0, color: Colors.red),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(20.0),
//                  child: new Image.asset('images/test.png'),
                child:  new Icon(Icons.star, color: Colors.green[500]),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
//                  child: new Image.asset('images/test.png'),
                  child: new Icon(Icons.star, color: Colors.green[500]),

                ),
              ),


            ],
          ),
        ],


      ),
    );
    // TODO: implement build
    return new MaterialApp(
      title: "测试标题头 ",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("哈哈哈哈"),
        ),
        body: container,

      ),


    );
  }
}


List<Container> _buildGridTileList(int count) {

  return new List<Container>.generate(
      count,
          (int index) =>
      new Container(
//          child: new Image.asset('images/pic${index+1}.jpg'))
            child: new Text("测试案例"),
  )
  );
}

Widget buildGrid() {
  return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(30));
}



// ignore: type_argument_not_matching_bounds
class _MyHomePageState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("哈哈哈 "),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }
}
