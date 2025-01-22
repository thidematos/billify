import 'package:billify/providers/form_provider.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/utils/formatDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputDatepicker extends ConsumerWidget {
  const InputDatepicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDate = ref.watch(FormProvider)[MapKeys.vencimento];
    final tenYearsAhead = DateTime(
        DateTime.now().year + 10, DateTime.now().month, DateTime.now().day);

    void getDate() async {
      selectedDate = await showDatePicker(
        helpText: 'Data de Vencimento',
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        firstDate: DateTime.now(),
        lastDate: tenYearsAhead,
        cancelText: 'Cancelar',
        locale: const Locale('pt', 'BR'),
      );

      ref.read(FormProvider.notifier).changeInputValue(
          MapKeys.vencimento, (selectedDate! as DateTime).toLocal());
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              'Data de vencimento:',
              style: TypographyTheme.body,
            ),
            IconButton(
              onPressed: () {
                getDate();
              },
              icon: Icon(
                size: 28,
                Icons.calendar_month,
                shadows: [
                  Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 5,
                      color: const Color.fromARGB(47, 68, 137, 255)),
                ],
                color: ColorTheme.tertiaryBlue,
              ),
            ),
          ],
        ),
        if (selectedDate != false)
          Text(
            formatDate(selectedDate as DateTime),
            style: TypographyTheme.body.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorTheme.validatedGreen,
            ),
          )
      ],
    );
  }
}
