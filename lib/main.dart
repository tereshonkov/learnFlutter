import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue[300]!,
        ), //Цветовая схема на основе желтого цвета для хедера
        useMaterial3: true,
        brightness: Brightness.light, //Светлая тема
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          33,
          33,
          33,
        ), //Цвет фона приложения
        textTheme: TextTheme(
          //Тема текста
          bodyLarge: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          labelSmall: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.white24,
          thickness: 1,
        ), //Тема для разделителей
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white70,
        ), //Тема для иконок в ListTile
      ),
      routes: {
        // Маршрутизация между экранами
        '/': (context) => const TestPageList(title: 'Home Page'),
        '/item': (context) => const ItemScreen(),
      },
    );
  }
}

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
          return ListTile(
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: theme.listTileTheme.iconColor,
            ), //Иконка справа
            leading: SvgPicture.asset(
              'assets/image.svg',
              width: 40,
              height: 40,
            ), //Пример использования SVG изображения с левой стороны
            title: Text(
              titleName, //Пример текста
              style:
                  theme.textTheme.bodyMedium, //Использование темы из контекста
            ),
            subtitle: Text(
              '2000\$',
              style: theme.textTheme.labelSmall,
            ), //Пример текста с использованием темы из контекста
            onTap: () {
              //Действие при нажатии на элемент списка
              Navigator.of(context).pushNamed(
                '/item',
                arguments: titleName, //Передача аргументов на другой экран
              ); //Переход на другой экран по названию маршрута
            },
          );
        },
      ),
    );
  }
}

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  String? itemTitle; 

  @override
  void didChangeDependencies() {
    //Получение аргументов при изменении зависимостей
    final args = ModalRoute.of(
      context,
    )?.settings.arguments; //Получение аргументов из маршрута
    if (args is String) {
      itemTitle = args;
    }
    itemTitle = args as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: true, title: Text(itemTitle ?? 'Item'));
  }
}
