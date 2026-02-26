import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {

  static Actor castToEntity(Cast cast)=> 
  Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://img.freepik.com/premium-vector/file-folder-mascot-character-design-vector_166742-4413.jpg?semt=ais_user_personalization&w=740&q=80', 
    character: cast.character, 
    originalName: cast.originalName, 
    job: cast.job != null
    ? 'https://image.tmdb.org/t/p/w500${cast.job}'
    : 'https://img.freepik.com/premium-vector/file-folder-mascot-character-design-vector_166742-4413.jpg?semt=ais_user_personalization&w=740&q=80',
    );

}