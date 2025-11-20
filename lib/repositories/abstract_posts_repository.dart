import 'package:test_project/repositories/posts/models/item_model.dart';

abstract class AbstractPostsRepository {
  Future<List<PostItem>> fetchPosts();
}