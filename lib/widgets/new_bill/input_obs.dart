import 'package:billify/providers/form_provider.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputObs extends ConsumerWidget {
  const InputObs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentObs = ref.watch(FormProvider)[MapKeys.obs] as String;
    // TODO: implement build
    return TextFormField(
      initialValue: currentObs,
      maxLines: 3,
      minLines: 2,
      decoration: InputDecoration(
        label: Text(
          'Observações',
          style: TypographyTheme.label,
        ),
      ),
      onSaved: (value) {
        ref.read(FormProvider.notifier).changeInputValue(MapKeys.obs, value);
      },
    );
  }
}
