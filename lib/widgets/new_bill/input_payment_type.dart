import 'package:billify/data/enums.dart';
import 'package:billify/providers/form_provider.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputPaymentType extends ConsumerStatefulWidget {
  const InputPaymentType({super.key});

  @override
  ConsumerState<InputPaymentType> createState() => _InputPaymentTypeState();
}

class _InputPaymentTypeState extends ConsumerState<InputPaymentType> {
  @override
  Widget build(BuildContext context) {
    final bool _isRecurrent =
        ref.watch(FormProvider)[MapKeys.type] as ValidTypes ==
            ValidTypes.recorrente;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        Text(
          'Tipo de pagamento',
          style: TypographyTheme.label.copyWith(
            fontSize: 16,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: _isRecurrent ? ColorTheme.grey : ColorTheme.mainBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorTheme.borderBlack,
                    offset: Offset(4, 4),
                    blurRadius: 40,
                  )
                ],
              ),
              width: 150,
              child: InkWell(
                onTap: () {
                  ref
                      .read(FormProvider.notifier)
                      .changeInputValue(MapKeys.type, ValidTypes.unico);
                },
                child: Text(
                  'Único'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: _isRecurrent
                      ? TypographyTheme.body.copyWith(
                          color: ColorTheme.mainWhite,
                        )
                      : TypographyTheme.switchLabel,
                ),
              ),
            ),
            const SizedBox(width: 36),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: _isRecurrent ? ColorTheme.mainBlue : ColorTheme.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorTheme.borderBlack,
                    offset: Offset(4, 4),
                    blurRadius: 40,
                  )
                ],
              ),
              width: 150,
              child: InkWell(
                onTap: () {
                  ref
                      .read(FormProvider.notifier)
                      .changeInputValue(MapKeys.type, ValidTypes.recorrente);
                },
                child: Text(
                  'Recorrente'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: _isRecurrent
                      ? TypographyTheme.switchLabel
                      : TypographyTheme.body.copyWith(
                          color: ColorTheme.mainWhite,
                        ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
