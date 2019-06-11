import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/constants.dart';
import 'package:kotlin_night_2019_app/sreens/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/sreens/data_soruces/colors_data_source.dart';
import 'package:kotlin_night_2019_app/sreens/detail_screen/detail_screen.dart';
import 'package:kotlin_night_2019_app/sreens/list_screen/colors_bloc.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ColorsBloc>(
      builder: (BuildContext context) => ColorsBloc(
            ColorsDataSource(),
            initColors,
          ),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Presentation app"),
        ),
        body: _ListColorsBody(),
        floatingActionButton: new ColorsFloatingActionButton(),
      ),
    );
  }
}

class ColorsFloatingActionButton extends StatelessWidget {
  const ColorsFloatingActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: Provider.of<ColorsBloc>(context).addRandomColor,
    );
  }
}

class _ListColorsBody extends StatelessWidget {
  const _ListColorsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<ColorsBloc>(context).stream,
      builder: (context, AsyncSnapshot<List<ColorWithLike>> snapshot) {
        if (snapshot.hasData) {
          var colorsList = snapshot.data;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Container(height: 8);
            },
            itemCount: colorsList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailColor(colorWithLike: colorsList[index]),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  height: 100,
                  color: colorsList[index].color.withOpacity(0.5),
                  child: LikeButton(colorWithLike: colorsList[index]),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}

class LikeButton extends StatefulWidget {
  final ColorWithLike _colorWithLike;
  LikeButton({Key key, colorWithLike})
      : _colorWithLike = colorWithLike,
        super(key: key);

  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  void _onPressed() {
    setState(() {
      widget._colorWithLike.isLiked = !widget._colorWithLike.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget._colorWithLike.isLiked) {
      return IconButton(
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        onPressed: _onPressed,
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: _onPressed,
      );
    }
  }
}
