import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDataSource{
  Future<List<Movie>> getNowPlayng({int page =1});
  }