import 'package:billify/screens/home_screen.dart';
import 'package:billify/screens/new_bill.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/widgets/ui/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  void refetchData() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => NewBill()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = HomeScreen();

    return Scaffold(
      appBar: AppBar(
        title: Logo(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: content,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.mainBlue,
        shape: CircleBorder(),
        onPressed: refetchData,
        child: Icon(
          Icons.add,
          color: ColorTheme.mainWhite,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
