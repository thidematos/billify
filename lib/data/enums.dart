import 'package:json_annotation/json_annotation.dart';

enum MapKeys {
  conta,
  valor,
  categoria,
  obs,
  type,
  vencimento,
  recorrencia,
  vencimentoDay,
  fcmToken,
}

enum ValidTypes { unico, recorrente }

enum Intervals { mensal, trimestral, semestral, anual }

enum Categories {
  moradia('Moradia'),
  saude('Saúde'),
  alimentacao('Alimentação'),
  lazer('Lazer'),
  impostos('Impostos'),
  outros('Outros');

  final String displayName;
  const Categories(this.displayName);
}
