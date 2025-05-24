import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/the-movie-db/movie_db.dart';
import 'package:cinemapedia/infrastructure/models/the-movie-db/movie_details.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieFromMovieDB movieDb) => Movie(
    adult: movieDb.adult,
    backdropPath: (movieDb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
      : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
    genreIds: movieDb.genreIds.map((id) => id.toString()).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath: (movieDb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
      : 'no-poster',
    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetailsResponse movieDb) => Movie(
    adult: movieDb.adult,
    backdropPath: (movieDb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
      : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
    genreIds: movieDb.genres.map((id) => id.name).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath: (movieDb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
      : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );
}
