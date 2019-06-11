import 'dart:async';
import 'dart:ui';

import 'package:kotlin_night_2019_app/sreens/common/bloc_base.dart';
import 'package:kotlin_night_2019_app/sreens/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/sreens/data_soruces/colors_data_source.dart';
import 'package:rxdart/rxdart.dart';

class ColorsBloc extends BlocBase {
  final ColorsDataSource _dataSource;
  List<ColorWithLike> _colors;

  BehaviorSubject<List<ColorWithLike>> _streamControllser;
  Stream<List<ColorWithLike>> get stream => _streamControllser.stream;

  ColorsBloc(this._dataSource, List<Color> initColors) {
    _streamControllser = BehaviorSubject<List<ColorWithLike>>();
    _colors = List()..addAll(ColorWithLike.convertFromColorsList(initColors));
    _streamControllser.sink.add(_colors);
  }

  void addRandomColor() async {
    var newStrColor = await _dataSource.loadRandomColor();
    _colors.add(
      ColorWithLike(hexToColor(newStrColor)),
    );
    _streamControllser.sink.add(_colors);
  }

  @override
  void dispose() {
    _streamControllser?.close();
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code, radix: 16) + 0xFF000000);
  }
}
