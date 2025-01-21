import 'package:json_annotation/json_annotation.dart';

enum Frequency { mensal, trimestral, bimestral, anual }

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
