import 'package:flutter/material.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
  final List<String> _guardians = <String>[];
  final List<String> _trustedAddresses = <String>[];
  bool _showProgressIndicator = false;
  bool _showTx = false;
  late String _txHash;
  final String etherscanBaseUrl = dotenv.env['CHAIN']
              .toString()
              .toLowerCase() !=
          "mainnet"
      ? "https://${dotenv.env['CHAIN'].toString().toLowerCase()}.etherscan.io/tx/"
      : "https://etherscan.io/tx/";

  final TextEditingController confirmTransactionIndexController =
      TextEditingController();
  final TextEditingController submitChangeSpenderRequestController =
      TextEditingController();
  final TextEditingController confirmChangeSpenderRequestIndexController =
      TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: _globalStateManager.getWalletAddress(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          _walletAddress = snapshot.data.toString();
                          return Text("Wallet address: $_walletAddress");
                        })
                  ],
                ),
              ),
              _showTx
                  ? Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Tx Hash: $_txHash"),
                          Container(
                              margin: const EdgeInsets.only(top: 8.0),
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
                      const EdgeInsets.only(left: 10.0, top: 16.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
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
                            setState(() {
                              _showProgressIndicator = true;
                            });
                            var txHash = await _globalStateManager
                                .confirmTransaction(int.parse(
                                    confirmTransactionIndexController.text));
                            setState(() {
                              _showProgressIndicator = false;
                              _showTx = true;
                              _txHash = txHash;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Confirm Transaction sent"),
                            ));
                          },
                          child: const Text('Confirm Transaction',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
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
                            setState(() {
                              _showProgressIndicator = true;
                            });
                            var txHash = await _globalStateManager
                                .submitChangeSpenderRequest(
                                    submitChangeSpenderRequestController.text);
                            setState(() {
                              _showProgressIndicator = false;
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
                            setState(() {
                              _showProgressIndicator = true;
                            });
                            var txHash = await _globalStateManager
                                .confirmChangeSpenderRequest(int.parse(
                                    confirmChangeSpenderRequestIndexController
                                        .text));
                            setState(() {
                              _showProgressIndicator = false;
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
                    ],
                  )),
            ],
          ),
        )));
  }
}