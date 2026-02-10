import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/mdels/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';


class MoviedbDatasource extends MoviesDataSource{

    final dio=Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.themovieDbKey,
        'language': 'es-MX'
      }
    )
    );

  @override
  Future<List<Movie>> getNowPlayng({int page = 1}) async{

    final response= await dio.get('/movie/now_playing',
    queryParameters: {
      'page':page
    }
    );

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' )
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  } 

}