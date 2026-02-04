import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mdels/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
    ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
    : 'https://m.media-amazon.com/images/M/MV5BZWYzMzZmMzYtYTQxMC00NWEzLTk0MGUtODQ5NjVjYTYyZTc1XkEyXkFqcGc@._V1_.jpg',
    genreIds: moviedb.genreIds.map((e)=> e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
    ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
    : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
