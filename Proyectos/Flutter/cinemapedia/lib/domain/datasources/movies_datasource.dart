import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieDataSource{
  Future<List<Movie>> getNowPlayng({int page =1});
  }