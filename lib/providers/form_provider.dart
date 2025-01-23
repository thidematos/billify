import 'package:billify/data/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormNotifier extends StateNotifier<Map<MapKeys, Object>> {
  FormNotifier()
      : super({
          MapKeys.conta: '',
          MapKeys.valor: 0,
          MapKeys.categoria: Categories.moradia,
          MapKeys.obs: '',
          MapKeys.type: ValidTypes.unico,
          MapKeys.vencimento: false,
          MapKeys.recorrencia: Intervals.mensal,
          MapKeys.vencimentoDay: 1,
        });

  void changeInputValue(MapKeys key, value) {
    state = {
      ...state,
      key: value,
    };
  }
}

final FormProvider = StateNotifierProvider<FormNotifier, Map<MapKeys, Object>>(
  (ref) => FormNotifier(),
);
