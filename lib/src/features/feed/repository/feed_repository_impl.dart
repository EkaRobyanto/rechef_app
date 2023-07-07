import 'package:rechef_app/src/features/feed/repository/feed_repository.dart';

class FeedRepositoryImpl extends FeedRepository {
  @override
  Future<dynamic> getFeedData(String token, String category) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value('');
  }
}
