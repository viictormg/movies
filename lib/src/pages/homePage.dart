import 'package:flutter/material.dart';
import 'package:movies/src/providers/moviesProviders.dart';
import 'package:movies/src/widgests/cardSwiperWidget.dart';
import 'package:movies/src/widgests/movieHorizontal.dart';

class HomePage extends StatelessWidget {
  final moviesProvider = new MoviesProveider();

  @override
  Widget build(BuildContext context) {
    moviesProvider.getMoviesPopular();

    return (Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Peliculas en cine"),
          backgroundColor: Colors.indigoAccent,
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: (Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_swiperCards(), _footerSection(context)],
          ),
        ))));
  }

  Widget _swiperCards() {
    return FutureBuilder(
        future: moviesProvider.getMoviesCinemas(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CardSwiper(listMovies: snapshot.data);
          } else {
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.amber,
                ),
              ),
            );
          }
        });
  }

  Widget _footerSection(context) {
    return (Container(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Populares",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        StreamBuilder(
          stream: moviesProvider.popularesStream,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return MovieHorizontal(
                  movies: snapshot.data,
                  nextPage: moviesProvider.getMoviesPopular);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ]),
    ));
  }
}
