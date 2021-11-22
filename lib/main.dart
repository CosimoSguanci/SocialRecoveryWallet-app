import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';
import 'package:social_recovery_wallet_app/pages/create_new_social_recovery_wallet_page.dart';
import 'package:social_recovery_wallet_app/pages/guardian_social_recovery_wallet_page.dart';
import 'package:social_recovery_wallet_app/pages/home_page.dart';
import 'package:social_recovery_wallet_app/pages/open_social_recovery_wallet_page.dart';
import 'package:social_recovery_wallet_app/pages/spender_social_recovery_wallet_page.dart';
import 'package:social_recovery_wallet_app/pages/unlock_wallet_page.dart';

Future main() async {
  await dotenv.load(fileName: "dotenv");
  GlobalStateManager(); // Init global state...
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Recovery Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: const ColorScheme(
            primary: Colors.indigo,
            primaryVariant: Colors.indigo,
            secondary: Colors.deepOrangeAccent,
            secondaryVariant: Colors.deepOrangeAccent,
            background: Colors.white,
            surface: Colors.black,
            onBackground: Colors.white,
            error: Colors.redAccent,
            onError: Colors.redAccent,
            onPrimary: Colors.white,
            onSecondary: Colors.deepOrangeAccent,
            onSurface: Colors.blueGrey,
            brightness: Brightness.light,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => const UnlockWalletPage(),
        '/home_page': (context) => const HomePage(),
        '/create_new_social_recovery_wallet_page': (context) =>
            const CreateNewSocialRecoveryWalletPage(),
        '/open_social_recovery_wallet_page': (context) =>
            const OpenSocialRecoveryWalletPage(),
        '/spender_social_recovery_wallet_page': (context) =>
            const SpenderSocialRecoveryWalletPage(),
        '/guardian_social_recovery_wallet_page': (context) =>
            const GuardianSocialRecoveryWalletPage(),
      },
    );
  }
}
