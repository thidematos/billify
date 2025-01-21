import 'package:billify/screens/tabs_screen.dart';
import 'package:billify/themes/geral_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kGeralTheme,
      title: 'Billify',
      home: TabsScreen(),
    );
  }
}
