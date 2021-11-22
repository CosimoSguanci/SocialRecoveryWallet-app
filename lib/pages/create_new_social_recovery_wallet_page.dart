import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_recovery_wallet_app/global_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateNewSocialRecoveryWalletPage extends StatefulWidget {
  const CreateNewSocialRecoveryWalletPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateNewSocialRecoveryWalletPageState();
  }
}

class _CreateNewSocialRecoveryWalletPageState
    extends State<CreateNewSocialRecoveryWalletPage> {
  late GlobalStateManager _globalStateManager;
  late String _walletAddress;
  final List<String> _guardians = <String>[];
  final List<String> _trustedAddresses = <String>[];
  bool _showProgressIndicator = false;
  bool _showTx = false;
  late String _deployTxHash;
  final String etherscanBaseUrl = dotenv.env['CHAIN']
              .toString()
              .toLowerCase() !=
          "mainnet"
      ? "https://${dotenv.env['CHAIN'].toString().toLowerCase()}.etherscan.io/tx/"
      : "https://etherscan.io/tx/";

  final TextEditingController guardianController = TextEditingController();
  final TextEditingController trustedAddressController =
      TextEditingController();
  final TextEditingController numConfTxController = TextEditingController();
  final TextEditingController numConfChangeSpenderController =
      TextEditingController();
  final TextEditingController numConfAddTrustedAddressController =
      TextEditingController();

  @override
  void initState() {
    _globalStateManager = GlobalStateManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Social Recovery Wallet'),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 32.0, left: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: _globalStateManager.getWalletAddress(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          _walletAddress = snapshot.data.toString();
                          return Text("Wallet address: $_walletAddress",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold));
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
                          Text("Tx Hash: $_deployTxHash",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                              margin: const EdgeInsets.only(top: 16.0),
                              child: ElevatedButton(
                                  onPressed: () async => await launch(
                                      "$etherscanBaseUrl$_deployTxHash"),
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
                  children: [
                    Divider(color: Theme.of(context).colorScheme.primary),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Text("Guardians: ${_guardians.join(", ")}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: guardianController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add Guardian...'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          String address = guardianController.text;

                          if (_guardians.contains(address)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Guardian already added"),
                            ));
                          } else {
                            if (_globalStateManager
                                .checkAddressValidity(address)) {
                              setState(() {
                                _guardians.add(address);
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Incorrect Ethereum Address"),
                              ));
                            }
                          }
                          guardianController.text = "";
                        },
                        child: const Text('Add Guardian',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Divider(color: Theme.of(context).colorScheme.primary),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                                  "Trusted Addresses: ${_trustedAddresses.join(", ")}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: trustedAddressController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add Trusted Address...'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          String address = trustedAddressController.text;

                          if (_trustedAddresses.contains(address)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Trusted Address already added"),
                            ));
                          } else {
                            if (_globalStateManager
                                .checkAddressValidity(address)) {
                              setState(() {
                                _trustedAddresses.add(address);
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Incorrect Ethereum Address"),
                              ));
                            }
                          }
                          trustedAddressController.text = "";
                        },
                        child: const Text('Add Trusted Address',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Divider(color: Theme.of(context).colorScheme.primary),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                              "Number of confirmations to execute transactions",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: numConfTxController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                'Number of confirmations to execute transactions...'),
                      ),
                    ),
                    Divider(color: Theme.of(context).colorScheme.primary),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Text("Number of confirmations to change spender",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: numConfChangeSpenderController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                'Number of confirmations to change spender...'),
                      ),
                    ),
                    Divider(color: Theme.of(context).colorScheme.primary),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                              "Number of confirmations to add trusted addresses",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: numConfAddTrustedAddressController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                'Number of confirmations to add trusted addresses...'),
                      ),
                    ),
                    Divider(color: Theme.of(context).colorScheme.primary),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            int numConfTx = int.parse(numConfTxController.text);
                            int numConfChangeSpender =
                                int.parse(numConfChangeSpenderController.text);
                            int numConfAddTrustedAddress = int.parse(
                                numConfAddTrustedAddressController.text);
                            String spender = _walletAddress;

                            if (_guardians.isNotEmpty &&
                                numConfTx >= 0 &&
                                numConfChangeSpender >= 0 &&
                                numConfAddTrustedAddress >= 0) {
                              setState(() {
                                _showProgressIndicator = true;
                              });
                              var txHash = await _globalStateManager
                                  .deploySocialRecoverWallet(
                                      spender,
                                      _guardians,
                                      _trustedAddresses,
                                      numConfTx,
                                      numConfChangeSpender,
                                      numConfAddTrustedAddress);
                              setState(() {
                                _showProgressIndicator = false;
                                _showTx = true;
                                _deployTxHash = txHash;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Smart Contract creation transaction sent"),
                              ));
                            } else {
                              throw Exception();
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid Input"),
                            ));
                          }
                        },
                        child: const Text('DEPLOY',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
