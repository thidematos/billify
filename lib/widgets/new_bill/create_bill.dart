import 'package:billify/data/enums.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/ui/space_24.dart';
import 'package:billify/widgets/dropdown_categories.dart';
import 'package:billify/widgets/new_bill/input_conta.dart';
import 'package:billify/widgets/new_bill/input_obs.dart';
import 'package:billify/widgets/new_bill/input_payment_type.dart';
import 'package:billify/widgets/new_bill/input_valor.dart';
import 'package:flutter/material.dart';

class CreateBill extends StatefulWidget {
  const CreateBill({super.key});

  @override
  State<CreateBill> createState() => _CreateBillState();
}

class _CreateBillState extends State<CreateBill> {
  String conta = '';

  final _formKey = GlobalKey<FormState>();

  void submitForm() {
    _formKey.currentState!.save();
    print(conta);
  }

  @override
  Widget build(BuildContext context) {
    final Widget isRecurrentContent = Column(
      children: [],
    );

    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 24,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 16),
                children: [
                  InputConta(conta),
                  Space24(),
                  InputValor(),
                  Space24(),
                  DropdownCategories(),
                  Space24(),
                  InputPaymentType(),
                  Space24(),
                  InputObs(),
                  Space24(),
                  OutlinedButton(
                      onPressed: () {
                        submitForm();
                      },
                      child: Text('Save')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* Descrição da conta (ex: aluguel, água, luz)
Data de vencimento
Valor da conta
Frequência (única, mensal, bimestral, etc.)
Categoria (opcional)
Observações (opcional) */
