import 'package:cinemapedia/infrastructure/datasources/actor_movie_db_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(datasource: ActorMovieDbDatasource());
});