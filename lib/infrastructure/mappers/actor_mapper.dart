import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/the-movie-db/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast actor) => Actor(
    id: actor.id, 
    name: actor.name, 
    profilePath: actor.profilePath != null ? 'https://image.tmdb.org/t/p/w500/${actor.profilePath}' : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png', 
    character: actor.character
  );
}
