import 'package:billify/models/bill.dart';
import 'package:billify/providers/bills_provider.dart';
import 'package:billify/screens/new_bill.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/ui/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  Future<void> getTest() async {
    final test = await Supabase.instance.client.from('bills').select();

    print(test);
    print('fui eu mesmo!');
  }

  @override
  void initState() {
    getTest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Logo(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.mainBlue,
        shape: CircleBorder(),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => NewBill()),
          );
          setState(() {
            getTest();
          });
        },
        child: Icon(
          Icons.add,
          color: ColorTheme.mainWhite,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
