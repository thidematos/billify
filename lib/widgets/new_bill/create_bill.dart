import 'package:billify/data/enums.dart';
import 'package:billify/providers/bills_provider.dart';
import 'package:billify/providers/fcmProvider.dart';
import 'package:billify/providers/form_provider.dart';
import 'package:billify/utils/verify_expiration.dart';
import 'package:billify/widgets/ui/space_24.dart';
import 'package:billify/widgets/new_bill/dropdown_categories.dart';
import 'package:billify/widgets/new_bill/input_conta.dart';
import 'package:billify/widgets/new_bill/input_datepicker.dart';
import 'package:billify/widgets/new_bill/input_obs.dart';
import 'package:billify/widgets/new_bill/input_payment_type.dart';
import 'package:billify/widgets/new_bill/input_recurrent_day.dart';
import 'package:billify/widgets/new_bill/input_valor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateBill extends ConsumerStatefulWidget {
  const CreateBill({super.key});

  @override
  ConsumerState<CreateBill> createState() => _CreateBillState();
}

class _CreateBillState extends ConsumerState<CreateBill> {
  final _formKey = GlobalKey<FormState>();

  void submitForm() async {
    _formKey.currentState!.save();

    final Map<MapKeys, Object> formValues = ref.read(FormProvider);
    final String conta = formValues[MapKeys.conta] as String;
    final double valor = formValues[MapKeys.valor] as double;
    final Categories categoria = formValues[MapKeys.categoria] as Categories;
    final String obs = formValues[MapKeys.obs] as String;
    final ValidTypes type = formValues[MapKeys.type] as ValidTypes;
    final vencimento = formValues[MapKeys.vencimento];
    final int? vencimentoDay = formValues[MapKeys.vencimentoDay] as int?;
    final Intervals recorrencia = formValues[MapKeys.recorrencia] as Intervals;

    final Map<String, Object> toPost = {
      MapKeys.conta.name: conta,
      MapKeys.valor.name: valor,
      MapKeys.categoria.name: categoria.name,
      MapKeys.obs.name: obs,
      MapKeys.type.name: type.name,
      'fcm_token': ref.read(FcmProvider),
    };

    Map<String, bool>? verifications;

    if (type == ValidTypes.unico) {
      final DateTime parsedVencimento = vencimento as DateTime;

      toPost.addEntries({
        MapKeys.vencimento.name:
            parsedVencimento.millisecondsSinceEpoch as Object
      }.entries);

      verifications = verifyExpirationUnique(parsedVencimento);

      toPost.addEntries(verifications.entries);
    } else {
      toPost.addEntries({
        MapKeys.vencimentoDay.name: vencimentoDay as Object,
        MapKeys.recorrencia.name: recorrencia.name as Object
      }.entries);
      //Não há nenhuma lógica para handle com a recorrência ainda.
      verifications = verifyExpirationRecurrent(vencimentoDay!);
      toPost.addEntries(verifications.entries);
    }

    print(toPost);

    await Supabase.instance.client.from('bills').insert(toPost);

    ref.invalidate(fetchBillsProvider);

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isRecurrent =
        ref.watch(FormProvider)[MapKeys.type] as ValidTypes ==
            ValidTypes.recorrente;
    final Widget content =
        isRecurrent ? InputRecurrentDay() : InputDatepicker();

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
                  InputConta(),
                  Space24(),
                  InputValor(),
                  Space24(),
                  DropdownCategories(),
                  Space24(),
                  InputPaymentType(),
                  Space24(),
                  content,
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
