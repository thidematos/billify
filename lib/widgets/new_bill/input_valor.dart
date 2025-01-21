import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';

class InputValor extends StatelessWidget {
  const InputValor({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration().copyWith(
        label: Text(
          'Valor',
          style: TypographyTheme.label,
        ),
        prefixIcon: Icon(Icons.attach_money),
      ),
    );
  }
}
