import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/repositories/abstract_posts_repository.dart';
import 'package:test_project/repositories/posts/models/item_model.dart';
import '../widgets/widgets.dart';

class TestPageList extends StatefulWidget {
  const TestPageList({super.key, required this.title});

  final String title;

  @override
  State<TestPageList> createState() => _TestPageListState();
}

class _TestPageListState extends State<TestPageList> {

 List<PostItem>? _posts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(
      context,
    ); //Объявление переменной (так проще из контекста доставать тему что бы не писать это по 100 раз)
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            theme.colorScheme.inversePrimary, //Использование темы из контекста
        centerTitle: true, //Центрирование заголовка
        title: Text(
          widget.title,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ), //Использование темы из контекста
      ),
      body: ListView.separated(
        itemCount: _posts?.length ?? 10,
        separatorBuilder: (context, index) => Divider(
          color: theme.dividerTheme.color,
        ), //Разделитель между элементами списка
        itemBuilder: (context, i) {
          final titleName = _posts?[i].title ?? 'Hello World $i'; //Пример динамического текста
          final body = _posts?[i].body ?? 'Default body text';
          return ListTileWidg(titleName: titleName, body: body,);
        },
      ),
        floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
         _posts = await GetIt.I<AbstractPostsRepository>().fetchPosts();
         setState(() {
         });
        },
      )
    );
  }
}
