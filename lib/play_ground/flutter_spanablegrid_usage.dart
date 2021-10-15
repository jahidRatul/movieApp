import 'package:flutter/material.dart';
import '../view/custom/grid_view/flutter_spanablegrid.dart';

class TestGridView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class HomeChildDelegate extends SliverChildDelegate {
  @override
  Widget build(BuildContext context, int index) {
    if (index >= 10) return null;

    Color color = Colors.red;

    if (index == 0)
      color = Colors.blue;
 /*   else if (index == 1 || index == 10)
      color = Colors.cyan;*/
    else if (index < 10) color = Colors.green;

    return new Container(
        decoration: new BoxDecoration(color: color, shape: BoxShape.rectangle));
  }

  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) => true;

  @override
  int get estimatedChildCount => 20;
}

class HomeGridDelegate extends SpanableSliverGridDelegate {
  HomeGridDelegate() : super(3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0);

  @override
  int getCrossAxisSpan(int index) {
    if (index > 1 && index < 10) return 1;
    return 6;
  }

  @override
  double getMainAxisExtent(int index) {
    if (index == 0) return 120.0;
    if (index == 1 || index == 10) return 50.0;
    return 100.0;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  Widget _buildBody(BuildContext context) {
    return new GridView.custom(
      gridDelegate: HomeGridDelegate(),
      childrenDelegate: new HomeChildDelegate(),
      padding: new EdgeInsets.all(12.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(context),
    );
  }
}
