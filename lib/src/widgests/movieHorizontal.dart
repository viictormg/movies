import 'package:flutter/material.dart';
import 'package:movies/src/models/movieModel.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;
  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  MovieHorizontal({@required this.movies, @required this.nextPage});

  @override
  build(BuildContext context) {
    final _screeSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });

    return Container(
      height: _screeSize.height * 0.22,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, i) {
          return _card(context, movies[i]);
        },
        // children: _cards(),
      ),
    );
  }

  Widget _card(context, movie) {
    final card = Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              image: NetworkImage(movie.getPostImg()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          // SizedBox()
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detail", arguments: movie);
      },
      child: card,
    );
  }

  List<Widget> _cards() {
    return movies.map((movie) {}).toList();
  }
}
