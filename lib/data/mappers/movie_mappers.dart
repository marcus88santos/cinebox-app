import 'package:cinebox_app/data/models/movie_response.dart';
import 'package:cinebox_app/domain/models/movie.dart';

class MovieMappers {
  static List<Movie> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (response) => Movie(
            id: response.id,
            title: response.title,
            overview: response.overview,
            genreIds: response.genreIds ?? [],
            voteAverage: response.voteAverage,
            posterPath: response.posterPath,
            releaseDate: response.releaseDate,
            backdropPath: response.backdropPath,
          ),
        )
        .toList();
  }
}
