import 'package:flutter/material.dart';

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