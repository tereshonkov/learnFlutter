import 'package:test_project/features/list/view/list_screen.dart';
import 'package:test_project/features/single_item/view/item_screen.dart';

final routes = {
  // Маршрутизация между экранами
  '/': (context) => const TestPageList(title: 'Home Page'),
  '/item': (context) => const ItemScreen(),
};
