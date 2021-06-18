import 'dart:async';
import 'package:movies/src/models/movieModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesProveider {
  String _apiKey = "db7626e684ab86a58ab98ec7084512d2";
  String _url = "api.themoviedb.org";
  String _lenguage = "en-US";
  bool _loading = false;

  Future<List<Movie>> _processResponse(Uri uri) async {
    final response = await http.get(uri);
    final decodeData = json.decode(response.body);

    // print(decodeData['results']);
    final movies = new Movies.fromJsonList(decodeData['results']);

    return movies.items;
  }

  int _popularesPage = 0;

  List<Movie> _populares = [];

  final _popularesStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Movie>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Movie>> getMoviesCinemas() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _lenguage,
    });
    return await _processResponse(url);
  }

  Future<List<Movie>> getMoviesPopular() async {
    if (_loading) {
      return [];
    }
    _loading = true;
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _lenguage,
      'page': _popularesPage.toString()
    });

    final response = await _processResponse(url);

    _populares.addAll(response);
    popularesSink(_populares);
    _loading = false;

    return response;
  }
}
