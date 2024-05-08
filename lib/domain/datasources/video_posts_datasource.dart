import 'package:tok_tik/domain/entities/video_post.dart';

abstract class VideoPostDataSource {
  Future<List<VideoPost>> getTrendingVideosByUser(String userId);
  
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
