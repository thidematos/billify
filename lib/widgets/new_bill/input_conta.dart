import 'package:billify/providers/form_provider.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputConta extends ConsumerWidget {
  InputConta({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String conta = ref.watch(FormProvider)[MapKeys.conta] as String;

    return TextFormField(
      style: TypographyTheme.body,
      initialValue: conta,
      decoration: InputDecoration().copyWith(
        label: Text(
          'Conta',
          style: TypographyTheme.label,
        ),
      ),
      onSaved: (value) {
        ref.read(FormProvider.notifier).changeInputValue(MapKeys.conta, value);
      },
    );
  }
}
