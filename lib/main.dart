import 'package:flutter/material.dart';
import 'package:social_recovery_wallet_app/contracts/SocialRecoveryWallet.g.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';
import 'package:social_recovery_wallet_app/pages/create_new_social_recovery_wallet_page.dart';
import 'package:social_recovery_wallet_app/pages/home_page.dart';
import 'package:social_recovery_wallet_app/pages/open_social_recovery_wallet_page.dart';
import 'package:social_recovery_wallet_app/pages/unlock_wallet_page.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.teal,
          colorScheme: const ColorScheme(
            primary: Colors.teal,
            // <---- I set white color here
            primaryVariant: Colors.teal,
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
      //home: const UnlockWalletPage(title: 'Social Recovery Wallet'),
      initialRoute: '/',
      routes: {
        '/': (context) => const UnlockWalletPage(),
        '/home_page': (context) => const HomePage(),
        '/create_new_social_recovery_wallet_page': (context) =>
            const CreateNewSocialRecoveryWalletPage(),
        '/open_social_recovery_wallet_page': (context) =>
        const OpenSocialRecoveryWalletPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
/*

    var httpClient = Client();
    var ethClient = Web3Client(apiUrl, httpClient);

// You can now call rpc methods. This one will query the amount of Ether you own
    //EtherAmount balance = await ethClient.getBalance(credentials.address);
    //print(balance.getValueInUnit(EtherUnit.ether));
    final SRW = SocialRecoveryWalletNew(address: EthereumAddress.fromHex("0x6F2A4C3343b5700991e1879c25dF18613509D604"), client: ethClient);
    print(await SRW.getGuardians());*/
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
