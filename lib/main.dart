import 'package:test_project/repositories/abstract_posts_repository.dart';
import 'package:test_project/repositories/posts/posts_repository.dart';
import 'app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractPostsRepository>(() => PostsRepository(dio: Dio()));
  runApp(const MyApp());
}
