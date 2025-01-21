import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/widgets/new_bill/create_bill.dart';
import 'package:flutter/material.dart';

class NewBill extends StatefulWidget {
  const NewBill({super.key});

  @override
  State<NewBill> createState() => _NewBillState();
}

class _NewBillState extends State<NewBill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorTheme.mainBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
          color: ColorTheme.mainWhite,
          iconSize: 32,
        ),
        title: Text(
          'Nova conta'.toUpperCase(),
          style: TypographyTheme.logo.copyWith(
              color: ColorTheme.mainWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              shadows: [
                Shadow(
                  color: ColorTheme.borderBlack,
                  blurRadius: 50,
                  offset: Offset(2, 4),
                )
              ]),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CreateBill(),
          ],
        ),
      ),
    );
  }
}
