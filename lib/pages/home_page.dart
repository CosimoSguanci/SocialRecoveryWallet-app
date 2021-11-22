import 'package:flutter/material.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late String _walletAddress;
  late GlobalStateManager _globalStateManager;

  @override
  void initState() {
    _globalStateManager = GlobalStateManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Social Recovery Wallet'),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: _globalStateManager.getWalletAddress(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          _walletAddress = snapshot.data.toString();
                          return Text(
                            "Wallet address: $_walletAddress",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          );
                        })
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/create_new_social_recovery_wallet_page');
                  },
                  child: const Text('Create New Social Recovery Wallet',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/open_social_recovery_wallet_page');
                  },
                  child: const Text('Open Social Recovery Wallet',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        )));
  }
}
