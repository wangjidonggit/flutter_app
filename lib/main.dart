import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

//void main() => runApp(new MyApp());
void main() {
//  debugPaintSizeEnabled=true;
//  runApp(MyApp());

  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}

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
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Fields in a Widget subclass are always marked "final".
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
      margin: const EdgeInsets.fromLTRB(8, 12, 8, 0),
//      decoration: BoxDecoration(color: Colors.blue[500]),
      decoration: const BoxDecoration(color: Colors.blue),

      // Row is a horizontal, linear layout.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        // <Widget> is the type of items in the list.10
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          TestView(
            title: Text(
              "纵向排列",
              style: Theme.of(context).primaryTextTheme.title,
            ),

          ),

          Expanded(
            child: Center(
              child: Text('Hello, world!',style: new TextStyle(wordSpacing: 100,color: Colors.blue,fontSize: 40)),

            ),
          ),
        ],
      ),
    );
  }
}

class TestView extends StatelessWidget {
  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Colors.green),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.mail),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.camera),
            tooltip: 'Search',
            onPressed: null,
          ),
          new Image.asset('images/myPic.jpg', fit: BoxFit.cover),
          new Icon(Icons.star, color: Colors.red[500])

        ],
      ),
    );
  }

  TestView({this.title});
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
//      body:_textView(),
//       body: new Center(
//         child: _textView(),
//       ),
    );
  }

  Widget _textView() {
    return new Text("SS").build(context);
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(
          () {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          },
        );
      },
    );
  }
}
