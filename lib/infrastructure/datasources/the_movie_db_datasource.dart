import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/the-movie-db/movie_db_response.dart';
import 'package:cinemapedia/infrastructure/models/the-movie-db/movie_details.dart';
import 'package:dio/dio.dart';

class TheMovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);

    return movieDbResponse.results
      .map((movieDB) => MovieMapper.movieDbToEntity(movieDB))
      .where((movieDB) => movieDB.posterPath != 'no-poster')
      .toList();
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', 
      queryParameters: {
        'page': page 
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', 
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if(response.statusCode != 200) throw Exception('Movie with id: $id, not found');

    final movieDB = MovieDetailsResponse.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDB);

    return movie;
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) async {
    if(query.isEmpty) return [];

    final response = await dio.get('/search/movie',
      queryParameters: {
        'query': query
      }  
    );

    return _jsonToMovies(response.data);
  }
}