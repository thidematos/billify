import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';

class InputConta extends StatelessWidget {
  InputConta(this.conta, {super.key});

  String conta;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TypographyTheme.body,
      decoration: InputDecoration().copyWith(
        label: Text(
          'Conta',
          style: TypographyTheme.label,
        ),
      ),
      onSaved: (value) => conta = value!,
    );
  }
}
