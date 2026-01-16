import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes =0,
    this.views =0,
  });

  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) => LocalVideoModel(
    name: json ['name'] ?? 'no video name', 
    videoUrl: json ['videoUrl'], 
    likes: json ['likes'], 
    views: json ['views'],
    );

    // esto no es necesario si la data es local, pero sí lo es si se está usando una API
    // Map<String, dynamic> toJson() => {
    //     "name": name,
    //     "videoUrl": videoUrl,
    //     "likes": likes,
    //     "views": views,
    // };

    VideoPost toVideoPostEntity() => VideoPost(
      caption:name ,
      videoUrl:videoUrl,
      likes:likes,
      views:views,
      );

}
