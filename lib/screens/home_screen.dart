import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/ui/logo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isLoading = true;
  List bills = [];

  Future<void> getBills() async {
    final data = await Supabase.instance.client.from('bills').select();

    setState(() {
      bills = data;
      isLoading = false;
    });
  }

  void initFirebaseNotification() {
    FirebaseMessaging.onMessage.listen(
      (event) {
        final notification = event.notification;
        if (notification == null) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: ColorTheme.secondaryBlue,
            content: Text(
              notification.body!,
              style: TypographyTheme.body.copyWith(color: ColorTheme.mainWhite),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    initFirebaseNotification();
    getBills();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Logo()],
    );
  }
}
