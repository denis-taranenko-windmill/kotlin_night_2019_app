import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:kotlin_night_2019_app/sreens/data/colors_response.dart';

class ColorsDataSource {
  loadRandomColor() async {
    final response = await get("http://www.colr.org/json/color/random");

    if (response.statusCode == 200) {
      String newColor =
          ResponseColor.fromJson(json.decode(response.body)).newColor;
      return newColor;
    }
  }
}
