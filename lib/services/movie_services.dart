import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_ticket/models/movie.dart';
import 'package:movie_ticket/models/movie_detail.dart';
import 'package:movie_ticket/shared/shared_value.dart';

class MovieServices {
  static Future<List<Movie>> getMovies() async {

    String baseUrl =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US";
    var response = await http.get(baseUrl);
    var jsonObject = json.decode(response.body);
    var movieList = jsonObject["results"] as List;
    var movies = movieList.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }

  static Future<MovieDetail> getDetails(int movieID, Movie movie) async {
    String baseUrl =
        "https://api.themoviedb.org/3/movie/$movieID}?api_key=$apiKey&language=en-US";

    var response = await http.get(baseUrl);
    var jsonObject = json.decode(response.body);
    var runtime = jsonObject["runtime"];
    var genres = (jsonObject as Map<String, dynamic>)["genres"] as List;
    var language = jsonObject["original_language"];

    switch (language) {
      case "ja":
        language = "Japanese";
        break;
      case "id":
        language = "Indonesian";
        break;
      case "kr":
        language = "Korean";
        break;
      case "en":
        language = "English";
        break;
    }
    return MovieDetail(movie,
        runtime: runtime, genre: genres[0]["name"], language: language);
  }
}
