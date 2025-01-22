import 'package:flutter_riverpod/flutter_riverpod.dart';

class FcmNotifier extends StateNotifier<String> {
  FcmNotifier() : super('');

  void addFcm(String fcm) {
    print('executei');
    state = fcm;
  }
}

final FcmProvider =
    StateNotifierProvider<FcmNotifier, String>((ref) => FcmNotifier());
