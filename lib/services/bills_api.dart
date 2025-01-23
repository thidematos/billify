import 'package:supabase_flutter/supabase_flutter.dart';

Future<List> getBills() async {
  final List bills = await Supabase.instance.client.from('bills').select();

  return bills;
}
