import 'package:dio/dio.dart';
import 'package:test_project/repositories/abstract_posts_repository.dart';
import 'package:test_project/repositories/posts/models/item_model.dart';

class PostsRepository implements AbstractPostsRepository {

  final Dio dio;
  PostsRepository({required this.dio});

  @override
  Future<List<PostItem>> fetchPosts() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
      options: Options(
        headers: {'User-Agent': 'FlutterApp/1.0', 'Accept': 'application/json'},
      ),
    );
    final List<dynamic> data = response.data;
    return data.map((json) => PostItem.fromJson(json)).toList();
  }
}
