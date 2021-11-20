import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';

class UnlockWalletPage extends StatefulWidget {
  const UnlockWalletPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UnlockWalletPageState();
  }
}

class _UnlockWalletPageState extends State<UnlockWalletPage> {
  final TextEditingController privateKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Import your Wallet'),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(
                      left: 10.0, top: 40.0, right: 10.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Expanded(
                        child: Center(
                            child: Text(
                          'Insert Private Key: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  )),
              Container(
                child: TextField(
                  obscureText: true,
                  controller: privateKeyController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Private Key...'),
                ),
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              ),
              ElevatedButton(
                onPressed: () {
                  String privateKey = privateKeyController.text;
                  try {
                    GlobalStateManager().setPrivateKey(privateKey);
                    Navigator.pushNamed(context, '/home_page');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Incorrect Private Key"),
                    ));
                  }
                },
                child:
                    const Text('Import', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        )));
  }
}
