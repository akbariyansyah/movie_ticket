import 'package:movie_ticket/models/movie.dart';
import 'package:movie_ticket/services/movie_services.dart';
import 'package:bloc/bloc.dart';

class MovieState {}

class MovieEvent {}

class MovieInitial extends MovieState {}

class MovieLoaded extends MovieState {
  List<Movie> movies;
  MovieLoaded({this.movies});
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  @override
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    List<Movie> movies;
    if (state is MovieInitial) {
      movies = await MovieServices.getMovies();
      yield MovieLoaded(movies: movies);
    } else {
      yield MovieLoaded(movies: movies);
    }
  }
}
