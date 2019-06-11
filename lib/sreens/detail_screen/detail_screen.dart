import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/sreens/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/sreens/list_screen/list_screen.dart';

class DetailColor extends StatelessWidget {
  final ColorWithLike _colorWithLike;

  const DetailColor({Key key, ColorWithLike colorWithLike})
      : _colorWithLike = colorWithLike,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          LikeButton(
            colorWithLike: _colorWithLike,
          ),
        ],
      ),
      body: Container(
        color: _colorWithLike.color,
      ),
    );
  }
}
