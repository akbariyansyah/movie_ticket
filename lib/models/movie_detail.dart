import 'package:movie_ticket/models/movie.dart';

class MovieDetail extends Movie {
  String genre;
  String language;
  int runtime;
  MovieDetail(Movie movie, {this.genre, this.language, this.runtime})
      : super(
          id: movie.id,
          title: movie.title,
          overview: movie.overview,
          voteAverage: movie.voteAverage,
          backdropPath: movie.backdropPath,
          posterPath: movie.posterPath,
        );
}
