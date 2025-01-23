import 'package:billify/data/enums.dart';
import 'package:flutter/material.dart';

final Map<String, Map> categoriesWithIcons = {
  Categories.alimentacao.name: {
    'color': Colors.amber,
    'icon': Icons.emoji_food_beverage_outlined
  },
  Categories.impostos.name: {
    'color': const Color.fromARGB(255, 201, 53, 43),
    'icon': Icons.receipt_long_outlined
  },
  Categories.lazer.name: {
    'color': Colors.green,
    'icon': Icons.beach_access_outlined
  },
  Categories.moradia.name: {
    'color': const Color.fromARGB(255, 22, 103, 170),
    'icon': Icons.house_outlined
  },
  Categories.saude.name: {
    'color': Colors.purple,
    'icon': Icons.healing_outlined
  },
  Categories.outros.name: {
    'color': Colors.pink,
    'icon': Icons.book_online_outlined
  },
};
