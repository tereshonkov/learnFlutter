import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileWidg extends StatelessWidget {
  const ListTileWidg({super.key, required this.titleName, required this.body});

  final String titleName;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        style: theme.textTheme.bodyMedium, //Использование темы из контекста
      ),
      subtitle: Text(
        body ,
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
  }
}
