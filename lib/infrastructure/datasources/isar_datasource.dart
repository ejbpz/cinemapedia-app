import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openBD();
  }

  Future<Isar> openBD() async {
    final dir = await getApplicationDocumentsDirectory();
    
    if(Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema], 
        inspector: true,
        directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> toggleFavorite(Movie movie) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    throw UnimplementedError();
  }
}