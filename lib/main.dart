import 'dart:math';

import 'package:flutter/material.dart';

List<Color> initColors = [
  Colors.red,
  Colors.green,
  Colors.yellow,
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presentation app"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Container(height: 8);
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 100,
            color:
                initColors[random.nextInt(initColors.length)].withOpacity(0.5),
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
