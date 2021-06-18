import 'package:flutter/material.dart';
import 'package:movies/src/pages/homePage.dart';
import 'package:movies/src/widgests/movieDetail.dart';

Map<String, WidgetBuilder> getRoutes() {
  return (<String, WidgetBuilder>{
    "/": (BuildContext context) => HomePage(),
    "detail": (BuildContext context) => MovieDetail(),
  });
}
