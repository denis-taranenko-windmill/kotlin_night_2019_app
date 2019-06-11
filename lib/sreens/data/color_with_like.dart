import 'dart:ui';

class ColorWithLike {
  Color color;
  bool isLiked;

  ColorWithLike(this.color, {this.isLiked = false});

  static List<ColorWithLike> convertFromColorsList(List<Color> colors) =>
      colors.map((color) => ColorWithLike(color)).toList();
}
