import 'package:cinebox_app/domain/models/movie.dart';

class MoviesByCategory {
  final List<Movie> popular;
  final List<Movie> topRated;
  final List<Movie> upcoming;
  final List<Movie> nowPlaying;

  MoviesByCategory({
    required this.popular,
    required this.topRated,
    required this.upcoming,
    required this.nowPlaying,
  });
}
