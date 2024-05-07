import 'package:flutter/material.dart';

import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infrastructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videoList = [];

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideoPostList = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();

    videoList.addAll(newVideoPostList);
    initialLoading = false;

    notifyListeners();
  }
}
