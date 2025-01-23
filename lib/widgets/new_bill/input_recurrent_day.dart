import 'package:billify/data/enums.dart';
import 'package:billify/providers/form_provider.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputRecurrentDay extends ConsumerWidget {
  const InputRecurrentDay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Intervals currentValue =
        ref.watch(FormProvider)[MapKeys.recorrencia] as Intervals;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration().copyWith(
                  label: Text(
                'Todo dia',
                style: TypographyTheme.label,
              )),
              onSaved: (value) {
                ref.read(FormProvider.notifier).changeInputValue(
                      MapKeys.vencimentoDay,
                      int.tryParse(value!),
                    );
              },
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            width: 150,
            child: DropdownButtonFormField(
              value: currentValue,
              items: Intervals.values
                  .map(
                    (interval) => DropdownMenuItem(
                      value: interval,
                      child: Text(
                        interval.name.substring(0, 1).toUpperCase() +
                            interval.name.substring(1),
                        style: TypographyTheme.body,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                ref
                    .read(FormProvider.notifier)
                    .changeInputValue(MapKeys.recorrencia, value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
