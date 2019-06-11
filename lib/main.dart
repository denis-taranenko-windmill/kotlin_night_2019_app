import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/sreens/data_soruces/colors_data_source.dart';
import 'package:kotlin_night_2019_app/sreens/list_screen/list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kotlin Night App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
    );
  }
}
