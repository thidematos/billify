import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';

class InputPaymentType extends StatefulWidget {
  const InputPaymentType({super.key});

  @override
  State<InputPaymentType> createState() => _InputPaymentTypeState();
}

class _InputPaymentTypeState extends State<InputPaymentType> {
  bool _isRecurrent = false;

  void changeIsRecurrent(status) {
    setState(() {
      _isRecurrent = status;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                onTap: () => changeIsRecurrent(false),
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
                onTap: () => changeIsRecurrent(true),
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
