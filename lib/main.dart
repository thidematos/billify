import 'package:billify/screens/loading_screen.dart';
import 'package:billify/screens/tabs_screen.dart';
import 'package:billify/themes/geral_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.requestPermission();

  final fcmToken = await FirebaseMessaging.instance.getToken();

  if (fcmToken != null) {
    print(fcmToken);
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  @override
  void initState() {
    initSupabase();
    super.initState();
  }

  Future<void> initSupabase() async {
    await Supabase.initialize(
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJheGl2ZWVyc2NuYXlnbm5lbXRvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc0NzEzMDcsImV4cCI6MjA1MzA0NzMwN30.mdDCqKzr1v1Shs5J-yyXVmDLrr1QQr8Ei-PHLHam2q4',
      url: 'https://baxiveerscnaygnnemto.supabase.co',
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = isLoading ? LoadingScreen() : TabsScreen();

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      theme: kGeralTheme,
      title: 'Billify',
      home: content,
    );
  }
}
