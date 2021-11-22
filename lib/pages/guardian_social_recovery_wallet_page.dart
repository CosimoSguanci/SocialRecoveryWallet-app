import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class GuardianSocialRecoveryWalletPage extends StatefulWidget {
  const GuardianSocialRecoveryWalletPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GuardianSocialRecoveryWalletPageState();
  }
}

class _GuardianSocialRecoveryWalletPageState
    extends State<GuardianSocialRecoveryWalletPage> {

  late GlobalStateManager _globalStateManager;
  late String _walletAddress;
  late String _socialRecoveryWalletAddress = "";
  //final List<String> _guardians = <String>[];
  //final List<String> _trustedAddresses = <String>[];
  bool _showTx = false;
  late String _txHash;
  final String etherscanBaseUrl = dotenv.env['CHAIN']
              .toString()
              .toLowerCase() !=
          "mainnet"
      ? "https://${dotenv.env['CHAIN'].toString().toLowerCase()}.etherscan.io/tx/"
      : "https://etherscan.io/tx/";

  final TextEditingController confirmTransactionIndexController = TextEditingController();
  final TextEditingController submitChangeSpenderRequestController = TextEditingController();
  final TextEditingController confirmChangeSpenderRequestIndexController = TextEditingController();

  @override
  void initState() {
    _globalStateManager = GlobalStateManager();
    _socialRecoveryWalletAddress =
        _globalStateManager.getCurrentSocialRecoveryWalletAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Social Recovery Wallet [GUARDIAN]'),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                margin: const EdgeInsets.only(left: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "Social Recovery Wallet Address: $_socialRecoveryWalletAddress", style: const TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              _showTx
                  ? Container(
                      margin: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Tx Hash: $_txHash", style:
                          const TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                              margin: const EdgeInsets.only(top: 16.0),
                              child: ElevatedButton(
                                  onPressed: () async =>
                                      await launch("$etherscanBaseUrl$_txHash"),
                                  child: const Text('View on Etherscan',
                                      style: TextStyle(color: Colors.white))))
                        ],
                      ))
                  : Container(),
              Container(
                  margin:
                  const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(color: Theme.of(context).colorScheme.primary),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Confirm Transaction",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: confirmTransactionIndexController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Transaction Index...'),
                        ),
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              var txHash = await _globalStateManager
                                  .confirmTransaction(int.parse(
                                      confirmTransactionIndexController.text));
                              setState(() {
                                _showTx = true;
                                _txHash = txHash;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Confirm Transaction sent"),
                              ));
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "ERROR: check the transaction ID and check if the transaction has already been executed"),
                              ));
                            }
                          },
                          child: const Text('Confirm Transaction',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Divider(color: Theme.of(context).colorScheme.primary),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Submit Change Spender Request",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: submitChangeSpenderRequestController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'New Spender...'),
                        ),
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            var txHash = await _globalStateManager
                                .submitChangeSpenderRequest(
                                    submitChangeSpenderRequestController.text);
                            setState(() {
                              _showTx = true;
                              _txHash = txHash;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text("Submit Change Spender Request sent"),
                            ));
                          },
                          child: const Text('Submit Change Spender Request',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Divider(color: Theme.of(context).colorScheme.primary),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Confirm Change Spender Request",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller:
                              confirmChangeSpenderRequestIndexController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Change Spender Request Index...'),
                        ),
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            var txHash = await _globalStateManager
                                .confirmChangeSpenderRequest(int.parse(
                                    confirmChangeSpenderRequestIndexController
                                        .text));
                            setState(() {
                              _showTx = true;
                              _txHash = txHash;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text("Confirm Change Spender Request sent"),
                            ));
                          },
                          child: const Text('Confirm Change Spender Request',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Divider(color: Theme.of(context).colorScheme.primary),
                    ],
                  )),
            ],
          ),
        )));
  }
}
