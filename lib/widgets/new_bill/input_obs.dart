import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';

class InputObs extends StatelessWidget {
  const InputObs({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      maxLines: 3,
      minLines: 2,
      decoration: InputDecoration(
        label: Text(
          'Observações',
          style: TypographyTheme.label,
        ),
      ),
    );
  }
}
