import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class TestPageList extends StatefulWidget {
  const TestPageList({super.key, required this.title});

  final String title;

  @override
  State<TestPageList> createState() => _TestPageListState();
}

class _TestPageListState extends State<TestPageList> {
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
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(
          color: theme.dividerTheme.color,
        ), //Разделитель между элементами списка
        itemBuilder: (context, i) {
          final titleName = 'Hello World $i'; //Пример динамического текста
          return ListTileWidg(titleName: titleName);
        },
      ),
    );
  }
}
