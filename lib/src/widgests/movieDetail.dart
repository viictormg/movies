import 'package:flutter/material.dart';
import 'package:movies/src/models/movieModel.dart';

class MovieDetail extends StatelessWidget {
  @override
  build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _appBar(movie),
      ],
    ));
  }

  Widget _appBar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        background: FadeInImage(
            image: NetworkImage(movie.getBackgroundImg(), scale: 3),
            placeholder: AssetImage('assets/img/loading.gif'),
            fit: BoxFit.cover
            // fadeInDuration: Duration(microseconds: 150),
            ),
      ),
    );
  }
}
