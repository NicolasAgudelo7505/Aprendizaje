import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieRepository{
  Future<List<Movie>> getNowPlayng({int page =1});
  }