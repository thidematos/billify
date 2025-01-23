import 'package:billify/data/enums.dart';
import 'package:billify/providers/form_provider.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputValor extends ConsumerWidget {
  const InputValor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onSaved: (value) {
        final String correctValue = value!.replaceAll(',', '.');
        ref.read(FormProvider.notifier).changeInputValue(
              MapKeys.valor,
              double.tryParse(correctValue),
            );
      },
    );
  }
}
