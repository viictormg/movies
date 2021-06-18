class Movies {
  List<Movie> items = [];

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final movie = new Movie.fromJsonMap(item);
        items.add(movie);
      }
    }
  }
}

class Movie {
  String posterPath;
  bool adult;
  String overview;
  String releaseDate;
  List<int> genreIds;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  String backdropPath;
  double popularity;
  int voteCount;
  bool video;
  double voteAverage;

  Movie({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'] / 1;
    voteCount = json['vote_pount'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
  }

  getPostImg() {
    if (posterPath == null) {
      return "https://pm1.narvii.com/6201/52c4ef1ffe82a66f3f57577527dffd4330dfb4d4_hq.jpg";
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackgroundImg() {
    if (posterPath == null) {
      return "https://pm1.narvii.com/6201/52c4ef1ffe82a66f3f57577527dffd4330dfb4d4_hq.jpg";
    } else {
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    }
  }
}
