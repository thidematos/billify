import 'package:billify/data/enums.dart';
import 'package:billify/providers/form_provider.dart';

class Bill {
  Bill(
    this.conta,
    this.valor,
    this.categoria,
    this.obs,
    this.type, {
    this.vencimento,
    this.vencimentoDay,
    this.recorrencia,
  });

  final String conta;
  final double valor;
  final Categories categoria;
  final String obs;
  final ValidTypes type;
  int? vencimento;
  int? vencimentoDay;
  Intervals? recorrencia;
}
