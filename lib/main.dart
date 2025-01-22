import 'package:billify/providers/fcmProvider.dart';
import 'package:billify/screens/loading_screen.dart';
import 'package:billify/screens/tabs_screen.dart';
import 'package:billify/themes/geral_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initSupabase();
    initFirebase();
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseMessaging.instance.requestPermission();

    final fcmToken = await FirebaseMessaging.instance.getToken();

    if (fcmToken != null) {
      ref.read(FcmProvider.notifier).addFcm(fcmToken);
      print(fcmToken);
    }
  }

  Future<void> initSupabase() async {
    await dotenv.load(fileName: '.env');

    await Supabase.initialize(
      anonKey: dotenv.env['SUPABASE_ANOM_KEY']!,
      url: dotenv.env['SUPABASE_URL']!,
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
