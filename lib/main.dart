import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widget Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Basic Widget Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<Color> colors = [
  Colors.blue,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.purple
];
Color currentColor;

class _MyHomePageState extends State<MyHomePage> {
  int _counter;

  @override
  void initState() {
    super.initState();
    initOperations();
  }

  void initOperations() {
    _counter = 0;
    currentColor =
        colors[_counter]; //sets default color to first color in the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        key: Key(currentColor.toString()),
        color: currentColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell( //used solely to achieve long press
                key: Key("${currentColor.toString()}xInkwell"),
                onLongPress: () {
                  setState(() {
                    initOperations();
                  });
                },
                child: RaisedButton(
                  key: Key("${currentColor.toString()}xButton"),
                  onPressed: () {
                    //display first color if button is clicked on last, else display next color
                    _counter < colors.length - 1 ? _counter++ : _counter = 0;
                    setState(() {
                      currentColor = colors[_counter];
                    });
                  },
                  child: Text("Change Color"),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
