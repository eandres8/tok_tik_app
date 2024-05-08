import 'package:flutter/material.dart';

import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepository;

  DiscoverProvider({
    required this.videosRepository,
  });

  bool initialLoading = true;
  List<VideoPost> videoList = [];

  Future<void> loadNextPage() async {
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videoList.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
