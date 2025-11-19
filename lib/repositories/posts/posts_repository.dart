import 'package:dio/dio.dart';
import 'package:test_project/repositories/posts/models/item_model.dart';

class PostsRepository {
  Future<List<PostItem>> getPosts() async {
    final response = await Dio().get(
      'https://jsonplaceholder.typicode.com/posts',
      options: Options(
        headers: {'User-Agent': 'FlutterApp/1.0', 'Accept': 'application/json'},
      ),
    );
    final List<dynamic> data = response.data;
    return data.map((json) => PostItem.fromJson(json)).toList();
  }
}
