import 'package:billify/providers/bills_provider.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/widgets/home/containers/resumes.dart';
import 'package:billify/widgets/home/containers/to_be_paid.dart';
import 'package:billify/widgets/ui/logo.dart';
import 'package:billify/widgets/ui/welcome.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bills = ref.watch(fetchBillsProvider);

    return bills.when(
      data: (data) => Column(
        spacing: 24,
        children: [
          Welcome(),
          Resumes(),
          ToBePaid(),
        ],
      ),
      error: (error, stackTrace) => Text('There was an error!'),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
