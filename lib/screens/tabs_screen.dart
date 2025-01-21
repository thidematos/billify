import 'package:billify/screens/new_bill.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/ui/logo.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Logo(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.mainBlue,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => NewBill()),
          );
        },
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
